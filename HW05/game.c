#include "HW05Lib.h"
#include "game.h"

ANI mario;
int hammerTimer = 0;
int hammerState = UP;

void init() {
    initMario();
}

void initMario() {
    mario.x = 80;
    mario.y = 100;
}

void update() {
    updateMario();
}

void updateMario() {
    // Reset mario's movement vectory
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
    if (mario.timer % 5) {
        mario.curFrame = (mario.curFrame + 1) % 3;
    }

    // Take player input and update mario's state accordingly
    int idle = 0;
    if (BUTTON_HELD(BUTTON_LEFT)) {
        mario.dx = -MARIO_SPEED;
        mario.state = LEFT;
    } else if (BUTTON_HELD(BUTTON_RIGHT)) {
        mario.dx = MARIO_SPEED;
        mario.state = RIGHT;
    } else {
        idle = 1;
    }

    // Update mario's position
    mario.x += mario.dx;
    mario.y += mario.dy;

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