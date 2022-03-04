# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"
# 1 "hw3Lib.h" 1




typedef unsigned short u16;
typedef unsigned int u32;


typedef struct {
 int row, col, oldRow, oldCol, rDel, cDel, height, width;
 const unsigned short* image;
} Sprite;
# 25 "hw3Lib.h"
typedef struct {
    const volatile void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMAREC;
# 50 "hw3Lib.h"
extern volatile unsigned short *videoBuffer;
# 67 "hw3Lib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, volatile unsigned short color);
void drawSprite(Sprite* sprite);
void eraseFullSprite(Sprite* sprite, unsigned short bgColor);
void drawImage(int col, int row, int width, int height, const unsigned short* image);
void eraseMovingSprite(Sprite* sprite, unsigned short bgColor);
void eraseMovingImage(int col, int row, int oldCol, int oldRow, int width, int height, unsigned short bgColor);
void fillScreen(volatile unsigned short color);


void waitForVBlank();
# 97 "hw3Lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 107 "hw3Lib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "text.c" 2
# 1 "text.h" 1




void drawChar(int col, int row, char ch, unsigned short color);
void drawScore(int col, int row, int charOffset, int num, unsigned short color);
void drawString(int col, int row, char *str, unsigned short color);
# 3 "text.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 4 "text.c" 2


void drawChar(int col, int row, char ch, unsigned short color) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata_6x8[48 *ch + ((j)*(6)+(i))]) {

                setPixel(col + i, row + j, color);
            }
        }
    }
}


void drawScore(int col, int row, int charOffset, int num, unsigned short color) {


 drawChar(240 - col - 6 * charOffset, row, (char) ('0' + (num / 100000)), color);
 drawChar(240 - col - 6 * --charOffset, row, (char) ('0' + ((num % 100000) / 10000)), color);
 drawChar(240 - col - 6 * --charOffset, row, (char) ('0' + ((num % 10000) / 1000)), color);
 drawChar(240 - col - 6 * --charOffset, row, (char) ('0' + ((num % 1000) / 100)), color);
 drawChar(240 - col - 6 * --charOffset, row, (char) ('0' + ((num % 100) / 10)), color);
 drawChar(240 - col - 6 * --charOffset, row, (char) ('0' + ((num % 10))), color);
}


void drawString(int col, int row, char *str, unsigned short color) {
    int idx = 0;
    while (str[idx] != '\0') {
        drawChar(col, row, str[idx], color);
        col += 6;
        idx++;
    }
}
