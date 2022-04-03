#ifndef GAME_H
#define GAME_H

// Sprite ID table
enum {
    PLAYER_IDX
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
#define PLAYER_MAX_V 480
#define PLAYER_MAX_A 200
#define PLAYER_DRAG  10

// Structs
typedef struct {
    fp64 int_x, int_y; // internal x and y
    int x, y; // screen space x and y
    fp64 dx, dy; // internal velocity
    int width, height;
} PLAYER;

// Variables
extern PLAYER player;

// Init functions
void init();
void initPlayer();

// Update functions
void update();
void updatePlayer();

#endif