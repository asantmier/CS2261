# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "HW05Lib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 62 "HW05Lib.h"
extern volatile unsigned short *videoBuffer;
# 83 "HW05Lib.h"
typedef struct {
    u16 tileimg[8192];
} charblock;


typedef struct {
    u16 tilemap[1024];
} screenblock;



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


void waitForVBlank();
void flipPage();


typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 152 "HW05Lib.h"
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
# 190 "HW05Lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 238 "HW05Lib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "game.c" 2
# 1 "game.h" 1



enum {
    MARIO_IDX = 0,
    DK_IDX = 1,
    PAULINE_IDX = 2,
    HAMMER_IDX = 3,
    BARREL_IDX = 4,
    HIGHSCORE_TXT_IDX = 14,
    HIGHSCORE_NUM_IDX = 15,
    SCORE_NUM_IDX = 22,
    L_PARAN_IDX = 29,
    M_IDX = 30,
    LIFECOUNT_IDX = 31,
    M1_PARAN_IDX = 32,
    BONUS_TXT_IDX = 33,
    BONUS_NUM_IDX = 34,
    M2_PARAN_IDX = 38,
    L_IDX = 39,
    LEVELCOUNT_IDX = 40,
    R_PARAN_IDX = 41,
    SCORE_GAIN_IDX = 42,
};


enum {
    LEFT = 0, RIGHT, BACK
};


enum {
    UP = 0, DOWN = 1
};



typedef struct {
    int x;
    int y;
    int dx;
    int dy;
    int width;
    int height;
    int state;
    int timer;
    int curFrame;
} ANI;

extern ANI mario;
extern int hammerTimer;
extern int hammerState;

void init();
void initMario();

void update();
void updateMario();
# 3 "game.c" 2

ANI mario;
int hammerTimer = 0;
int hammerState = UP;

void init() {
    initMario();
}

void initMario() {
    mario.x = 80;
    mario.y = 100;
}

void update() {
    updateMario();
}

void updateMario() {

    mario.dx = 0;
    mario.dy = 0;


    if (hammerTimer > 0) {
        if (!(hammerTimer % 4)) {
            hammerState = hammerState ? 0 : 1;
        }

        hammerTimer--;
    }


    if (mario.timer % 5) {
        mario.curFrame = (mario.curFrame + 1) % 3;
    }


    int idle = 0;
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        mario.dx = -1;
        mario.state = LEFT;
    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        mario.dx = 1;
        mario.state = RIGHT;
    } else {
        idle = 1;
    }


    mario.x += mario.dx;
    mario.y += mario.dy;


    if (idle) {
        mario.timer = 0;
        mario.curFrame = 0;
    }


    if (hammerTimer > 0) {
        if (hammerState == UP) {
            shadowOAM[MARIO_IDX].attr0 = (mario.y - 16) | (0 << 8) | (2 << 14);
            shadowOAM[MARIO_IDX].attr1 = mario.x | (2 << 14);
            if (mario.state == RIGHT) {
                shadowOAM[MARIO_IDX].attr2 = ((mario.curFrame * 4)*32 + (12));
            } else {
                shadowOAM[MARIO_IDX].attr2 = ((mario.curFrame * 4)*32 + (10));
            }
        } else {
            shadowOAM[MARIO_IDX].attr0 = mario.y | (0 << 8) | (1 << 14);
            if (mario.state == RIGHT) {
                shadowOAM[MARIO_IDX].attr1 = mario.x | (2 << 14);
                shadowOAM[MARIO_IDX].attr2 = ((mario.curFrame * 2)*32 + (14));
            } else {
                shadowOAM[MARIO_IDX].attr1 = (mario.x - 16) | (2 << 14);
                shadowOAM[MARIO_IDX].attr2 = ((mario.curFrame * 2)*32 + (6));
            }
        }
    } else {
        shadowOAM[MARIO_IDX].attr0 = mario.y | (0 << 8) | (0 << 14);
        shadowOAM[MARIO_IDX].attr1 = mario.x | (1 << 14);
        shadowOAM[MARIO_IDX].attr2 = ((mario.curFrame * 2)*32 + (mario.state * 2));
    }

    mario.timer++;
}
