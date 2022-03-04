#include "hw3Lib.h"
#include "text.h"
#include "font.h"

// Draws the specified character at the specified location in Mode 3
void drawChar(int col, int row, char ch, unsigned short color) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata_6x8[48 *ch + OFFSET(i, j, 6)]) {
                // compiler will probably inline this anyway
                setPixel(col + i, row + j, color);
            }
        }
    }
}

// Draws a 6 digit score
void drawScore(int col, int row, int charOffset, int num, unsigned short color) {
    // By the power of some magic math, this draws the score
    // I feel like I did something similar in CS 1332 at some point... maybe the sort with buckets or something?
	drawChar(SCREENWIDTH - col - 6 * charOffset, row, (char) ('0' + (num / 100000)), color);
	drawChar(SCREENWIDTH - col - 6 * --charOffset, row, (char) ('0' + ((num % 100000) / 10000)), color);
	drawChar(SCREENWIDTH - col - 6 * --charOffset, row, (char) ('0' + ((num % 10000) / 1000)), color);
	drawChar(SCREENWIDTH - col - 6 * --charOffset, row, (char) ('0' + ((num % 1000) / 100)), color);
	drawChar(SCREENWIDTH - col - 6 * --charOffset, row, (char) ('0' + ((num % 100) / 10)), color);
	drawChar(SCREENWIDTH - col - 6 * --charOffset, row, (char) ('0' + ((num % 10))), color);
}

// Draws the specified string at the specified location in Mode 3
void drawString(int col, int row, char *str, unsigned short color) {
    int idx = 0;
    while (str[idx] != '\0') {
        drawChar(col, row, str[idx], color);
        col += 6;
        idx++;
    }
}