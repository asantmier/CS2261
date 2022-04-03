#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "game.h"
#include "tempspritesheet.h"
#include "tempbackground.h"
#include "tempsplash.h"
#include "tempinstructions.h"
#include "temppause.h"
#include "tempwin.h"
#include "templose.h"
#include "print.h"

// Prototypes.
void initialize();

// State Prototypes.
void goToStart();
void start();
void goToInstructions();
void instructions();
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
    INSTRUCTIONS,
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
    // Enable debug logging
    mgba_open();

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
        case INSTRUCTIONS:
            instructions();
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
    // Turn of display so the weirdest thing the player sees is black
    REG_DISPCTL = MODE1;
    // The almighty DMA
    // Sprites
    DMANow(3, &tempspritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, &tempspritesheetTiles, &CHARBLOCK[4], DMA_32 | (tempspritesheetTilesLen / 4));
    // Backgrounds
    // BG0 contains the splashscreen. Later it will contain the battle background
    DMANow(3, &tempsplashTiles, &CHARBLOCK[1], DMA_32 | (tempsplashTilesLen / 4));
    DMANow(3, &tempsplashMap, &SCREENBLOCK[15], DMA_32 | (tempsplashMapLen / 4));
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(15) | BG_8BPP | BG_SIZE_SMALL;
    // BG1 contains the instructions. Later it will contain the parallax background
    DMANow(3, &tempinstructionsTiles, &CHARBLOCK[2], DMA_32 | (tempinstructionsTilesLen / 4));
    DMANow(3, &tempinstructionsMap, &SCREENBLOCK[23], DMA_32 | (tempinstructionsMapLen / 4));
    REG_BG1CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(23) | BG_8BPP | BG_SIZE_SMALL;
    // BG2 contains the world. It's a 128x tile map so it uses the entire 3rd charblock for its map
    DMANow(3, &tempbackgroundTiles, &CHARBLOCK[0], DMA_32 | (tempbackgroundTilesLen / 4));
    DMANow(3, &tempbackgroundMap, &SCREENBLOCK[24], DMA_32 | (tempbackgroundMapLen / 4));
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_8BPP | BG_SIZE_LARGE | BG_WRAP;
    *REG_BG2_AFFINE = bg_aff_default;
    // Move background back to its origin
    bg2xOff = 0;
    bg2yOff = 0;
    REG_BG2X = ENCODE24_8(bg2xOff);
    REG_BG2Y = ENCODE24_8(bg2yOff);
    // begone sprites
    hideSprites();
    DMANow(3, &shadowOAM, OAM, 128 * 4);

    // gaming: activated
    REG_DISPCTL = MODE1 | SPRITE_ENABLE | BG2_ENABLE;

    buttons = BUTTONS;
    oldButtons = 0;
    randTimer = 0;

    // its gamer time
    goToStart();
}

// Sets up the start state.
void goToStart() {
    DMANow(3, &tempsplashPal, PALETTE, 256);
    REG_DISPCTL = MODE1 | SPRITE_ENABLE | BG0_ENABLE;

    state = START;
}

// Runs every frame of the start state.
void start() {
    randTimer++;
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    } else if (BUTTON_PRESSED(BUTTON_START)) {
        // Seed RNG
        srand(randTimer);
        init();
        goToGame();
    }

    waitForVBlank();

}

// Sets up instructions
void goToInstructions() {
    DMANow(3, &tempinstructionsPal, PALETTE, 256);
    REG_DISPCTL = MODE1 | SPRITE_ENABLE | BG1_ENABLE;

    state = INSTRUCTIONS;
}

// Runs every frame of instructions
void instructions() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

    waitForVBlank();

}

// Sets up the game state.
void goToGame() {
    DMANow(3, &tempbackgroundPal, PALETTE, 256);
    REG_DISPCTL = MODE1 | SPRITE_ENABLE | BG2_ENABLE;

    state = GAME;
}

// Runs every frame of the game state.
void game() {
    update();

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    } else if (BUTTON_PRESSED(BUTTON_L)) {
        goToWin();
    } else if (BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }
    
    waitForVBlank();

    DMANow(3, &shadowOAM, OAM, 128 * 4);
    REG_BG2X = ENCODE24_8(bg2xOff);
    REG_BG2Y = ENCODE24_8(bg2yOff);
}

// Sets up the pause state.
void goToPause() {
    DMANow(3, &temppausePal, PALETTE, 256);
    DMANow(3, &temppauseTiles, &CHARBLOCK[1], DMA_32 | (temppauseTilesLen / 4));
    DMANow(3, &temppauseMap, &SCREENBLOCK[15], DMA_32 | (temppauseMapLen / 4));
    REG_DISPCTL = MODE1 | BG0_ENABLE;

    state = PAUSE;
}

// Runs every frame of the pause state.
void pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_START)) {
        initialize(); // restart the game
    }

    waitForVBlank();

}

// Sets up the win state.
void goToWin() {
    DMANow(3, &tempwinPal, PALETTE, 256);
    DMANow(3, &tempwinTiles, &CHARBLOCK[1], DMA_32 | (tempwinTilesLen / 4));
    DMANow(3, &tempwinMap, &SCREENBLOCK[15], DMA_32 | (tempwinMapLen / 4));
    REG_DISPCTL = MODE1 | BG0_ENABLE;

    state = WIN;
}

// Runs every frame of the win state.
void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize(); // restart the game
    }

    waitForVBlank();

}

// Sets up the lose state.
void goToLose() {
    DMANow(3, &templosePal, PALETTE, 256);
    DMANow(3, &temploseTiles, &CHARBLOCK[1], DMA_32 | (temploseTilesLen / 4));
    DMANow(3, &temploseMap, &SCREENBLOCK[15], DMA_32 | (temploseMapLen / 4));
    REG_DISPCTL = MODE1 | BG0_ENABLE;

    state = LOSE;
}

// Runs every frame of the lose state.
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize(); // restart the game
    }

    waitForVBlank();

}