#include <stdlib.h>
#include <stdio.h>
#include "HW05Lib.h"
#include "title.h"
#include "level1.h"
#include "level2.h"
#include "spritesheet.h"
#include "game.h"

// Prototypes.
void initialize();

// State Prototypes.
void goToStart();
void start();
void goToGame(int level);
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
    // Load up all of the image data since we have enough room to store it all at launch
    DMANow(3, &titlePal, PALETTE, 256); // The 3 background palettes are merged into this one
    DMANow(3, &titleTiles, &CHARBLOCK[0], DMA_32 | (titleTilesLen / 4));
    DMANow(3, &titleMap, &SCREENBLOCK[28], DMA_32 | (titleMapLen / 4));
    DMANow(3, &level1Tiles, &CHARBLOCK[1], DMA_32 | (level1TilesLen / 4));
    DMANow(3, &level1Map, &SCREENBLOCK[29], DMA_32 | (level1MapLen / 4));
    DMANow(3, &level2Tiles, &CHARBLOCK[2], DMA_32 | (level2TilesLen / 4));
    DMANow(3, &level2Map, &SCREENBLOCK[30], DMA_32 | (level2MapLen / 4));
    DMANow(3, &spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, &spritesheetTiles, &CHARBLOCK[4], DMA_32 | (spritesheetTilesLen / 4));

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(29) | BG_8BPP | BG_SIZE_SMALL;
    REG_BG2CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(30) | BG_8BPP | BG_SIZE_SMALL;

    hideSprites();
    DMANow(3, &shadowOAM, OAM, 128 * 4);

    REG_DISPCTL = MODE0 | SPRITE_ENABLE | BG0_ENABLE; // Bitwise OR the BG(s) you want to use and Bitwise OR SPRITE_ENABLE if you want to use sprites.
    // Don't forget to set up whatever BGs you enabled in the line above!

    buttons = BUTTONS;
    oldButtons = 0;

    goToStart();
}

// Sets up the start state.
void goToStart() {
    REG_DISPCTL = MODE0 | SPRITE_ENABLE | BG0_ENABLE;
    hideSprites();
    waitForVBlank();
    DMANow(3, &shadowOAM, OAM, 128 * 4);

    state = START;
}

// Runs every frame of the start state.
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        init(1);
        goToGame(1);
    }
    waitForVBlank();
}

// Sets up the game state.
void goToGame(int level) {
    switch (level)
    {
    case 1:
        REG_DISPCTL = MODE0 | SPRITE_ENABLE | BG1_ENABLE;
        break;
    case 2:
        REG_DISPCTL = MODE0 | SPRITE_ENABLE | BG2_ENABLE;
        break;
    }

    state = GAME;
}

// Runs every frame of the game state.
void game() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        hammerTimer = 300;
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        hammerTimer = 0;
    }
    update();
    waitForVBlank();
    DMANow(3, &shadowOAM, OAM, 128 * 4);
}

// Sets up the pause state.
void goToPause() {}

// Runs every frame of the pause state.
void pause() {}

// Sets up the win state.
void goToWin() {}

// Runs every frame of the win state.
void win() {}

// Sets up the lose state.
void goToLose() {}

// Runs every frame of the lose state.
void lose() {}