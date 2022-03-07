#ifndef GAME_H
#define GAME_H

// Constants
#define ALIENS_PER_ROW 5
#define NUM_ROWS 3
#define PLAYER_BULLET_NUM 3
#define ALIEN_BULLET_NUM 10
#define EXPLOSION_MAX 5
#define LIFEMAX 3
#define BULLET_COOLDOWN 20
#define ALIEN_BULLET_COOLDOWN 10
#define IFRAMES 88
#define SCORE_ALIEN_1 100
#define SCORE_ALIEN_2 250
#define SCORE_ALIEN_3 500
#define SCORE_STAGE 10000
#define JET_ANIM_LENGTH 3
#define EXPLOSION_ANIM_LENGTH 4
#define IMAGE_SIZE 24 // All of the images are 24x24 (except for the spaceship because its special)
#define HUD_HEIGHT 10
#define HUD_COLOR GRAY_IDX

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
	int cooldown;
	int score;
	u8 bulletColor;
} ALIEN;

// Alien row struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int space;
	int height;
	int width;
	ALIEN aliens[ALIENS_PER_ROW];
} ALIENROW;

// Explosion effect struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	const unsigned short* image1;
	const unsigned short* image2;
	const unsigned short* image3;
	int animFrame;
	int animTimer;
	int active;
} EXPLOSION;

// Variables
extern PLAYER player;
extern BULLET playerBullets[PLAYER_BULLET_NUM];
extern BULLET alienBullets[ALIEN_BULLET_NUM];
extern ALIENROW alienRows[NUM_ROWS];
extern EXPLOSION explosions[EXPLOSION_MAX];
extern int lives;
extern int score;
extern int stage;
extern int hiscore;
extern int aliensRemaining;
extern int gameOver;
extern int victory;

// Prototypes
void initGame(int setStage);
void initPlayer();
void initBullets();
void initAliens();
void initExplosions();
void updateGame();
void updatePlayer();
void updatePlayerBullet(BULLET* bullet);
void updateAlienBullet(BULLET* bullet);
void updateAlienRow(ALIENROW* alienRow);
void updateExplosion(EXPLOSION* explosion);
void drawGame();
void drawHUD();
void drawPlayer(); 
void drawBullet(BULLET* b);
void drawAlien(ALIEN* a);
void drawExplosion(EXPLOSION* e);
void firePlayerBullet();
void fireAlienBullet(ALIEN* a);

#endif
