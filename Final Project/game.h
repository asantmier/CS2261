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
#define GAMEWIDTH SCREENWIDTH
#define GAMEHEIGHT SCREENHEIGHT
#define PLAYER_MAX_V 48
#define PLAYER_MAX_A 2
#define PLAYER_DRAG  1

// Structs
typedef struct {
    fp64 x, y;
    fp64 dx, dy;
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