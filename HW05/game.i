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


unsigned short colorAt(int x, int y, int level);
int checkCollisionMap(int x, int y, int dx, int dy, int level, int* xout, int* yout);
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
    LEFT = 0, RIGHT = 1, BACK = 2
};


enum {
    UP = 0, DOWN = 1
};


enum {
    NORMAL, RIGHT_HAND, LEFT_HAND, NO_BARREL, BARREL
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
extern int jump;
extern int level;
extern ANI dk;
extern ANI pauline;
extern int levelsCleared;

void init(int newlevel);
void initMario();
void initDK();
void initPauline();

void update();
void updateMario();
void updateDK();
void updatePauline();
# 3 "game.c" 2

ANI mario;
int hammerTimer;
int hammerState;
int level;
int jump;
int jumpTimer;
int ladder;
ANI dk;
ANI pauline;
int levelsCleared;
int barrelTimer;

void init(int newlevel) {
    levelsCleared++;
    level = newlevel;
    switch (level)
    {
    case 1:
        (*(volatile unsigned short *)0x4000000) = 0 | (1 << 12) | (1 << 9);
        break;
    case 2:
        (*(volatile unsigned short *)0x4000000) = 0 | (1 << 12) | (1 << 10);
        break;
    }

    initMario();
    initDK();
    initPauline();
}

void initMario() {
    hammerTimer = 0;
    hammerState = UP;
    jump = 0;
    jumpTimer = 0;
    ladder = 0;
    mario.width = 16;
    mario.height = 16;
    mario.timer = 0;
    mario.curFrame = 0;
    switch (level)
    {
    case 1:
        mario.x = 184;
        mario.y = 151 - 16 + 1;
        mario.state = LEFT;
        break;
    case 2:
        mario.x = 176;
        mario.y = 135;
        mario.state = LEFT;
        break;
    }
}

void initDK() {
    barrelTimer = 0;
    dk.width = 8 * 8;
    dk.height = 4 * 8;
    dk.timer = 0;
    dk.curFrame = 0;
    dk.state = NORMAL;
    switch (level)
    {
    case 1:
        dk.x = 32;
        dk.y = 0;
        break;
    case 2:
        dk.x = 85;
        dk.y = 0;
        break;
    }
}

void initPauline() {
    pauline.width = 16;
    pauline.height = 32;
    pauline.timer = 0;
    pauline.curFrame = 0;
    pauline.state = RIGHT;
    switch (level)
    {
    case 1:
        pauline.x = 120;
        pauline.y = 0;
        break;
    case 2:
        pauline.x = 77;
        pauline.y = 0;
        break;
    }
}

void update() {
    updateMario();
    updateDK();
    updatePauline();
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


    if (!(mario.timer % 3)) {
        mario.curFrame = (mario.curFrame + 1) % 3;
    }


    int idle = 1;
    if (!jump && hammerTimer <= 0 && (~((*(volatile unsigned short *)0x04000130)) & ((1 << 6))) && colorAt(mario.x + (mario.width / 2), mario.y + mario.height - 1, level) == 3) {
        mario.dy = -1;
        mario.state = BACK;
        idle = 0;
        ladder = 1;
        int newx, newy;
        if (checkCollisionMap(mario.x + (mario.width / 2), mario.y + mario.height - 1, 0, mario.dy, level, &newx, &newy)) {
            ladder = 0;
            mario.y -= 2;
            mario.dy = 0;
            mario.state = LEFT;
        }
    }
    if (ladder && (~((*(volatile unsigned short *)0x04000130)) & ((1 << 7)))) {
        mario.dy = 1;
        idle = 0;
        int newx, newy;
        if (checkCollisionMap(mario.x + (mario.width / 2), mario.y + mario.height - 1, 0, mario.dy, level, &newx, &newy)) {
            ladder = 0;
            mario.dy = 0;
            mario.state = LEFT;
        }
    }
    if (!ladder) {
        if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
            mario.dx = -1;
            mario.state = LEFT;
            idle = 0;
        } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
            mario.dx = 1;
            mario.state = RIGHT;
            idle = 0;
        }
        if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0)))) && !jump) {
            jump = 1;
            jumpTimer = 30;
            idle = 0;
        }
    }


    if (!jump && !ladder) {
        mario.dy = 1;
    } else {
        if (jumpTimer > 10) {
            mario.dy = -1;
        } else if (jumpTimer > 0) {
            mario.dy = 0;
        } else {
            jump = 0;
        }

        jumpTimer--;
    }


    int newx, newy;
    checkCollisionMap(mario.x + (mario.width / 2), mario.y + mario.height - 1, mario.dx, mario.dy, level, &newx, &newy);
    mario.x = newx - (mario.width / 2);
    mario.y = newy - mario.height + 1;
    if (mario.x < 16) {
        mario.x = 16;
    } else if (mario.x + mario.width > 224) {
        mario.x = 224 - mario.width;
    }


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


    if (collision(mario.x, mario.y, mario.width, mario.height, pauline.x, pauline.y, pauline.width, pauline.height)) {
        if (level == 1) {
            init(2);
        } else {
            init(1);
        }
    }

    mario.timer++;
}

void updateDK() {

    if (!(dk.timer % 30)) {
        if (dk.state == NO_BARREL) {
            dk.state = BARREL;
        } else if (dk.state == BARREL) {
            dk.state = NORMAL;
            barrelTimer = 0;
        } else {
            dk.curFrame = (dk.curFrame + 1) % 4;
        }
    }


    if (barrelTimer == 180) {
        dk.state = NO_BARREL;
        dk.timer = 0;
    }


    shadowOAM[DK_IDX].attr0 = dk.y | (0 << 8) | (1 << 14);
    shadowOAM[DK_IDX].attr1 = dk.x | (3 << 14);
    switch (dk.state)
    {
    case NORMAL:
        switch (dk.curFrame)
        {
        case 0:
            shadowOAM[DK_IDX].attr2 = ((12)*32 + (24));
            break;
        case 1:
            shadowOAM[DK_IDX].attr2 = ((12)*32 + (8));
            break;
        case 2:
            shadowOAM[DK_IDX].attr2 = ((12)*32 + (16));
            break;
        case 3:
            shadowOAM[DK_IDX].attr2 = ((12)*32 + (24));
            break;
        }
        break;
    case NO_BARREL:
        shadowOAM[DK_IDX].attr2 = ((12)*32 + (0));
        break;
    case BARREL:
        shadowOAM[DK_IDX].attr2 = ((16)*32 + (0));
        break;
    }

    dk.timer++;
    barrelTimer++;
}

void updatePauline() {


    if (!(pauline.timer % 60)) {
        pauline.curFrame = (pauline.curFrame + 1) % 2;
    }


    shadowOAM[PAULINE_IDX].attr0 = pauline.y | (0 << 8) | (2 << 14);
    shadowOAM[PAULINE_IDX].attr1 = pauline.x | (2 << 14);
    shadowOAM[PAULINE_IDX].attr2 = ((0)*32 + (20 + pauline.curFrame * 2));

    pauline.timer++;
}
