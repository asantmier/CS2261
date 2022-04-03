#ifndef GAME_H
#define GAME_H

// Sprite ID table
enum {
    PLAYER_IDX, BULLET1, BULLET2, BULLET3, BULLET4, BULLET5
};

// Fixed point encoding
typedef int fp64;
#define ENCODE26_6(n) ((n) << 6)
#define DECODE26_6(n) ((n) >> 6)

// Constants
#define GAMEWIDTH 1024
#define GAMEHEIGHT 1024
#define CAM_BOUND_L 79
#define CAM_BOUND_R 159
#define CAM_BOUND_T 52
#define CAM_BOUND_B 105
#define PLAYER_MAX_V 48
#define PLAYER_MAX_A 20
#define PLAYER_DRAG  1
#define NUM_BULLETS 5
#define BULLET_MAX_V 96

// Facing directions
enum { LEFT, RIGHT };

// Structs
typedef struct {
    fp64 int_x, int_y; // internal x and y
    int x, y; // screen space x and y
    fp64 dx, dy; // internal velocity
    int width, height;
    int facing;
} PLAYER;

typedef struct {
    fp64 int_x, int_y; // internal x and y
    int x, y; // screen space x and y
    fp64 dx, dy; // internal velocity
    int width, height;
    int active;
    int spriteIdx;
} BULLET;

// Variables
extern PLAYER player;
extern BULLET bullets[NUM_BULLETS];

// Init functions
void init();
void initPlayer();
void initBullets();

// Update functions
void update();
void updatePlayer();
void updateBullet(BULLET* bullet);

#endif