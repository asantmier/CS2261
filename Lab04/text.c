#include "lab04Lib.h"
#include "text.h"
#include "font.h"

// Draws the specified character at the specified location in Mode 3
void drawChar(int col, int row, char ch, unsigned short color) {
    // TODO 2.0: Complete this function
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata_6x8[48 *ch + OFFSET(i, j, 6)]) {
                // compiler will probably inline this anyway
                setPixel(col + i, row + j, color);
            }
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString(int col, int row, char *str, unsigned short color) {
    // TODO 2.0: Complete this function
    int idx = 0;
    while (str[idx] != '\0') {
        drawChar(col, row, str[idx], color);
        col += 6;
        idx++;
    }
}