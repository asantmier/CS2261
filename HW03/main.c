#include <stdlib.h>
#include "hw3Lib.h"
#include "game.h"
#include "text.h"

// hmm yes this looks shockingly similar to lab 4 (basic structure borrowed from there, not that there's gonna be much variation here)

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void goToGame();
void goToPause();
void goToLose();
void start();
void game();
void pause();
void lose();
void goToGameFromPause();

// States
enum {START, GAME, PAUSE, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

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
    REG_DISPCTL = MODE3 | BG2_ENABLE;

    goToStart();
}

void start() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
        srand(seed);
        initGame();
    }
}

void game() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (lives == 0) {
        goToLose();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGameFromPause();
    } 
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
        srand(seed);
        initGame();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToStart() {
    state = START;
    fillScreen(0x6F60); // random color I got from http://www.budmelvin.com/dev/15bitconverter.html
    drawString(((SCREENWIDTH - (24 * 6)) / 2), 60, "MARINE BIOLOGY SIMULATOR", BLACK);
    drawString(((SCREENWIDTH - (20 * 6)) / 2), 80, "press SELECT to play", WHITE);
    seed = 0;
}

void goToGame() {
    state = GAME;
    fillScreen(bgColor);

    // Draw HUD bar at top of the screen
    drawRect(0, 0, SCREENWIDTH, 10, BLACK);
    // Set up life and score counters
    drawString(1, 1, "Lives:", WHITE);
    drawString(SCREENWIDTH - 1 - 6 * 28, 1, "Score:", WHITE); // 12 letters
    drawString(SCREENWIDTH - 1 - 6 * 15, 1, "Hi-Score:", WHITE); // 15 letters + 1 spacer
	drawScore(1, 1, 6, hiscore, WHITE);
}

// annoying hacky work around to the HUD flickering for 1 frame when unpausing
void goToGameFromPause() {
    state = GAME;
    drawRect(((SCREENWIDTH - (6 * 6)) / 2), 60, (6 * 6), 8, bgColor);
    drawRect(((SCREENWIDTH - (23 * 6)) / 2), 90, (23 * 6), 8, bgColor);
    drawRect(((SCREENWIDTH - (34 * 6)) / 2), 100, (34 * 6), 8, bgColor);
}

void goToPause() {
    state = PAUSE;
    drawString(((SCREENWIDTH - (6 * 6)) / 2), 60, "PAUSED", BLACK);
    drawString(((SCREENWIDTH - (23 * 6)) / 2), 90, "press SELECT to unpause", BLACK);
    drawString(((SCREENWIDTH - (34 * 6)) / 2), 100, "press START to go to start screen", BLACK);
}

void goToLose() {
    state = LOSE;
    if (score > hiscore) { // show new high score text
        hiscore = score;
        drawString(1 + ((SCREENWIDTH - (6 * 15)) / 2), 1 + 20, "NEW HIGH SCORE!", BLACK); // shadow
        drawString(((SCREENWIDTH - (6 * 15)) / 2), 20, "NEW HIGH SCORE!", GREEN);
    }
    drawString(1 + ((SCREENWIDTH - (6 * 8)) / 2), 1 + 80, "YOU LOST", BLACK); // shadow
    drawString(((SCREENWIDTH - (6 * 8)) / 2), 80, "YOU LOST", RED);
    drawString(((SCREENWIDTH - (6 * 25)) / 2), 100, "press SELECT to try again", BLACK);
}
