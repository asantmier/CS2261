#include <stdlib.h>
#include "lab04Lib.h"
#include "game.h"
#include "text.h"

// Prototypes
void initialize();

// State Prototypes
// TODO 1.2: Add your state and state transition function prototypes here
void goToStart();
void goToGame();
void goToPause();
void goToWin();
void goToLose();
void start();
void game();
void pause();
void win();
void lose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        // TODO 1.0: Make the state machine here 
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
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // TODO 1.3: Call your goToStart function here
    goToStart();
}

// TODO 1.1: Make your state and state transition functions
void start() {
    seed++;
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
    if (ballsRemaining == 0) {
        goToWin();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    } 
    // if (BUTTON_PRESSED(BUTTON_B)) {
    //     goToWin();
    // } 
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToLose();
    }
    
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    } 
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void win() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToStart() {
    state = START;
    // DON'T wait for VBlank because this is gonna flicker no matter what
    fillScreen(PINK);
    drawString(((240 - (20 * 6)) / 2), 80, "press SELECT to play", MAGENTA);
    seed = 0;
}

void goToGame() {
    state = GAME;
    fillScreen(BLACK);
    //drawString(0, 0, "gaming", WHITE);
}

void goToPause() {
    state = PAUSE;
    fillScreen(BLUE);
    drawString(((240 - (6 * 6)) / 2), 80, "paused", BLACK);
}

void goToWin() {
    state = WIN;
    fillScreen(GREEN);
    drawString(((240 - (8 * 6)) / 2), 80, "you win!", BLACK);
}

void goToLose() {
    state = LOSE;
    fillScreen(RED);
    drawString(((240 - (9 * 6)) / 2), 80, "you lose!", BLACK);
}

// TODO 2.1: Add drawString calls for each state transition function inside your state machine    



