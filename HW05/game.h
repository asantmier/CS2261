#ifndef GAME_H
#define GAME_H

enum {
    MARIO_IDX = 0,
    DK_IDX = 1,
    PAULINE_IDX = 2,
    HAMMER_IDX = 3,
    BARREL_IDX = 4, // skip the next 10 to allow for many barrel sprites
    HIGHSCORE_TXT_IDX = 14,
    HIGHSCORE_NUM_IDX = 15, // leave room for 7 digits
    SCORE_NUM_IDX = 22, // leave room for 7 digits
    L_PARAN_IDX = 29,
    M_IDX = 30,
    LIFECOUNT_IDX = 31,
    M1_PARAN_IDX = 32,
    BONUS_TXT_IDX = 33,
    BONUS_NUM_IDX = 34, // leave room for 4 digits
    M2_PARAN_IDX = 38,
    L_IDX = 39,
    LEVELCOUNT_IDX = 40,
    R_PARAN_IDX = 41,
    SCORE_GAIN_IDX = 42, // skip the next 5 to allow for many sprites
};

// ani state
enum {
    LEFT = 0, RIGHT = 1, BACK = 2
};

// hammer state
enum {
    UP = 0, DOWN = 1
};

// dk state
enum {
    NORMAL, RIGHT_HAND, LEFT_HAND, NO_BARREL, BARREL
};

#define LEFT_BOUND 16
#define RIGHT_BOUND 224

#define MARIO_SPEED 1

#define NUM_BARREL 10

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
    // this is only used for barrels so its value at initialization doesn't usuaully matter and we don't set it
    // We could probably have another struct for barrels, but it doesn't really matter.
    int active;
    int wasFalling;
    int adder;
} ANI;

extern ANI mario;
extern int hammerTimer;
extern int hammerState;
extern int jump;
extern int level;
extern ANI dk;
extern ANI pauline;
extern int levelsCleared;
extern ANI barrels[NUM_BARREL];

void init(int newlevel);
void initMario();
void initDK();
void initPauline();
void initBarrels();

void update();
void updateMario();
void updateDK();
void updatePauline();
void updateBarrels();

void throwBarrel();

#endif