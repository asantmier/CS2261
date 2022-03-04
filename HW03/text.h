#ifndef TEXT_H
#define TEXT_H

// Mode 3 Text-drawing prototypes
void drawChar(int col, int row, char ch, unsigned short color);
void drawScore(int col, int row, int charOffset, int num, unsigned short color);
void drawString(int col, int row, char *str, unsigned short color);

#endif
