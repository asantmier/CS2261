#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "tempspritesheet.h"
#include "game.h"

// Prototypes.
void initialize();

// State Prototypes.
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States.
enum {
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables.
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM.
OBJ_ATTR shadowOAM[128];
fp256 bg2xOff, bg2yOff;

// Timer for srand
int randTimer;

int main() {
    initialize();

    while (1) {
        // Update button variables.
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine.
        switch (state) {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

// Sets up GBA.
void initialize() {
    // The almighty DMA
    // Sprites
    DMANow(3, &tempspritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, &tempspritesheetTiles, &CHARBLOCK[4], DMA_32 | (tempspritesheetTilesLen / 4));
    // Backgrounds
    // BG2 contains the world. It's a 128x tile map so it uses the entire 3rd charblock for its map
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_4BPP | BG_SIZE_LARGE | BG_WRAP;
    *REG_BG2_AFFINE = bg_aff_default;

    // Move background back to its origin
    bg2xOff = 0;
    bg2yOff = 0;
    REG_BG2X = ENCODE24_8(bg2xOff);
    REG_BG2Y = ENCODE24_8(bg2yOff);

    // begone sprites
    hideSprites();
    DMANow(3, &shadowOAM, OAM, 128 * 4);

    REG_DISPCTL = MODE1 | SPRITE_ENABLE | BG2_ENABLE; // Bitwise OR the BG(s) you want to use and Bitwise OR SPRITE_ENABLE if you want to use sprites.
    // Don't forget to set up whatever BGs you enabled in the line above!

    buttons = BUTTONS;
    oldButtons = 0;
    randTimer = 0;

    // its gamer time
    goToStart();
}

// Sets up the start state.
void goToStart() {

    state = START;
}

// Runs every frame of the start state.
void start() {
    randTimer++;
    // if (BUTTON_PRESSED(BUTTON_START)) {
        // Seed RNG
        srand(randTimer);
        init();
        goToGame();
    // }

    waitForVBlank();

}

// Sets up the game state.
void goToGame() {

    state = GAME;
}

// Runs every frame of the game state.
void game() {
    update();
    
    waitForVBlank();

    DMANow(3, &shadowOAM, OAM, 128 * 4);
}

// Sets up the pause state.
void goToPause() {

    state = PAUSE;
}

// Runs every frame of the pause state.
void pause() {

    waitForVBlank();

}

// Sets up the win state.
void goToWin() {

    state = WIN;
}

// Runs every frame of the win state.
void win() {

    waitForVBlank();

}

// Sets up the lose state.
void goToLose() {

    state = LOSE;
}

// Runs every frame of the lose state.
void lose() {

    waitForVBlank();

}