#include "HW05Lib.h"
#include "game.h"

ANI mario;
int hammerTimer;
int hammerState;
int level;
int jump;
int jumpTimer;
int ladder;
ANI dk;
ANI pauline;

void init(int newlevel) {
    level = newlevel;

    initMario();
    initDK();
    initPauline();
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
        mario.x = 80;
        mario.y = 100;
        mario.state = LEFT;
        break;
    }
}

void initDK() {
    dk.width = 8 * 8;
    dk.height = 4 * 8;
    dk.timer = 0;
    dk.curFrame = 0;
    dk.state = NORMAL;
    switch (level)
    {
    case 1:
        dk.x = 24;
        dk.y = 0;
        break;
    case 2:
        dk.x = 100;
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
        pauline.x = 80;
        pauline.y = 0;
        break;
    case 2:
        pauline.x = 40;
        pauline.y = 0;
        break;
    }
}

void update() {
    updateMario();
    updateDK();
    updatePauline();
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

    mario.timer++;
}

void updateDK() {

}

void updatePauline() {
    
}
