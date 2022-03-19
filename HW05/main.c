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

    // The priority of all backgrounds is set to 1 so that we can use some basic sprite priority
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL | 1;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(29) | BG_8BPP | BG_SIZE_SMALL | 1;
    REG_BG2CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(30) | BG_8BPP | BG_SIZE_SMALL | 1;

    hideSprites();
    DMANow(3, &shadowOAM, OAM, 128 * 4);

    REG_DISPCTL = MODE0 | SPRITE_ENABLE | BG0_ENABLE; // Bitwise OR the BG(s) you want to use and Bitwise OR SPRITE_ENABLE if you want to use sprites.
    // Don't forget to set up whatever BGs you enabled in the line above!

    buttons = BUTTONS;
    oldButtons = 0;
    randTimer = 0;

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
        // Set up the game
        srand(randTimer);
        levelsCleared = 0;
        score = 0;
        lives = 3;
        init(1);
        goToGame(1);
    }
    waitForVBlank();
    randTimer++;
}

// Sets up the game state.
void goToGame(int level) {
    // Make sure the right background is active
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
    // Pause the game if select is pressed
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    update();
    waitForVBlank();
    DMANow(3, &shadowOAM, OAM, 128 * 4);
    if (lives <= 0) {
        goToLose();
    }
    if (levelsCleared == 3) {
        goToWin();
    }
}

// Sets up the pause state.
void goToPause() {
    state = PAUSE;
}

// Runs every frame of the pause state.
void pause() {
    // Resume the game
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame(level);
    }
    waitForVBlank();
}

// Sets up the win state.
void goToWin() {
    // Draw some text
    shadowOAM[GAME_OVER_IDX].attr0 = ((SCREENHEIGHT / 2) - 8) | ATTR0_REGULAR | ATTR0_WIDE;
    shadowOAM[GAME_OVER_IDX].attr1 = ((SCREENWIDTH / 2) - 40) | ATTR1_LARGE;
    shadowOAM[GAME_OVER_IDX].attr2 = ATTR2_TILEID(21, 20) | ATTR2_PRIORITY(0);
    DMANow(3, &shadowOAM, OAM, 128 * 4);

    state = WIN;
}

// Runs every frame of the win state.
void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
    waitForVBlank();
}

// Sets up the lose state.
void goToLose() {
    // Draw some text that's slightly too large for one sprite
    shadowOAM[GAME_OVER_IDX].attr0 = ((SCREENHEIGHT / 2) - 8) | ATTR0_REGULAR | ATTR0_WIDE;
    shadowOAM[GAME_OVER_IDX].attr1 = ((SCREENWIDTH / 2) - 40) | ATTR1_LARGE;
    shadowOAM[GAME_OVER_IDX].attr2 = ATTR2_TILEID(0, 25) | ATTR2_PRIORITY(0);
    shadowOAM[GAME_OVER_IDX + 1].attr0 = ((SCREENHEIGHT / 2) - 8) | ATTR0_REGULAR | ATTR0_SQUARE;
    shadowOAM[GAME_OVER_IDX + 1].attr1 = (((SCREENWIDTH / 2) - 40) + 64) | ATTR1_SMALL;
    shadowOAM[GAME_OVER_IDX + 1].attr2 = ATTR2_TILEID(8, 25) | ATTR2_PRIORITY(0);
    DMANow(3, &shadowOAM, OAM, 128 * 4);

    state = LOSE;
}

// Runs every frame of the lose state.
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
    waitForVBlank();
}