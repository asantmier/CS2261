#include <stdlib.h>
// #include "mode0.h"
#include "print.h"
#include "battle.h"
#include "game.h"

// Take the character and subtract ','. -1 is invalid
const int text_tile_lkup[] = {
    TILE_COMMA, -1, TILE_PERIOD, TILE_SLASH, TILE_0, TILE_1, TILE_2, TILE_3, TILE_4, TILE_5,
    TILE_6, TILE_7, TILE_8, TILE_9, TILE_COLON, -1, -1, -1, -1, -1, -1, TILE_A, TILE_B, TILE_C,
    TILE_D, TILE_E, TILE_F, TILE_G, TILE_H, TILE_I, TILE_J, TILE_K, TILE_L, TILE_M, TILE_N,
    TILE_O, TILE_P, TILE_Q, TILE_R, TILE_S, TILE_T, TILE_U, TILE_V, TILE_W, TILE_X, TILE_Y, TILE_Z
};

int lettersActive = 0;

void drawText(char* str, int x, int y, int charWidth, int charHeight) {
    // go until we hit that null
    int startx = x;
    int charactersWritten = 0;
    int linesWritten = 0;
    while(*str != '\0') {
        // Move cursor down a line if there's a newline character
        if (*str == '\n') {
            y += 8; // Move down a row
            x = startx; // carraige return
            charactersWritten = 0;
            linesWritten++;
            if (linesWritten >= charHeight) {
                return; // we ran out of space
            }
            str++;
            continue;
        }
        // Only allocate a sprite if its a visible character
        if (*str != ' ') {
            int idx = TEXT_IDX + lettersActive;
            if (idx >= 128) {
                return; // we ran out of sprites
            }
            shadowOAM[idx].attr0 = (y & ROWMASK) | ATTR0_REGULAR;
            shadowOAM[idx].attr1 = (x & COLMASK) | ATTR1_TINY;
            shadowOAM[idx].attr2 = text_tile_lkup[*str - ','];
            lettersActive++;
        }
        // Figure out where the cursor is
        charactersWritten++;
        x += 8; // move over to next char
        if (charactersWritten >= charWidth) {
            y += 8; // Move down a row
            x = startx; // carraige return
            charactersWritten = 0;
            linesWritten++;
            if (linesWritten >= charHeight) {
                return; // we ran out of space
            }
        }
        str++;
    }
}

void initBattle() {
    lettersActive = 0;
    drawText("BATTLE MODE", TEXT_TOP_X, TEXT_TOP_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
    drawText("L BUMPER:LOSE\nR BUMPER:WIN", TEXT_BOTTOM_X, TEXT_BOTTOM_Y, TEXTBOX_WIDTH, TEXTBOX_HEIGHT);
}

void updateBattle() {

}
