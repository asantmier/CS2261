#ifndef GAME_H
#define GAME_H

// Player/Cannon Struct
typedef struct {
	// I would later discover trying to reuse my Sprite stuff from HW2 was a terrible mistake because C doesn't have 
	// inheritance. That's why ENEMY doesn't do this.
	Sprite sprite;
	int cooldown;
	int hOrient;
	int iframes;
	int invis;
} PLAYER;

// Bullet Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} TORPEDO;


// Enemy Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	int active;
	int erased;
	int slowframe;
	int dir;
	const unsigned short* image;
} ENEMY;

// Constants
#define TORPEDOCOUNT 6
#define ENEMYCOUNT 5
#define SMALLENEMYCOUNT 10
#define LIFEMAX 3
#define TORPEDO_COOLDOWN 16
#define DELAY_MIN 50
#define DELAY_ADD 50
#define IFRAMES 90
#define SCORE_TIME 10
#define SCORE_PUFF 500
#define SCORE_MINI 1000

// Enums
enum { NEUTRAL = 0, LEFT, RIGHT, UP, DOWN };

// Variables
extern PLAYER ship;
extern TORPEDO torpedoes[TORPEDOCOUNT];
extern ENEMY enemies[ENEMYCOUNT];
extern ENEMY smallEnemies[SMALLENEMYCOUNT];
extern u16 bgColor;
extern int lives;
extern int spawnDelay;
extern int score;
extern int hiscore;
extern int timer;

// Prototypes
void initGame();
void initShip();
void initTorpedoes();
void initEnemies();
void updateGame();
void updateShip();
void updateTorpedo(TORPEDO*);
void updateEnemy(ENEMY*, int);
void drawGame();
void drawHUD();
void drawShip(); 
void drawTorpedo(TORPEDO*);
void drawEnemy(ENEMY*);
void fireTorpedo();
void spawnEnemy();
void spawnSmallEnemies(ENEMY*);

#endif
