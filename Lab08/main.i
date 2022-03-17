# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "lab08lib.h" 1




void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 47 "lab08lib.h"
extern unsigned short *videoBuffer;
# 96 "lab08lib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void waitForVBlank();
void flipPage();


typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 151 "lab08lib.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} SPRITE;
# 189 "lab08lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 228 "lab08lib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "game.h" 1





extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern SPRITE pikachu;


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();


int collisionCheck(unsigned char *collisionMap, int mapWidth, int col, int row, int width, int height,
        int colShift, int rowShift);
int collisionCheckAllPixels(unsigned char *collisionMap, int mapWidth, int col, int row, int width,
        int height, int colShift, int rowShift);
int collisionCheckReturnLargest(unsigned char *collisionMap, int mapWidth, int col, int row, int width,
    int height, int colShift, int rowShift);
int collisionCheckReturnLargestAllPixels(unsigned char *collisionMap, int mapWidth, int col, int row,
        int width, int height, int colShift, int rowShift);
# 3 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 4 "main.c" 2
# 1 "house.h" 1
# 22 "house.h"
extern const unsigned short houseTiles[896];


extern const unsigned short houseMap[1024];


extern const unsigned short housePal[256];
# 5 "main.c" 2

# 1 "foreground.h" 1
# 22 "foreground.h"
extern const unsigned short foregroundTiles[224];


extern const unsigned short foregroundMap[1024];


extern const unsigned short foregroundPal[256];
# 7 "main.c" 2


void initialize();
void goToGame();
void game();


enum {GAME};
int state;


unsigned short buttons;
unsigned short oldButtons;

int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch(state) {

            case GAME:
                game();
                break;
        }

    }
}


void initialize() {



    (*(unsigned short *)0x4000000) = 0 | (1<<9) | (1<<12) | (1<<8);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((31)<<8) | (0<<14);


    (*(volatile unsigned short*)0x4000008) = ((1)<<2) | ((30)<<8) | (0<<14);


    goToGame();
    initGame();
}


void goToGame() {


    waitForVBlank();


    DMANow(3, housePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, houseTiles, &((charblock *)0x6000000)[0], 1792 / 2);
    DMANow(3, houseMap, &((screenblock *)0x6000000)[31], 2048 / 2);

    (*(volatile unsigned short *)0x04000016) = vOff;
    (*(volatile unsigned short *)0x04000014) = hOff;


    DMANow(3, foregroundTiles, &((charblock *)0x6000000)[1], 448 / 2);

    DMANow(3, foregroundMap, &((screenblock *)0x6000000)[30], 2048 / 2);

    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;


    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = GAME;
}


void game() {

    updateGame();
    drawGame();
}
