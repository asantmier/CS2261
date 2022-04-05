#ifndef WORLD_H
#define WORLD_H

// Sprite ID table
enum {
    PLAYER_IDX = 0, BULLET1, BULLET2, BULLET3, BULLET4, BULLET5, ENEMY1, ENEMY2, ENEMY3, ENEMY4, ENEMY5
};
// TODO rather than have each enemy get a unique sprite, grab like 10 sprites for enemies and just use
//  a unique sprite index for every enemy that's on screen.

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
#define NUM_ENEMIES 5 // there needs to be an entry for every enemy in the level
#define NUM_LEVELS 1

// Facing directions
enum { LEFT, RIGHT };
// AI types
enum { PASSIVE, NEUTRAL, HOSTILE };
// Enemy types
enum { FISH, SHARK, ANGLER, JIM }; // don't mess with jim

// Structs
typedef struct tag_player {
    fp64 int_x, int_y; // internal x and y
    int x, y; // screen space x and y
    fp64 dx, dy; // internal velocity
    int width, height;
    int facing;
} PLAYER;

typedef struct tag_bullet {
    fp64 int_x, int_y; // internal x and y
    int x, y; // screen space x and y
    fp64 dx, dy; // internal velocity
    int width, height;
    int active;
    int spriteIdx;
} BULLET;

typedef struct tag_enemy {
    fp64 int_x, int_y; // internal x and y
    int x, y; // screen space x and y
    fp64 dx, dy; // internal velocity
    int width, height;
    int active;
    int spriteIdx;
    int ai;
    int type;
} ENEMY;

typedef struct tag_level {
    // pointers for the foreground, background, collision maps, etc
    ENEMY enemyList[NUM_ENEMIES];
} LEVEL;

// Level data
LEVEL levels[NUM_LEVELS];

// Variables
extern PLAYER player;
extern BULLET bullets[NUM_BULLETS];
extern ENEMY enemies[NUM_ENEMIES];

// Flags for main
extern int doBattle;
extern int opponentIdx;

// Battle mode swapping
void returnFromBattle(int victory);

// Init functions
void initWorld();
void initPlayer();
void initBullets();
void initEnemies();

// Update functions
void updateWorld();
void updatePlayer();
void updateBullet(BULLET* bullet);
void updateEnemy(ENEMY* enemy);

// TODO whats left
// put an enemy on the screen
// don't make it do anything i don't have time for that
// hit enemy or collide to enter battle mode
// in battle mode, hit a button to win and go back and remove the enemy
// in battle mode, hit another button to go to the lose state
// win state is still unimplemented. its only real purpose is after you beat the whole game
// if there's time, implement a 1v1 battle system
// you hit a button to hit the enemy, the enemy does random damage back
// if you do enough damage you win, otherwise you lose yk
// if there's still time, implement the text system
// this seems like a lot of work and kinda art related so it might be excusable to not have in M2
// don't bother turning in the text stuff more than a day late?

// world.h the world part of the game
// battle.h battle part of the game
// game.h contains data relevant to both world and battle like player hp

#endif