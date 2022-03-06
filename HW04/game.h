#ifndef GAME_H
#define GAME_H

// Constants
#define ALIENS_PER_ROW 6
#define NUM_ROWS 3
#define PLAYER_BULLET_NUM 6
#define ALIEN_BULLET_NUM 10
#define LIFEMAX 3
#define BULLET_COOLDOWN 16
#define IFRAMES 88
#define SCORE_ALIEN_1 100
#define SCORE_ALIEN_2 250
#define SCORE_ALIEN_3 500
#define JET_ANIM_LENGTH 20
#define IMAGE_SIZE 24 // All of the images are 24x24 (except for the spaceship because its special)

// Player Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int bodyHeight;
	int bodyWidth;
	const unsigned short* bodyImage;
	int jetHeight;
	int jetWidth;
	const unsigned short* jetImage1;
	const unsigned short* jetImage2;
	int jetFrame;
	int jetTimer;
	int cooldown;
	int iframes; // if iframes % 8 < 4 then invis otherwise show
} PLAYER;

// Bullet Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	u8 colorIndex;
	int active;
} BULLET;

// Alien Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	const unsigned short* image;
	int alive;
	u8 bulletColor;
} ALIEN;

// Alien row struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int space;
	int width;
	ALIEN aliens[ALIENS_PER_ROW];
} ALIENROW;

// Variables
extern PLAYER player;
extern BULLET playerBullets[PLAYER_BULLET_NUM];
extern BULLET alienBullets[ALIEN_BULLET_NUM];
extern ALIENROW alienRows[NUM_ROWS];
extern int lives;
extern int score;
extern int hiscore;
extern int aliensRemaining;

// Prototypes
void initGame();
void initPlayer();
void initBullets();
void initAliens();
void updateGame();
void updatePlayer();
void updateBullet(BULLET* bullet);
void updateAlienRow(ALIENROW* alienRow);
void drawGame();
void drawHUD();
void drawPlayer(); 
void drawBullet(BULLET* b);
void drawAlien(ALIEN* a);
void firePlayerBullet();
void fireAlienBullet(int row, int col, int rdel, u8 colorIndex);

#endif
