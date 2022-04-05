#include <stdlib.h>
// #include "mode0.h"
#include "print.h"
#include "battle.h"
#include "game.h"

// Take the character and subtract CHAR_START. -1 is invalid
const int text_tile_lkup[] = {TILE_EXCLAMATION,TILE_QUOTE,TILE_POUND,TILE_CURRENCY,
TILE_PERCENT,TILE_AMPERSAND,TILE_APOSTROPHE,TILE_LPARANTHESIS,TILE_RPARANTHESIS,
TILE_ASTERISK,TILE_PLUS,TILE_COMMA,TILE_MINUS,TILE_PERIOD,TILE_FSLASH,TILE_0,TILE_1,
TILE_2,TILE_3,TILE_4,TILE_5,TILE_6,TILE_7,TILE_8,TILE_9,TILE_COLON,TILE_SEMICOLON,
TILE_LANGLED,TILE_EQUAL,TILE_RANGLED,TILE_QUESTION,TILE_AT,TILE_A,TILE_B,TILE_C,TILE_D,
TILE_E,TILE_F,TILE_G,TILE_H,TILE_I,TILE_J,TILE_K,TILE_L,TILE_M,TILE_N,TILE_O,TILE_P,
TILE_Q,TILE_R,TILE_S,TILE_T,TILE_U,TILE_V,TILE_W,TILE_X,TILE_Y,TILE_Z,TILE_LSQUARE,
TILE_BSLASH,TILE_RSQUARE,TILE_CARROT,TILE_UNDERSCORE,TILE_GRAVE};

int lettersActive = 0;

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

void initBattle() {
    lettersActive = 0;
    drawText("BATTLE MODE\nTESTING A REALLY  LONG LINE OF TEXT", TEXT_TOP_X, TEXT_TOP_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
    drawText("L BUMPER:LOSE\nR BUMPER:WIN", TEXT_BOTTOM_X, TEXT_BOTTOM_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
}

void updateBattle() {
    // take player input
}
