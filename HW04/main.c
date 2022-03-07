#include <stdlib.h>
#include "HW04Lib.h"
#include "game.h"
#include "text.h"
#include "img_title.h"
#include "images.h"
// custom colors can start at index 192

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void goToGame();
void goToPause();
void goToWin();
void goToLose();
void start();
void game();
void pause();
void lose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

// Palette for game state sprites
u16 gamePal[256];

int main() {
    // Update seed out here instead of in the start state so that we can reset our game without needing to go back to the start
    seed++;

    initialize();

    while(1) {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch (state)
        {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

void initialize() {
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    // sound
    REG_SOUNDCNT_X = SND_ENABLED;
    REG_SOUNDCNT_L = DMG_VOL_LEFT(3) | DMG_VOL_RIGHT(3) | DMG_SND1_LEFT | DMG_SND1_RIGHT | DMG_SND2_LEFT | DMG_SND2_RIGHT;
    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);

    // Set up the palette we are gonna use for the game state
    const u16* palettes[] = { alien_1Pal, alien_2Pal, alien_3Pal, backgroundPal,
                          explosion_1Pal, explosion_2Pal, explosion_3Pal, spaceship_body_1Pal,
                          spaceship_body_2Pal, spaceship_body_3Pal, spaceship_body_4Pal, 
                          spaceship_jet_1Pal, spaceship_jet_2Pal };
    for (int i = 0; i < 13; i++) {
        for (int j = 0; j < 16; j++) {
            gamePal[(i * 16) + j] = *(palettes[i] + ((i * 16 ) + j));
        }
    }
    seed = 0;

    goToStart();
}

void start() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        srand(seed);
        goToGame();
        initGame(1);
    }
}

void game() {
    updateGame();
    drawGame();
    waitForVBlank();
    flipPage();
    // If the game signals we won a stage, reset the game for the next stage
    if (victory) {
        score += SCORE_STAGE;  // also give the player some points
        initGame(++stage);
    }
    if (gameOver) {
        goToLose();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
}

void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    } 
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        srand(seed);
        goToGame();
        initGame(1);
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToStart() {
    DMANow(3, img_titlePal, PALETTE, 256);
    DMANow(3, colors, PALETTE + BLACK_IDX, numColors);
    // Draw out background
    drawFullscreenImage4(img_titleBitmap);
    // Draw some text
    // 17 and 32 are colors taken from the background palette
    drawString4(((SCREENWIDTH - STRINGWIDTH(15)) / 2) + 1, 60, "GALAXY DEFENDER", 17);
    drawString4(((SCREENWIDTH - STRINGWIDTH(15)) / 2), 60, "GALAXY DEFENDER", 32);
    drawString4(((SCREENWIDTH - STRINGWIDTH(20)) / 2), 80, "press SELECT to play", WHITE_IDX);
    waitForVBlank();
    flipPage();
    state = START;
}

// Used exclusively by goToGame so no need for prototyping
void drawInitialGameScreen() {
        // background
        drawFullscreenImage4(backgroundBitmap);
        // HUD
        drawRect4(0, 0, SCREENWIDTH, HUD_HEIGHT, HUD_COLOR);
        drawString4(1, 1, "Lives:", WHITE_IDX);
		for (int i = 0; i < LIFEMAX; i++) {
			drawChar4(1 + STRINGWIDTH(6 + i), 1, 3, WHITE_IDX);
		}
        drawString4((SCREENWIDTH - STRINGWIDTH(8)) / 2, 1, "STAGE ", WHITE_IDX);
        drawInt4(((SCREENWIDTH - STRINGWIDTH(8)) / 2) + STRINGWIDTH(6), 1, 2, 1, WHITE_IDX);
        drawString4(SCREENWIDTH - 1 - STRINGWIDTH(12), 1, "Score:", WHITE_IDX);
        drawInt4(SCREENWIDTH - 1 - STRINGWIDTH(6), 1, 6, 0, WHITE_IDX);
}

void goToGame() {
    if (state == START || state == LOSE) {
        drawInitialGameScreen();
        // Now let's do it on the next page as well. We make the player wait another 16ms to start our game, it's ok.
        waitForVBlank();
        flipPage();
        // DMA after drawing so that we don't mess up the color scheme on the start screen
        DMANow(3, gamePal, PALETTE, 256);
        DMANow(3, colors, PALETTE + BLACK_IDX, numColors);
        
        drawInitialGameScreen();
    }
    state = GAME;
}

void goToPause() {
    // All of this text is on the gameplay part of the screen so it'll get wiped by drawGame()
    drawString4(((SCREENWIDTH - STRINGWIDTH(6)) / 2), 60, "PAUSED", WHITE_IDX);
    drawString4(((SCREENWIDTH - STRINGWIDTH(23)) / 2), 90, "press SELECT to unpause", WHITE_IDX);
    drawString4(((SCREENWIDTH - STRINGWIDTH(37)) / 2), 100, "press START to go to the start screen", WHITE_IDX);
    waitForVBlank();
    flipPage();
    state = PAUSE;
}

void goToLose() {
    // Show the final score
    drawString4((SCREENWIDTH - STRINGWIDTH(13 + 6)) / 2, 18, "Final Score: ", WHITE_IDX);
    if (score > hiscore) { // show new high score text
        hiscore = score;
        // Change the color of the score if its a new high
        drawInt4((SCREENWIDTH - STRINGWIDTH(13 + 6)) / 2 + STRINGWIDTH(13), 18, 6, score, GREEN_IDX);
        drawString4(1 + ((SCREENWIDTH - STRINGWIDTH(15)) / 2), 1 + 30, "NEW HIGH SCORE!", DARKGREEN_IDX); // shadow
        drawString4(((SCREENWIDTH - STRINGWIDTH(15)) / 2), 30, "NEW HIGH SCORE!", GREEN_IDX);
    } else {
        drawInt4((SCREENWIDTH - STRINGWIDTH(13 + 6)) / 2 + STRINGWIDTH(13), 18, 6, score, WHITE_IDX);
    }
    drawString4(1 + ((SCREENWIDTH - STRINGWIDTH(9)) / 2), 1 + 80, "GAME OVER", DARKRED_IDX); // shadow
    drawString4(((SCREENWIDTH - STRINGWIDTH(9)) / 2), 80, "GAME OVER", RED_IDX);
    drawString4(((SCREENWIDTH - STRINGWIDTH(25)) / 2), 100, "press SELECT to try again", WHITE_IDX);
    drawString4(((SCREENWIDTH - STRINGWIDTH(37)) / 2), 110, "press START to go to the start screen", WHITE_IDX);
    waitForVBlank();
    flipPage();
    state = LOSE;
}
