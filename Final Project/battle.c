#include <stdlib.h>
#include <stdio.h>
// #include "mode0.h"
#include "print.h"
#include "battle.h"

// Take the character and subtract CHAR_START. -1 is invalid
const int text_tile_lkup[] = {TILE_EXCLAMATION,TILE_QUOTE,TILE_POUND,TILE_CURRENCY,
TILE_PERCENT,TILE_AMPERSAND,TILE_APOSTROPHE,TILE_LPARANTHESIS,TILE_RPARANTHESIS,
TILE_ASTERISK,TILE_PLUS,TILE_COMMA,TILE_MINUS,TILE_PERIOD,TILE_FSLASH,TILE_0,TILE_1,
TILE_2,TILE_3,TILE_4,TILE_5,TILE_6,TILE_7,TILE_8,TILE_9,TILE_COLON,TILE_SEMICOLON,
TILE_LANGLED,TILE_EQUAL,TILE_RANGLED,TILE_QUESTION,TILE_AT,TILE_A,TILE_B,TILE_C,TILE_D,
TILE_E,TILE_F,TILE_G,TILE_H,TILE_I,TILE_J,TILE_K,TILE_L,TILE_M,TILE_N,TILE_O,TILE_P,
TILE_Q,TILE_R,TILE_S,TILE_T,TILE_U,TILE_V,TILE_W,TILE_X,TILE_Y,TILE_Z,TILE_LSQUARE,
TILE_BSLASH,TILE_RSQUARE,TILE_CARROT,TILE_UNDERSCORE,TILE_GRAVE};

int lettersActive;
int battleStatus;
enum { ACTIONS, ATTACKS, TARGETSELECT };
int menu;
enum { PLAYERTURN, ENEMYTURN };
int turn;
int menuOption;
enum { PASS = 1, PUNCH, KICK };
int action;
int target;
int go;

// Sets up the battle state
void initBattle(int opponentType) {
    battleStatus = ONGOING;
    lettersActive = 0;
    turn = PLAYERTURN;
    menu = ACTIONS;
    menuOption = 0;
    action = 0;
    target = 0;
    go = 0;
    resetOpponents();
    // Figure out who started the fight and put them on the enemy team
    switch (opponentType)
    {
    case SHARK:
        battleOpponents[0].exists = 1;
        battleOpponents[0].hp = 14;
        battleOpponents[0].damage = 6;
        break;
    // case FISH: // by default all enemies are a fish
    default:
        battleOpponents[0].exists = 1;
        battleOpponents[0].hp = 8;
        battleOpponents[0].damage = 5;
        break;
    }
    // Then draw the teams
    drawCombatants();
}

// sets all the opponents to not exist
void resetOpponents() {
    for (int i = 0; i < 4; i++) {
        battleOpponents[i].exists = 0;
    }
}

// Returns an asterisk if cond is true and a space otherwise
// Useful for showing where the player's cursor is
char tsel(int cond) {
    return cond ? '*' : ' ';
}

// Updates the battle state every frame
void updateBattle() {
    // Be warned this is super in progress and more of a proof of concept
    static char buf[128]; // buffer for sprintf
    static int turnwait = 120; // timer between turns
    // First off, if the active team is ready to take its action, do it
    if (go && turnwait == 120) {
        // This is the first frame of the action, set up the visuals and do the things
        if (turn == PLAYERTURN) {
            int oldhp = 0;
            switch (action)
            {
            case PASS:
                eraseAllText();
                drawText("PLAYER PASSES", TEXT_TOP_X, TEXT_TOP_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
                break;
            case PUNCH:
                oldhp = battleOpponents[target].hp;
                battleOpponents[target].hp -= battleAllies[0].damage;
                eraseAllText();
                sprintf(buf, "YOU ATTACK ENEMY %d", target);
                drawText(buf, TEXT_TOP_X, TEXT_TOP_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
                sprintf(buf, "HP %d->%d", oldhp, battleOpponents[target].hp);
                drawText(buf, TEXT_BOTTOM_X, TEXT_BOTTOM_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
                break;
            case KICK:
                oldhp = battleOpponents[target].hp;
                battleOpponents[target].hp -= battleAllies[0].damage;
                eraseAllText();
                sprintf(buf, "YOU ATTACK ENEMY %d", target);
                drawText(buf, TEXT_TOP_X, TEXT_TOP_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
                sprintf(buf, "HP %d->%d", oldhp, battleOpponents[target].hp);
                drawText(buf, TEXT_BOTTOM_X, TEXT_BOTTOM_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
                break;
            }
        } else { // ENEMYTURN
            int oldhp = 0;
            switch (action)
            {
            case PASS:
                eraseAllText();
                drawText("ENEMY PASSES", TEXT_TOP_X, TEXT_TOP_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
                break;
            case PUNCH:
                oldhp = battleAllies[target].hp;
                battleAllies[target].hp -= battleOpponents[0].damage;
                eraseAllText();
                sprintf(buf, "ENEMY ATTACKS ALLY %d", target);
                drawText(buf, TEXT_TOP_X, TEXT_TOP_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
                sprintf(buf, "HP %d->%d", oldhp, battleAllies[target].hp);
                drawText(buf, TEXT_BOTTOM_X, TEXT_BOTTOM_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
                break;
            case KICK:
                oldhp = battleAllies[target].hp;
                battleAllies[target].hp -= battleOpponents[0].damage;
                eraseAllText();
                sprintf(buf, "ENEMY ATTACKS ALLY %d", target);
                drawText(buf, TEXT_TOP_X, TEXT_TOP_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
                sprintf(buf, "HP %d->%d", oldhp, battleAllies[target].hp);
                drawText(buf, TEXT_BOTTOM_X, TEXT_BOTTOM_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
                break;
            }
        }
        turnwait--;
        return;
    } else if (go && turnwait > 0) {
        // Now we just wait a bit so the player can see what happened
        turnwait--;
        return;
    } else if (go) {
        // Now we reset everything for the next turn to start
        turnwait = 120;
        if (turn == PLAYERTURN) {
            turn = ENEMYTURN;
        } else {
            turn = PLAYERTURN;
        }
        menu = ACTIONS;
        menuOption = 0;
        action = 0;
        target = 0;
        go = 0;
        // Check to see if combat has been won
        int allyAlive = 0;
        int playerAlive = battleAllies[0].hp > 0;
        for (int i = 0; i < 4; i++) {
            if (battleAllies[i].exists) {
                if (battleAllies[i].hp > 0) {
                    allyAlive = 1;
                    break;
                }
            }
        }
        if (!allyAlive || !playerAlive) {
            battleStatus = LOST;
            return;
        }
        int enemyAlive = 0;
        for (int i = 0; i < 4; i++) {
            if (battleOpponents[i].exists) {
                if (battleOpponents[i].hp > 0) {
                    enemyAlive = 1;
                    break;
                }
            }
        }
        if (!enemyAlive) {
            battleStatus = WON;
            return;
        }
    }
    
    int enter = 0;
    int leave = 0;
    // take player input
    if (turn == PLAYERTURN) {
        if (BUTTON_PRESSED(BUTTON_DOWN)) {
            menuOption++;
        } else if (BUTTON_PRESSED(BUTTON_UP)) {
            menuOption--;
        }
        if (BUTTON_PRESSED(BUTTON_RIGHT)) {
            menuOption += 3;
        } else if (BUTTON_PRESSED(BUTTON_LEFT)) {
            menuOption -= 3;
        }
        if (BUTTON_PRESSED(BUTTON_A)) {
            enter = 1;
        }
        if (BUTTON_PRESSED(BUTTON_B)) {
            leave = 1;
        }
    }
    
    // Choose an action
    if (turn == PLAYERTURN) {
        // Interpret the player's input
        switch (menu)
        {
        case ACTIONS:
            if (menuOption > 1) {
                menuOption = 1;
            } else if (menuOption < 0) {
                menuOption = 0;
            }
            if (enter) {
                if (menuOption == 0) {
                    menuOption = 0;
                    menu = ATTACKS;
                } else if (menuOption == 1) {
                    action = PASS;
                    go = 1;
                }
            }
            if (leave) {
                // Do nothing
            }
            break;
        case ATTACKS:
            if (menuOption > 1) {
                menuOption = 1;
            } else if (menuOption < 0) {
                menuOption = 0;
            }
            if (enter) {
                if (menuOption == 0) {
                    action = PUNCH;
                    menuOption = 0;
                    menu = TARGETSELECT;
                } else if (menuOption == 1) {
                    action = KICK;
                    menuOption = 0;
                    menu = TARGETSELECT;
                }
            }
            if (leave) {
                menuOption = 0;
                menu = ACTIONS;
            }
            break;
        case TARGETSELECT:
            if (menuOption > 0) {
                menuOption = 0;
            } else if (menuOption < 0) {
                menuOption = 0;
            }
            if (enter) {
                if (menuOption == 0) {
                    target = 0;
                    go = 1;
                }
            }
            if (leave) {
                menuOption = 0;
                menu = ATTACKS;
            }
        default:
            break;
        }
    } else {
        // Randomly decide what to do
        int randAct = rand() % 3;
        if (randAct == 0) {
            action = PASS;
        } else if (randAct == 1) {
            action = PUNCH;
        } else if (randAct == 2) {
            action = KICK;
        }

        int randTarget = rand() % 4;
        for (int i = 0; i < 4; i++) {
            if (battleAllies[i].exists && battleAllies[i].hp > 0) {
                if (randTarget <= 0) { // this is the one
                    target = i;
                }
            }
            randTarget--;
        }

        go = 1;
    }

    // Draw text
    eraseAllText();
    if (turn == PLAYERTURN) {
        switch (menu)
        {
        case ACTIONS:
            drawText("WHAT WILL YOU DO?", TEXT_TOP_X, TEXT_TOP_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
            sprintf(buf, "%cATTACK\n%cPASS", tsel(menuOption == 0), tsel(menuOption == 1));
            drawText(buf, TEXT_BOTTOM_X, TEXT_BOTTOM_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
            break;
        case ATTACKS:
            drawText("CHOOSE AN ATTACK", TEXT_TOP_X, TEXT_TOP_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
            sprintf(buf, "%cPUNCH\n%cKICK", tsel(menuOption == 0), tsel(menuOption == 1));
            drawText(buf, TEXT_BOTTOM_X, TEXT_BOTTOM_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
            break;
        case TARGETSELECT:
            drawText("CHOOSE A TARGET", TEXT_TOP_X, TEXT_TOP_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
            sprintf(buf, "%cENEMY1\n", tsel(menuOption == 0));
            drawText(buf, TEXT_BOTTOM_X, TEXT_BOTTOM_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
            break;
        }
    }
    // We don't need to draw anything on the enemy's turn for now

    drawCombatants();
}

// Draws all of the combatants
void drawCombatants() {
    if (battleAllies[0].exists && battleAllies[0].hp > 0) {
        shadowOAM[ALLY1_B].attr0 = (15 & ROWMASK) | ATTR0_REGULAR | ATTR0_WIDE;
        shadowOAM[ALLY1_B].attr1 = (8 & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[ALLY1_B].attr2 = ATTR2_TILEID(0, 0);
    } else {
        shadowOAM[ALLY1_B].attr0 = ATTR0_HIDE;
    }
    if (battleAllies[1].exists && battleAllies[1].hp > 0) {
        shadowOAM[ALLY2_B].attr0 = (55 & ROWMASK) | ATTR0_REGULAR | ATTR0_WIDE;
        shadowOAM[ALLY2_B].attr1 = (8 & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[ALLY2_B].attr2 = ATTR2_TILEID(0, 0);
    } else {
        shadowOAM[ALLY2_B].attr0 = ATTR0_HIDE;
    }
    if (battleAllies[2].exists && battleAllies[2].hp > 0) {
        shadowOAM[ALLY3_B].attr0 = (95 & ROWMASK) | ATTR0_REGULAR | ATTR0_WIDE;
        shadowOAM[ALLY3_B].attr1 = (8 & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[ALLY3_B].attr2 = ATTR2_TILEID(0, 0);
    } else {
        shadowOAM[ALLY3_B].attr0 = ATTR0_HIDE;
    }
    if (battleAllies[3].exists && battleAllies[3].hp > 0) {
        shadowOAM[ALLY4_B].attr0 = (135 & ROWMASK) | ATTR0_REGULAR | ATTR0_WIDE;
        shadowOAM[ALLY4_B].attr1 = (8 & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[ALLY4_B].attr2 = ATTR2_TILEID(0, 0);
    } else {
        shadowOAM[ALLY4_B].attr0 = ATTR0_HIDE;
    }

    
    if (battleOpponents[0].exists && battleOpponents[0].hp > 0) {
        shadowOAM[ENEMY1_B].attr0 = (15 & ROWMASK) | ATTR0_REGULAR | ATTR0_WIDE;
        shadowOAM[ENEMY1_B].attr1 = (192 & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[ENEMY1_B].attr2 = ATTR2_TILEID(16, 0);
    } else {
        shadowOAM[ENEMY1_B].attr0 = ATTR0_HIDE;
    }
    if (battleOpponents[1].exists && battleOpponents[1].hp > 0) {
        shadowOAM[ENEMY2_B].attr0 = (55 & ROWMASK) | ATTR0_REGULAR | ATTR0_WIDE;
        shadowOAM[ENEMY2_B].attr1 = (192 & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[ENEMY2_B].attr2 = ATTR2_TILEID(16, 0);
    } else {
        shadowOAM[ENEMY2_B].attr0 = ATTR0_HIDE;
    }
    if (battleOpponents[2].exists && battleOpponents[2].hp > 0) {
        shadowOAM[ENEMY3_B].attr0 = (95 & ROWMASK) | ATTR0_REGULAR | ATTR0_WIDE;
        shadowOAM[ENEMY3_B].attr1 = (192 & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[ENEMY3_B].attr2 = ATTR2_TILEID(16, 0);
    } else {
        shadowOAM[ENEMY3_B].attr0 = ATTR0_HIDE;
    }
    if (battleOpponents[3].exists && battleOpponents[3].hp > 0) {
        shadowOAM[ENEMY4_B].attr0 = (135 & ROWMASK) | ATTR0_REGULAR | ATTR0_WIDE;
        shadowOAM[ENEMY4_B].attr1 = (192 & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[ENEMY4_B].attr2 = ATTR2_TILEID(16, 0);
    } else {
        shadowOAM[ENEMY4_B].attr0 = ATTR0_HIDE;
    }
}

// Erases all text on the screen
void eraseAllText() {
    for (int i = TEXT_IDX; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
    lettersActive = 0;
}

// Draws text on the screen
void drawText(char* str, int textboxX, int textboxY, int textboxWidth, int textboxHeight) {
    // go until we hit that null
    int rightLimit = textboxX + textboxWidth;
    int bottomLimit = textboxY + textboxHeight;
    int cursorx = textboxX;
    int cursory = textboxY;
    while(*str != '\0') {
        // Move cursor down a line if there's a newline character
        if (*str == '\n') {
            cursory += CHAR_HEIGHT; // Move down a row
            cursorx = textboxX; // carriage return
        } else {
            // Only allocate a sprite if its a visible character
            if (*str != ' ') {
                int idx = TEXT_IDX + lettersActive;
                // Return early if we don't have a free sprite
                if (idx >= 128) {
                    return;
                }
                shadowOAM[idx].attr0 = (cursory & ROWMASK) | ATTR0_REGULAR;
                shadowOAM[idx].attr1 = (cursorx & COLMASK) | ATTR1_TINY;
                shadowOAM[idx].attr2 = text_tile_lkup[*str - CHAR_START];
                lettersActive++;
            }
            // Move the cursor
            cursorx += CHAR_WIDTH;
            if (cursorx + CHAR_WIDTH >= rightLimit) {
                cursory += CHAR_HEIGHT; // Move down a row
                cursorx = textboxX; // carriage return
            }
        }
        // Return early if we ran out of vertical space
        if (cursory >= bottomLimit) {
            return;
        }
        // Increment the character pointer
        str++;
    }
}
