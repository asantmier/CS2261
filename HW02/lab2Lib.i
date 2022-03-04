# 1 "lab2Lib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab2Lib.c"
# 1 "lab2Lib.h" 1




typedef unsigned short u16;


typedef struct sprite {
 int row, col, oldRow, oldCol, rDel, cDel, height, width;
 const unsigned short* sprite;
} Sprite;
# 31 "lab2Lib.h"
extern volatile unsigned short *videoBuffer;
# 46 "lab2Lib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void drawSprite(Sprite* sprite);
void eraseFullSprite(Sprite* sprite, unsigned short bgColor);
void eraseMovingSprite(Sprite* sprite, unsigned short bgColor);
void fillScreen(unsigned short color);


void waitForVBlank();
# 75 "lab2Lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 86 "lab2Lib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "lab2Lib.c" 2


volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for(int x = 0; x < width; x++) {
        for(int y = 0; y < height; y++) {
            videoBuffer[((row + y)*(240)+(col + x))] = color;
        }
    }
}

void drawSprite(Sprite* sprite) {

    for(int x = 0; x < sprite->width; x++) {
        for(int y = 0; y < sprite->height; y++) {
            videoBuffer[((sprite->row + y)*(240)+(sprite->col + x))] = sprite->sprite[((y)*(sprite->width)+(x))];
        }
    }
}

void eraseFullSprite(Sprite* sprite, unsigned short bgColor) {

    for(int x = 0; x < sprite->width; x++) {
        for(int y = 0; y < sprite->height; y++) {


            videoBuffer[((sprite->row + y)*(240)+(sprite->col + x))] = bgColor;
        }
    }
}

void eraseMovingSprite(Sprite* sprite, unsigned short bgColor) {


    int xend, xstart, xdiff;
    if (sprite->col < sprite->oldCol) {

        xdiff = sprite->oldCol - sprite->col;
        xstart = sprite->width - xdiff;
        xend = sprite->width;
    } else {

        xdiff = sprite->col - sprite->oldCol;
        xstart = 0;
        xend = xdiff;
    }

    for(int x = xstart; x < xend; x++) {
        for(int y = 0; y < sprite->height; y++) {
            videoBuffer[((sprite->oldRow + y)*(240)+(sprite->oldCol + x))] = bgColor;
        }
    }
    int yend, ystart, ydiff;
    if (sprite->row < sprite->oldRow) {

        ydiff = sprite->oldRow - sprite->row;
        ystart = sprite->width - ydiff;
        yend = sprite->width;
    } else {

        ydiff = sprite->row - sprite->oldRow;
        ystart = 0;
        yend = ydiff;
    }
    for(int y = ystart; y < yend; y++) {
        for(int x = 0; x < sprite->width; x++) {
            videoBuffer[((sprite->oldRow + y)*(240)+(sprite->oldCol + x))] = bgColor;
        }
    }
}

void fillScreen(unsigned short color) {
    for(int p = 0; p < 160 * 240; p++) {
        videoBuffer[p] = color;
    }
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA + heightA - 1 > rowB && rowA < rowB + heightB - 1 && colA + widthA - 1 > colB && colA < colB + widthB - 1;
}
