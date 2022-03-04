#include <stdlib.h>
#include <string.h>
#include "hw3Lib.h"
#include "game.h"
#include "text.h"
#include "sprites.h"

// Variables
PLAYER ship;
TORPEDO torpedoes[TORPEDOCOUNT];
ENEMY enemies[ENEMYCOUNT];
ENEMY smallEnemies[SMALLENEMYCOUNT];
u16 bgColor = BLUE;
int lives;
int spawnDelay;
int score;
int hiscore = 0;
int timer;

// Initialize the game
void initGame() {
	initShip();
	initTorpedoes();
	initEnemies();
	lives = LIFEMAX;
	// randomly assign the time the first enemy will spawn
	spawnDelay = DELAY_MIN + rand() % DELAY_ADD;
	score = 0;
	timer = 60;
}

// Updates the game each frame
void updateGame() {
	if (timer <= 0) {
		score += SCORE_TIME;
		timer = 60;
	}
	timer--;

	// spawnDelay acts as a timer for spawning enemies
	if (spawnDelay <= 0) {
		spawnEnemy();
	} else {
		spawnDelay--;
	}

	updateShip();

	for (int i = 0; i < TORPEDOCOUNT; i++) {
		updateTorpedo(&torpedoes[i]);
	}

	for (int i = 0; i < ENEMYCOUNT; i++) {
		updateEnemy(&enemies[i], 0);
	}

	for (int i = 0; i < SMALLENEMYCOUNT; i++) {
		updateEnemy(&smallEnemies[i], 1);
	}
}

// Draws the game each frame
void drawGame() {
	// Do this first since its at the top of the screen
	drawHUD();

	drawShip();

	for (int i = 0; i < TORPEDOCOUNT; i++) {
		drawTorpedo(&torpedoes[i]);
	}

	for (int i = 0; i < ENEMYCOUNT; i++) {
		drawEnemy(&enemies[i]);
	}

	for (int i = 0; i < SMALLENEMYCOUNT; i++) {
		drawEnemy(&smallEnemies[i]);
	}
}

// Initialize the ship
void initShip() {
	// You can start to see why reusing my Sprite struct was a bad idea
	// Refactoring this would be a nightmare and it works fine as is - it's just hideous
	Sprite* sprite = &ship.sprite;
	sprite->row = 85;
	sprite->col = 118;
	sprite->oldRow = sprite->row;
	sprite->oldCol = sprite->col;
	sprite->rDel = 1;
	sprite->cDel = 1;
	sprite->height = SUBMARINE_RIGHT_HEIGHT;
	sprite->width = SUBMARINE_RIGHT_WIDTH;
	sprite->image = submarine_right;
	ship.cooldown = 20;
	ship.hOrient = RIGHT;
	ship.iframes = 0;
	ship.invis = 0;
}

// Initialize the pool of torpedoes
void initTorpedoes() {
	for (int i = 0; i < TORPEDOCOUNT; i++) {
		torpedoes[i].height = 1;
		torpedoes[i].width = 2;
		torpedoes[i].row = - torpedoes[i].height;
		torpedoes[i].col = 0;
		torpedoes[i].cdel = 0;
		torpedoes[i].rdel = 0;
		torpedoes[i].oldRow = ship.sprite.row;
		torpedoes[i].oldCol = torpedoes[i].col;
		torpedoes[i].color = WHITE;
		torpedoes[i].active = 0;
	}
}

// Initialize the enemies
void initEnemies() {
	for (int i = 0; i < ENEMYCOUNT; i++) {
		enemies[i].image = pufferfish;
		enemies[i].height = PUFFERFISH_HEIGHT;
		enemies[i].width = PUFFERFISH_WIDTH;
		enemies[i].row = 0;
		enemies[i].col = 0;
		enemies[i].oldRow = enemies[i].row;
		enemies[i].oldCol = enemies[i].col;
		enemies[i].rdel = 1;
		enemies[i].cdel = 1;
		enemies[i].active = 0;
		enemies[i].erased = 1; // if this isn't 1, a random square in the top left will be erased on frame 1
		enemies[i].slowframe = 0;
	}
	for (int i = 0; i < SMALLENEMYCOUNT; i++) {
		smallEnemies[i].image = minipuffer;
		smallEnemies[i].height = MINIPUFFER_HEIGHT;
		smallEnemies[i].width = MINIPUFFER_WIDTH;
		smallEnemies[i].row = 0;
		smallEnemies[i].col = 0;
		smallEnemies[i].oldRow = smallEnemies[i].row;
		smallEnemies[i].oldCol = smallEnemies[i].col;
		smallEnemies[i].rdel = 1;
		smallEnemies[i].cdel = 1;
		smallEnemies[i].active = 0;
		smallEnemies[i].erased = 1;
		smallEnemies[i].slowframe = 0;
	}
}

// Try to spawn an enemy
void spawnEnemy() {
	for (int i = 0; i < ENEMYCOUNT; i++) {
		if (!enemies[i].active && enemies[i].erased) {
			enemies[i].active = 1;
			enemies[i].erased = 0;
			enemies[i].rdel = 0; // going to randomly fluctuate
			enemies[i].slowframe = 0;
			enemies[i].row = 10 + rand() % (SCREENHEIGHT - 10 - enemies[i].height);
			// Randomly decide whether to make the enemy come from the left or right
			int choice = rand() % 2;
			if (choice == 0) {
				// left side
				enemies[i].col = 0;
				enemies[i].cdel = 1;
			} else if (choice == 1) {
				// right side
				enemies[i].col = SCREENWIDTH - enemies[i].width;
				enemies[i].cdel = -1;
			}
			enemies[i].oldCol = enemies[i].col;
			enemies[i].oldRow = enemies[i].row;
			// reset the spawnDelay timer
			spawnDelay = DELAY_MIN + (rand() % DELAY_ADD);
			break;
		}
	}
}

// Try to spawn some small enemies
void spawnSmallEnemies(ENEMY* parent) {
	// Spawn enemy that moves up
	for (int i = 0; i < SMALLENEMYCOUNT; i++) {
		if (!smallEnemies[i].active && smallEnemies[i].erased) {
			smallEnemies[i].active = 1;
			smallEnemies[i].erased = 0;
			smallEnemies[i].rdel = 1;
			smallEnemies[i].cdel = parent->cdel;
			smallEnemies[i].slowframe = 0;
			smallEnemies[i].row = parent->row;
			smallEnemies[i].col = parent->col;
			smallEnemies[i].oldCol = smallEnemies[i].col;
			smallEnemies[i].oldRow = smallEnemies[i].row;
			smallEnemies[i].dir = UP;
			break;
		}
	}
	// Spawn enemy that moves down
	for (int i = 0; i < SMALLENEMYCOUNT; i++) {
		if (!smallEnemies[i].active && smallEnemies[i].erased) {
			smallEnemies[i].active = 1;
			smallEnemies[i].erased = 0;
			smallEnemies[i].rdel = -1;
			smallEnemies[i].cdel = parent->cdel;
			smallEnemies[i].slowframe = 0;
			smallEnemies[i].row = parent->row;
			smallEnemies[i].col = parent->col;
			smallEnemies[i].oldCol = smallEnemies[i].col;
			smallEnemies[i].oldRow = smallEnemies[i].row;
			smallEnemies[i].dir = DOWN;
			break;
		}
	}
}

 // Handle every-frame actions of the ship
void updateShip() {
	Sprite* sprite = &ship.sprite;

	int hor = NEUTRAL;
	int ver = NEUTRAL;

	// Determine the input vector
	if (BUTTON_HELD(BUTTON_LEFT)) {
		hor = LEFT;
	} else if (BUTTON_HELD(BUTTON_RIGHT)) {
		hor = RIGHT;
	}
	if (BUTTON_HELD(BUTTON_UP)) {
		ver = UP;
	} else if (BUTTON_HELD(BUTTON_DOWN)) {
		ver = DOWN;
	}

 	// Move the ship
	if (hor == LEFT) {
		sprite->col -= sprite->cDel;
		if (sprite->col < 0) {
			sprite->col = 0;
		}
	} else if (hor == RIGHT) {
		sprite->col += sprite->cDel;
		if (sprite->col + sprite->width - 1 >= SCREENWIDTH) {
			sprite->col = SCREENWIDTH - sprite->width;
		}
	}

	int oldOrient = ship.hOrient;
	if (hor != NEUTRAL) {
		// change the ship's orientation (used for firing torpedoes)
		ship.hOrient = hor;
	}
	if (ver == UP) {
		sprite->row -= sprite->rDel;
		if (sprite->row < 10) {
			sprite->row = 10;
		}
	} else if (ver == DOWN) {
		sprite->row += sprite->rDel;
		if (sprite->row + sprite->height - 1 >= SCREENHEIGHT) {
			sprite->row = SCREENHEIGHT - sprite->height;
		}
	}

	// if we CHANGED direction update the sprite
	if (oldOrient != ship.hOrient) {
		if (ship.hOrient == LEFT) { // left
			ship.sprite.image = submarine_left;
		} else { // right
			ship.sprite.image = submarine_right;
		}
	}

 	// Fire torpedoes
	if (BUTTON_PRESSED(BUTTON_B) && ship.cooldown <= 0) {
 		fireTorpedo(hor, ver);
		// Set a cooldown between firing shots
		ship.cooldown = TORPEDO_COOLDOWN;
	} else {
		ship.cooldown--;
	}

	if (ship.iframes > 0) {
		// every 4 frames, change the ship's visibility
		if (ship.iframes % 4 == 0) {
			// if he's so invincible why can i see him?
			ship.invis = ship.invis ? 0 : 1;
		}
		// reduce iframe counter
		ship.iframes--;
	} else {
		// make sure we aren't invisible if we aren't even invincible
		ship.invis = 0;
	}
}

// Spawn a torpedo
void fireTorpedo() {
	for (int i = 0; i < TORPEDOCOUNT; i++) {
		if (!torpedoes[i].active) {
			torpedoes[i].active = 1;
			torpedoes[i].erased = 0;
			torpedoes[i].row = ship.sprite.row + 11; // aligns torpedo with gun on sprite
			// col and velocity depend on what direction the player is facing
			if (ship.hOrient == LEFT) {
				torpedoes[i].cdel = -3;
				torpedoes[i].col = ship.sprite.col - torpedoes[i].width;
			} else if (ship.hOrient == RIGHT) {
				torpedoes[i].cdel = 3;
				torpedoes[i].col = ship.sprite.col + ship.sprite.width - 1;
			}
			torpedoes[i].oldCol = torpedoes[i].col;
			torpedoes[i].oldRow = torpedoes[i].row;
			break;
		}
	}
}

// Handle every-frame actions of a torpedo
void updateTorpedo(TORPEDO* b) {
	if (b->active) {
		b->col += b->cdel;
		if (b->col < 0 || b->col >= SCREENWIDTH) {
			b->active = 0;
		}
	}
}

// Handle every-frame actions of a enemy
void updateEnemy(ENEMY* b, int small) {
	// if small is true, this is a small enemy, otherwise its a big one
	if (b->active) {
		// Every other frame, enemies don't move, because if they did, they would move really fast
		// I know we discussed how to achieve this with fixed point numbers but I couldn't be bothered when just doing
		// this was so easy.
		if (!b->slowframe) {
			// Move the enemy with a little bit of random wobbling
			// The way enemies wobble depend on their direction, which is why there's all these conditionals
			if (!small) {
				int tmp = rand() % 6;
				switch(tmp) {
				case 0:
					b->rdel = 1;
					break;
				case 1:
					b->rdel = -1;
					break;
				default:
					b->rdel = 0;
				}
			} else {
				int tmp = rand() % 6;
				if (b->dir == UP) {
					switch(tmp) {
					case 0:
						b->rdel = 2;
						break;
					case 1:
						b->rdel = 0;
						break;
					default:
						b->rdel = 1;
					}
				} else {
					switch(tmp) {
					case 0:
						b->rdel = -2;
						break;
					case 1:
						b->rdel = 0;
						break;
					default:
						b->rdel = -1;
					}
				}
			}
			
			b->row += b->rdel;
			b->col += b->cdel;
		}

		// Toggle slow frames every frame
		b->slowframe = b->slowframe ? 0 : 1;

		// Delete enemy if the move off screen
		if (b->row < 10 || b->col < 0 || b->row > SCREENHEIGHT - b->height || b->col > SCREENWIDTH - b->width) {
			b->active = 0;
			b->erased = 0;
		}

		// Handle enemy-torpedo collisions
		for (int i = 0; i < TORPEDOCOUNT; i++) {
			if (torpedoes[i].active) {
				if (collision(torpedoes[i].col, torpedoes[i].row, torpedoes[i].width, torpedoes[i].height, b->col, b->row, b->width, b->height)) {
					torpedoes[i].active = 0;
					b->active = 0;
					if (!small) {
						score += SCORE_PUFF;
						// big pufferfish spawn small pufferfish out of them
						spawnSmallEnemies(b);
					} else {
						score += SCORE_MINI;
					}
				}
			}
		}

		// Handle ship-enemy collision
		if (collision(ship.sprite.col, ship.sprite.row, ship.sprite.width, ship.sprite.height, b->col, b->row, b->width, b->height)) {
			b->active = 0;
			// We only want to hurt the player if the aren't invincible from being hit recently
			if (ship.iframes <= 0) {
				lives--;
				ship.iframes = IFRAMES;
			}
		}
	}
}

// Draw the HUD
void drawHUD() {
	// We put this text on a static bar at the top of the screen because worrying about the game overlapping the text
	// would obliterate the performance.
	// Erase life counter
	drawRect(1 + 6 * 6, 1, 6, 8, BLACK);
	// Update life counter
	drawChar(1 + 6 * 6, 1, (char) ('0' + lives), WHITE);
	// Erase score counter
	drawRect(SCREENWIDTH - 1 - 6 * 22, 1, 6 * 6, 8, BLACK);
	// Update score counter with some magic math
	drawScore(1, 1, 22, score, WHITE);
}

// Draw the ship
void drawShip() {
	// We have to determine which erase method to use because moving sprite won't work if we don't also draw the sprite in the same frame
	if (!ship.invis) {
		eraseMovingSprite(&ship.sprite, bgColor);
		drawSprite(&ship.sprite);
	} else {
		eraseFullSprite(&ship.sprite, bgColor);
	}

	ship.sprite.oldRow = ship.sprite.row;
	ship.sprite.oldCol = ship.sprite.col;
}

// Draw a torpedo
void drawTorpedo(TORPEDO* b) {
	if(b->active) {
		drawRect(b->oldCol, b->oldRow, b->width, b->height, bgColor);
		drawRect(b->col, b->row, b->width, b->height, b->color);
	} else if (!b->erased) {
		drawRect(b->oldCol, b->oldRow, b->width, b->height, bgColor);
		b->erased = 1;
	}
	b->oldRow = b->row;
	b->oldCol = b->col;
}

// Draw a enemy
void drawEnemy(ENEMY* b) {
	if(b->active) {
		// we moved this frame if slowframe is now set to 1
		if (b->slowframe) {
			eraseMovingImage(b->col, b->row, b->oldCol, b->oldRow, b->width, b->height, bgColor);
		}
		// we want to draw just in case there was some overlapping
		drawImage(b->col, b->row, b->width, b->height, b->image);
	} else if (!b->erased) {
		drawRect(b->oldCol, b->oldRow, b->width, b->height, bgColor);
		b->erased = 1;
	}
	b->oldRow = b->row;
	b->oldCol = b->col;
}
