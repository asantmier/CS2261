#include "HW05Lib.h"
#include "game.h"
#include <stdlib.h>

ANI mario;
int hammerTimer;
int hammerState;
int level;
int jump;
int jumpTimer;
int ladder;
ANI dk;
ANI pauline;
int levelsCleared;
int barrelTimer;
ANI barrels[NUM_BARREL];
int lives;
int score;
ANI hammer;

void init(int newlevel) {
    levelsCleared++;
    level = newlevel;
    // Place our hammer and turn on the right background
    switch (level)
    {
    case 1:
        REG_DISPCTL = MODE0 | SPRITE_ENABLE | BG1_ENABLE;
        hammer.x = 51;
        hammer.y = 74;
        hammer.active = 1;
        break;
    case 2:
        hammer.x = 60;
        hammer.y = 91;
        hammer.active = 1;
        REG_DISPCTL = MODE0 | SPRITE_ENABLE | BG2_ENABLE;
        break;
    }

    initMario();
    initDK();
    initPauline();
    initBarrels();
}

void initMario() {
    hammerTimer = 0;
    hammerState = UP;
    jump = 0;
    jumpTimer = 0;
    ladder = 0;
    mario.width = 16;
    mario.height = 16;
    mario.timer = 0;
    mario.curFrame = 0;
    switch (level)
    {
    case 1:
        mario.x = 184;
        mario.y = 151 - 16 + 1;
        mario.state = LEFT;
        break;
    case 2:
        mario.x = 176;
        mario.y = 135;
        mario.state = LEFT;
        break;
    }
}

void initDK() {
    barrelTimer = 0;
    dk.width = 8 * 8;
    dk.height = 4 * 8;
    dk.timer = 0;
    dk.curFrame = 0;
    dk.state = NORMAL;
    switch (level)
    {
    case 1:
        dk.x = 32;
        dk.y = 0;
        break;
    case 2:
        dk.x = 85;
        dk.y = 0;
        break;
    }
}

void initPauline() {
    pauline.width = 16;
    pauline.height = 32;
    pauline.timer = 0;
    pauline.curFrame = 0;
    pauline.state = RIGHT;
    switch (level)
    {
    case 1:
        pauline.x = 120;
        pauline.y = 0;
        break;
    case 2:
        pauline.x = 77;
        pauline.y = 0;
        break;
    }
}

void initBarrels() {
    for (int i = 0; i < NUM_BARREL; i++) {
        barrels[i].curFrame = 0;
        barrels[i].dx = 0;
        barrels[i].dy = 0;
        barrels[i].height = 16;
        barrels[i].width = 16;
        barrels[i].state = NORMAL;
        barrels[i].timer = 0;
        barrels[i].x = 0;
        barrels[i].y = 0;
        barrels[i].active = 0;
        shadowOAM[BARREL_IDX + i].attr0 = ATTR0_HIDE;
    }
}

void update() {
    updateMario();
    updateDK();
    updatePauline();
    updateBarrels();
    updateHUD();
    // Render the hammer or hide it
    if (hammer.active) {
        shadowOAM[HAMMER_IDX].attr0 = hammer.y | ATTR0_REGULAR | ATTR0_SQUARE;
        shadowOAM[HAMMER_IDX].attr1 = hammer.x | ATTR1_SMALL;
        shadowOAM[HAMMER_IDX].attr2 = ATTR2_TILEID(4, 6) | ATTR2_PRIORITY(1);
    } else {
        shadowOAM[HAMMER_IDX].attr0 = ATTR0_HIDE;
    }
}

void updateMario() {
    // Reset mario's movement vector
    mario.dx = 0;
    mario.dy = 0;

    // If the hammer is active, swap hammer states every few frames
    if (hammerTimer > 0) {
        if (!(hammerTimer % 4)) {
            hammerState = hammerState ? 0 : 1;
        }

        hammerTimer--;
    }

    // Change the animation frame every few frames
    if (!(mario.timer % 3)) {
        mario.curFrame = (mario.curFrame + 1) % 3;
    }

    // Take player input and update mario's state accordingly
    int idle = 1;
    // Try to climb up a ladder
    if (!jump && hammerTimer <= 0 && BUTTON_HELD(BUTTON_UP) && colorAt(mario.x + (mario.width / 2), mario.y + mario.height - 1, level) == 3) {
        mario.dy = -1;
        mario.state = BACK;
        idle = 0;
        ladder = 1;
        int newx, newy;
        if (checkCollisionMap(mario.x + (mario.width / 2), mario.y + mario.height - 1, 0, mario.dy, level, &newx, &newy)) {
            ladder = 0;
            mario.y -= 2; // teleport mario staright up to the ground to avoid collision checks
            mario.dy = 0;
            mario.state = LEFT;
        }
    }
    // Try to move down a ladder
    if (ladder && BUTTON_HELD(BUTTON_DOWN)) {
        mario.dy = 1;
        idle = 0;
        int newx, newy;
        if (checkCollisionMap(mario.x + (mario.width / 2), mario.y + mario.height - 1, 0, mario.dy, level, &newx, &newy)) {
            ladder = 0;
            mario.dy = 0;
            mario.state = LEFT;
        }
    }
    // If we aren't on a ladder, then try to move left or right or jump
    if (!ladder) {
        if (BUTTON_HELD(BUTTON_LEFT)) {
            mario.dx = -MARIO_SPEED;
            mario.state = LEFT;
            idle = 0;
        } else if (BUTTON_HELD(BUTTON_RIGHT)) {
            mario.dx = MARIO_SPEED;
            mario.state = RIGHT;
            idle = 0;
        }
        if (BUTTON_PRESSED(BUTTON_A) && !jump) {
            jump = 1;
            jumpTimer = 30;
            idle = 0;
        }
    }
    
    // Jumping logic
    if (!jump && !ladder) {
        mario.dy = 1;
    } else {
        if (jumpTimer > 10) {
            mario.dy = -1;
        } else if (jumpTimer > 0) {
            mario.dy = 0;
        } else {
            jump = 0;
        }
        
        jumpTimer--;
    }
    
    // Update mario's position
    int newx, newy;
    checkCollisionMap(mario.x + (mario.width / 2), mario.y + mario.height - 1, mario.dx, mario.dy, level, &newx, &newy);
    mario.x = newx - (mario.width / 2);
    mario.y = newy - mario.height + 1;
    if (mario.x < LEFT_BOUND) {
        mario.x = LEFT_BOUND;
    } else if (mario.x + mario.width > RIGHT_BOUND) {
        mario.x = RIGHT_BOUND - mario.width;
    }

    // If the player didn't move, set their frame and timer back to 0
    if (idle) {
        mario.timer = 0;
        mario.curFrame = 0;
    }

    // Set the mario sprite
    if (hammerTimer > 0) { // weird hammer logic
        if (hammerState == UP) { // hammer is lifted up
            shadowOAM[MARIO_IDX].attr0 = (mario.y - 16) | ATTR0_REGULAR | ATTR0_TALL;
            shadowOAM[MARIO_IDX].attr1 = mario.x | ATTR1_MEDIUM;
            if (mario.state == RIGHT) { // facing right
                shadowOAM[MARIO_IDX].attr2 = ATTR2_TILEID(12, mario.curFrame * 4);
            } else { // facing left
                shadowOAM[MARIO_IDX].attr2 = ATTR2_TILEID(10, mario.curFrame * 4);
            }
        } else { // hammer is lifted down
            shadowOAM[MARIO_IDX].attr0 = mario.y | ATTR0_REGULAR | ATTR0_WIDE;
            if (mario.state == RIGHT) { // facing right
                shadowOAM[MARIO_IDX].attr1 = mario.x | ATTR1_MEDIUM;
                shadowOAM[MARIO_IDX].attr2 = ATTR2_TILEID(14, mario.curFrame * 2);
            } else { // facing left
                shadowOAM[MARIO_IDX].attr1 = (mario.x - 16) | ATTR1_MEDIUM;
                shadowOAM[MARIO_IDX].attr2 = ATTR2_TILEID(6, mario.curFrame * 2);
            }
        }
    } else { // simple math
        shadowOAM[MARIO_IDX].attr0 = mario.y | ATTR0_REGULAR | ATTR0_SQUARE;
        shadowOAM[MARIO_IDX].attr1 = mario.x | ATTR1_SMALL;
        shadowOAM[MARIO_IDX].attr2 = ATTR2_TILEID(mario.state * 2, mario.curFrame * 2);
    }

    // check if mario is touching pauline
    if (collision(mario.x, mario.y, mario.width, mario.height, pauline.x, pauline.y, pauline.width, pauline.height)) {
        score += 1000;
        if (level == 1) {
            init(2);
        } else {
            init(1);
        }
    }
    // or donkey kong
    // cooldown is just a quicky and dirty way to give mario some iframes
    static int cooldown = 60;
    if (cooldown == 0) {
        if (collision(mario.x, mario.y, mario.width, mario.height, dk.x, dk.y, dk.width, dk.height)) {
            lives--;
            cooldown = 60;
        }
    } else {
        cooldown--;
    }
    // or a barrel
    for (int i = 0; i < NUM_BARREL; i++) {
        if (barrels[i].active) {
            if (hammerTimer > 0) {
                if (collision(mario.x - 16, mario.y - 16, mario.width + 16, mario.height + 16, barrels[i].x, barrels[i].y, barrels[i].width, barrels[i].height)) {
                    score += 800;
                    barrels[i].active = 0;
                }
            } else {
                if (collision(mario.x, mario.y, mario.width, mario.height, barrels[i].x, barrels[i].y, barrels[i].width, barrels[i].height)) {
                    lives--;
                    barrels[i].active = 0;
                } else if (!barrels[i].scored && collision(mario.x, mario.y, mario.width, mario.height, barrels[i].x, barrels[i].y - barrels[i].height, barrels[i].width, barrels[i].height)) {
                    score += 400;
                    barrels[i].scored = 1;
                }
            }
        }
    }
    // or a hammer
    if (hammer.active && collision(mario.x, mario.y, mario.width, mario.height, hammer.x, hammer.y, 16, 16)) {
        hammerTimer = 180;
        hammer.active = 0;
    }

    mario.timer++;
}

void updateDK() {
    // Change the animation frame every few frames
    if (!(dk.timer % 30)) {
        if (dk.state == NO_BARREL) {
            dk.state = BARREL;
        } else if (dk.state == BARREL) {
            dk.state = NORMAL;
            barrelTimer = 0;
            throwBarrel();
        } else {
            dk.curFrame = (dk.curFrame + 1) % 4;
        }
    }

    // update barrel timer
    if (barrelTimer == 180) {
        dk.state = NO_BARREL;
        dk.timer = 0;
    }

    // Set the sprite
    shadowOAM[DK_IDX].attr0 = dk.y | ATTR0_REGULAR | ATTR0_WIDE;
    shadowOAM[DK_IDX].attr1 = dk.x | ATTR1_LARGE;
    // DK's priority is always 1 so that he won't cover up any UI
    switch (dk.state)
    {
    case NORMAL:
        switch (dk.curFrame)
        {
        case 0:
            shadowOAM[DK_IDX].attr2 = ATTR2_TILEID(24, 12) | ATTR2_PRIORITY(1);
            break;
        case 1:
            shadowOAM[DK_IDX].attr2 = ATTR2_TILEID(8, 12) | ATTR2_PRIORITY(1);
            break;
        case 2:
            shadowOAM[DK_IDX].attr2 = ATTR2_TILEID(16, 12) | ATTR2_PRIORITY(1);
            break;
        case 3:
            shadowOAM[DK_IDX].attr2 = ATTR2_TILEID(24, 12) | ATTR2_PRIORITY(1);
            break;
        }
        break;
    case NO_BARREL:
        shadowOAM[DK_IDX].attr2 = ATTR2_TILEID(0, 12) | ATTR2_PRIORITY(1);
        break;
    case BARREL:
        shadowOAM[DK_IDX].attr2 = ATTR2_TILEID(0, 16) | ATTR2_PRIORITY(1);
        break;
    }

    dk.timer++;
    barrelTimer++;
}

void updatePauline() {

    // Change the animation frame every few frames
    if (!(pauline.timer % 60)) {
        pauline.curFrame = (pauline.curFrame + 1) % 2;
    }

    // Set the sprite
    shadowOAM[PAULINE_IDX].attr0 = pauline.y | ATTR0_REGULAR | ATTR0_TALL;
    shadowOAM[PAULINE_IDX].attr1 = pauline.x | ATTR1_MEDIUM;
    shadowOAM[PAULINE_IDX].attr2 = ATTR2_TILEID(20 + pauline.curFrame * 2, 0);

    pauline.timer++;
}

void updateBarrels() {
    for (int i = 0; i < NUM_BARREL; i++) {
        if (barrels[i].active) {
            // Update position
            int newx, newy, cooly;
            int falling = 0;
            // First let's try to fall
            if(!checkCollisionMap(barrels[i].x + barrels[i].adder, barrels[i].y + barrels[i].height - 1, 0, barrels[i].dy, level, &newx, &newy)) {
                cooly = newy;
                // We fell! Lets try again
                if (!checkCollisionMap(barrels[i].x + barrels[i].adder, barrels[i].y + barrels[i].height - 1 + 1, 0, barrels[i].dy, level, &newx, &newy)) {
                    // We fell again! We must be at the end of a platform or on a ladder.
                    falling = 1;
                    barrels[i].wasFalling = 1;
                }
            }
            // Now if we aren't falling and didn't fall last frame, lets see if there's a ladder below us with a little random chance
            if (!falling && !barrels[i].wasFalling && colorAt(barrels[i].x + barrels[i].adder, barrels[i].y + barrels[i].height - 1 + 2, level) == 3 && rand() % 18 == 0) {
                // There is! Lets start falling down it by teleporting through the floor
                cooly = barrels[i].y + barrels[i].height - 1 + 2;
                falling = 1;
                barrels[i].wasFalling = 1;
            }
            // Now we're going to move the barrel
            int oldx = barrels[i].x;
            int oldy = barrels[i].y;
            if (!falling) {
                // If we just hit the ground, flip the direction
                if (barrels[i].wasFalling) {
                    if (barrels[i].state == RIGHT) {
                        barrels[i].state = LEFT;
                        barrels[i].dx = -1;
                        barrels[i].adder = barrels[i].width - 1;
                    } else if (barrels[i].state == LEFT) {
                        barrels[i].state = RIGHT;
                        barrels[i].dx = 1;
                        barrels[i].adder = 0;
                    }
                    barrels[i].wasFalling = 0;
                }
                // Otherwise, just move normally
                checkCollisionMap(barrels[i].x + barrels[i].adder, barrels[i].y + barrels[i].height - 1, barrels[i].dx, barrels[i].dy, level, &newx, &newy);
                barrels[i].x = newx - barrels[i].adder;
                barrels[i].y = newy - barrels[i].height + 1;
            } else {
                // If we're falling, only move vertically
                barrels[i].y = cooly - barrels[i].height + 1;
            }
            // Make sure the barrel stays in bounds
            if (barrels[i].x < LEFT_BOUND) {
                barrels[i].x = LEFT_BOUND;
            } else if (barrels[i].x + barrels[i].width > RIGHT_BOUND) {
                barrels[i].x = RIGHT_BOUND - barrels[i].width;
            }
            // If the barrel didn't move we can deactivate it
            if (barrels[i].x == oldx && barrels[i].y == oldy) {
                barrels[i].active = 0;
                shadowOAM[BARREL_IDX + i].attr0 = ATTR0_HIDE;
                continue;
            }

            // Change the animation frame every few frames
            if (!(barrels[i].timer % 4)) {
                barrels[i].curFrame = (barrels[i].curFrame + 1) % 4;
            }

            // Draw the barrel
            shadowOAM[BARREL_IDX + i].attr0 = (barrels[i].y + 3) | ATTR0_REGULAR | ATTR0_SQUARE;
            if (barrels[i].state == LEFT) {
                switch (barrels[i].curFrame)
                {
                case 0:
                    if (falling) {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(0, 10);
                    } else {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(4, 10);
                    }
                    break;
                case 1:
                    if (falling) {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(2, 10);
                    } else {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL | ATTR1_VFLIP;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(4, 10);
                    }
                    break;
                case 2:
                    if (falling) {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(0, 10);
                    } else {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(6, 10);
                    }
                    break;
                case 3:
                    if (falling) {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(2, 10);
                    } else {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL | ATTR1_VFLIP;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(6, 10);
                    }
                    break;
                }
            } else {
                switch (barrels[i].curFrame)
                {
                case 0:
                    if (falling) {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(0, 10);
                    } else {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL | ATTR1_HFLIP;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(4, 10);
                    }
                    break;
                case 1:
                    if (falling) {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(2, 10);
                    } else {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL | ATTR1_VFLIP | ATTR1_HFLIP;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(4, 10);
                    }
                    break;
                case 2:
                    if (falling) {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(0, 10);
                    } else {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL | ATTR1_HFLIP;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(6, 10);
                    }
                    break;
                case 3:
                    if (falling) {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(2, 10);
                    } else {
                        shadowOAM[BARREL_IDX + i].attr1 = barrels[i].x | ATTR1_SMALL | ATTR1_VFLIP | ATTR1_HFLIP;
                        shadowOAM[BARREL_IDX + i].attr2 = ATTR2_TILEID(6, 10);
                    }
                    break;
                }
            }

            barrels[i].timer++;
        } else {
            shadowOAM[BARREL_IDX + i].attr0 = ATTR0_HIDE;
        }
    }
}

void updateHUD() {
    // draw information
    // Everything has priority 0 so it always shows up
    int y = 0;
    int start = 140;
    shadowOAM[L_PARAN_IDX].attr0 = y | ATTR0_REGULAR | ATTR0_TALL;
    shadowOAM[L_PARAN_IDX].attr1 = start | ATTR1_TINY;
    shadowOAM[L_PARAN_IDX].attr2 = ATTR2_TILEID(0, 22) | ATTR2_PRIORITY(0);
    shadowOAM[M_IDX].attr0 = y | ATTR0_REGULAR | ATTR0_SQUARE;
    shadowOAM[M_IDX].attr1 = (start + (8 * 1)) | ATTR1_TINY;
    shadowOAM[M_IDX].attr2 = ATTR2_TILEID(1, 22) | ATTR2_PRIORITY(0);
    shadowOAM[LIFECOUNT_IDX].attr0 = (y + 8) | ATTR0_REGULAR | ATTR0_SQUARE;
    shadowOAM[LIFECOUNT_IDX].attr1 = (start + (8 * 1)) | ATTR1_TINY;
    shadowOAM[LIFECOUNT_IDX].attr2 = ATTR2_TILEID(lives, 20) | ATTR2_PRIORITY(0);
    shadowOAM[M1_PARAN_IDX].attr0 = y | ATTR0_REGULAR | ATTR0_TALL;
    shadowOAM[M1_PARAN_IDX].attr1 = (start + (8 * 2)) | ATTR1_TINY;
    shadowOAM[M1_PARAN_IDX].attr2 = ATTR2_TILEID(2, 22) | ATTR2_PRIORITY(0);
    for (int i = 0; i < 5; i++) {
        shadowOAM[HIGHSCORE_TXT_IDX + i].attr0 = y | ATTR0_REGULAR | ATTR0_SQUARE;
        shadowOAM[HIGHSCORE_TXT_IDX + i].attr1 = (start + (8 * (3 + 1 + i))) | ATTR1_TINY;
        shadowOAM[HIGHSCORE_TXT_IDX + i].attr2 = ATTR2_TILEID(5 + i, 21) | ATTR2_PRIORITY(0);
    }
    // Theres a little math here to draw numbers as text
    int denominator = 1;
    for (int i = 6; i >= 0; i--) {
        shadowOAM[HIGHSCORE_NUM_IDX + i].attr0 = (y + 8) | ATTR0_REGULAR | ATTR0_SQUARE;
        shadowOAM[HIGHSCORE_NUM_IDX + i].attr1 = (start + (8 * (3 + i))) | ATTR1_TINY;
        shadowOAM[HIGHSCORE_NUM_IDX + i].attr2 = ATTR2_TILEID(((score % (10 * denominator)) / denominator), 20) | ATTR2_PRIORITY(0);
        denominator *= 10;
    }
    shadowOAM[M2_PARAN_IDX].attr0 = y | ATTR0_REGULAR | ATTR0_TALL;
    shadowOAM[M2_PARAN_IDX].attr1 = (start + (8 * 10)) | ATTR1_TINY;
    shadowOAM[M2_PARAN_IDX].attr2 = ATTR2_TILEID(2, 22) | ATTR2_PRIORITY(0);
    shadowOAM[L_IDX].attr0 = y | ATTR0_REGULAR | ATTR0_SQUARE;
    shadowOAM[L_IDX].attr1 = (start + (8 * 11)) | ATTR1_TINY;
    shadowOAM[L_IDX].attr2 = ATTR2_TILEID(7, 22) | ATTR2_PRIORITY(0);
    shadowOAM[LEVELCOUNT_IDX].attr0 = (y + 8) | ATTR0_REGULAR | ATTR0_SQUARE;
    shadowOAM[LEVELCOUNT_IDX].attr1 = (start + (8 * 11)) | ATTR1_TINY;
    shadowOAM[LEVELCOUNT_IDX].attr2 = ATTR2_TILEID(levelsCleared, 20) | ATTR2_PRIORITY(0);
    shadowOAM[R_PARAN_IDX].attr0 = y | ATTR0_REGULAR | ATTR0_TALL;
    shadowOAM[R_PARAN_IDX].attr1 = (start + (8 * 12)) | ATTR1_TINY;
    shadowOAM[R_PARAN_IDX].attr2 = ATTR2_TILEID(8, 22) | ATTR2_PRIORITY(0);

}

void throwBarrel() {
    for (int i = 0; i < NUM_BARREL; i++) {
        if (!barrels[i].active) {
            barrels[i].active = 1;
            barrels[i].dy = 1; // gravity for falling
            barrels[i].curFrame = 0;
            barrels[i].timer = 0;
            barrels[i].wasFalling = 0;
            barrels[i].scored = 0;
            switch (level)
            {
            case 1:
                barrels[i].x = 96;
                barrels[i].y = 16;
                barrels[i].dx = 1;
                barrels[i].state = RIGHT;
                barrels[i].adder = 0;
                break;
            case 2:
                if(rand() % 2) {
                    barrels[i].x = 144;
                    barrels[i].y = 16;
                    barrels[i].dx = 1;
                    barrels[i].state = RIGHT;
                    barrels[i].adder = 0;
                } else {
                    barrels[i].x = 80;
                    barrels[i].y = 16;
                    barrels[i].dx = -1;
                    barrels[i].state = LEFT;
                    barrels[i].adder = barrels[i].width - 1;
                }
                break;
            }
            break;
        }
    }
}
