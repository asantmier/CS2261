#include <stdlib.h>
#include <string.h>
#include "HW04Lib.h"
#include "game.h"
#include "text.h"
#include "images.h"

// Variables
PLAYER player;
BULLET playerBullets[PLAYER_BULLET_NUM];
BULLET alienBullets[ALIEN_BULLET_NUM];
ALIENROW alienRows[NUM_ROWS];
EXPLOSION explosions[EXPLOSION_MAX];
int lives;
int score;
int stage;
int hiscore = 0;
int aliensRemaining;
int lastLives; // keeps track of how many lives we had last frame
int lastScore; // same idea
int lastStage; // ditto
int gameOver;
int gameOverDelay; // delay before aliens move off screen on loss
int victory;
int victoryDelay; // delay before the player moves off screen on victory
int startUpDelay; // delay at stage start

// Initialize the game based on the stage. This lets us initialize everything on the first stage, and only necesasry components on subsequent stages
void initGame(int setStage) {
	// Player and aliens alwys need their values reset
	initPlayer();
	initAliens();
	aliensRemaining = NUM_ROWS * ALIENS_PER_ROW;
	victory = 0;
	victoryDelay = 60;
	stage = setStage;
	startUpDelay = 100;
	// If this is the starting stage, reset everything else
	if (setStage == 1) {
		// Bullets and explosions are auto recycled
		initBullets();
		initExplosions();
		lives = LIFEMAX;
		lastLives = lives;
		score = 0;
		lastScore = score;
		stage = 1;
		lastStage = stage;
		gameOver = 0;
		gameOverDelay = 60;
	} else {
		// Because the player just got reset, set their image here (its a lot of work to do this in initPlayer)
		switch(lives) {
			case 3:
				player.bodyImage = spaceship_body_1Bitmap;
				break;
			case 2:
				player.bodyImage = spaceship_body_2Bitmap;
				break;
			case 1:
				player.bodyImage = spaceship_body_3Bitmap;
				break;
			case 0:
				player.bodyImage = spaceship_body_4Bitmap;
				break;
		}
	}
}

// Updates the game each frame
void updateGame() {
	// Do nothing if we're in the startup period
	if (startUpDelay) {
		startUpDelay--;
		return;
	}
	if (lives) {
		if (aliensRemaining) {
			// Update player
			updatePlayer();
			// Update bullets
			for (int i = 0; i < PLAYER_BULLET_NUM; i++) {
				if (playerBullets[i].active) {
					updatePlayerBullet(&playerBullets[i]);
				}
			}
			for (int i = 0; i < ALIEN_BULLET_NUM; i++) {
				if (alienBullets[i].active) {
					updateAlienBullet(&alienBullets[i]);
				}
			}
			// Update alien rows
			for (int i = 0; i < NUM_ROWS; i++) {
				updateAlienRow(&alienRows[i]);
			}
			// Update explosions
			for (int i = 0; i < EXPLOSION_MAX; i++) {
				if(explosions[i].active) {
					updateExplosion(&explosions[i]);
				}
			}
		} else {
			// Disable iframes
			player.iframes = 0;
			// Disable bullets
			for (int i = 0; i < PLAYER_BULLET_NUM; i++) {
				playerBullets[i].active = 0;
			}
			for (int i = 0; i < ALIEN_BULLET_NUM; i++) {
				alienBullets[i].active = 0;
			}
			// Update explosions
			for (int i = 0; i < EXPLOSION_MAX; i++) {
				if(explosions[i].active) {
					updateExplosion(&explosions[i]);
				}
			}
			// Wait a bit before continuting; and yes, this is unoptimized
			victoryDelay--;
			if (victoryDelay <= 0) {
				// Play victory animation
				player.row -= 1;
				if (player.row + IMAGE_SIZE < 0) {
					victory = 1;
				}
			}
		}
	} else {
		// Disable bullets
		for (int i = 0; i < PLAYER_BULLET_NUM; i++) {
			playerBullets[i].active = 0;
		}
		for (int i = 0; i < ALIEN_BULLET_NUM; i++) {
			alienBullets[i].active = 0;
		}
		// Update explosions
		for (int i = 0; i < EXPLOSION_MAX; i++) {
			if(explosions[i].active) {
				updateExplosion(&explosions[i]);
			}
		}
		// Wait a bit before continuting; and yes, this is unoptimized
		gameOverDelay--;
		if (gameOverDelay <= 0) {
			// Play outro animation
			for (int i = 0; i < NUM_ROWS; i++) {
				for (int j = 0; j < ALIENS_PER_ROW; j++) {
					alienRows[i].aliens[j].row -= 1;
				}
			}
			if (alienRows[0].aliens[0].row + IMAGE_SIZE < 0) {
				gameOver = 1;
			}
		}
	}

}

// Draws the game each frame
void drawGame() {
	// Clear the screen, but not the HUD
	drawImage4(0, HUD_HEIGHT, SCREENWIDTH, SCREENHEIGHT - HUD_HEIGHT, 
				backgroundBitmap + OFFSET(0, HUD_HEIGHT, SCREENWIDTH) / 2);
	// Draw HUD
	drawHUD();
	// Draw player
	drawPlayer();
	// Draw aliens
	for (int i = 0; i < NUM_ROWS; i++) {
		for (int j = 0; j < ALIENS_PER_ROW; j++) {
			if (alienRows[i].aliens[j].alive) {
				drawAlien(&(alienRows[i].aliens[j]));
			}
		}
	}
	// Draw Explosions
	for (int i = 0; i < EXPLOSION_MAX; i++) {
		if(explosions[i].active) {
			drawExplosion(&explosions[i]);
		}
	}
	// Draw bullets
	for (int i = 0; i < PLAYER_BULLET_NUM; i++) {
		if (playerBullets[i].active) {
			drawBullet(&playerBullets[i]);
		}
	}
	for (int i = 0; i < ALIEN_BULLET_NUM; i++) {
		if (alienBullets[i].active) {
			drawBullet(&alienBullets[i]);
		}
	}
	// Draw startup text
	if (startUpDelay) {
		// Yes this is slow to do each frame and I could optimize this since the game might be running
		// at below 60fps during this time, but it really doesn't matter since there's no movement
		// or input right now anyway
		drawString4((SCREENWIDTH - STRINGWIDTH(5)) / 2, 94, "READY", WHITE_IDX);
		if (startUpDelay <= 30) {
			drawString4((SCREENWIDTH - STRINGWIDTH(2)) / 2, 94 + 15, "GO", WHITE_IDX);
		}
	}
}

// Initialize the player
void initPlayer() {
	player.row = SCREENHEIGHT - 24 - 3;
	player.col = (SCREENWIDTH - 24) / 2;
	player.rdel = 0;
	player.cdel = 2;
	player.bodyHeight = 21;
	player.bodyWidth = 24;
	player.bodyImage = spaceship_body_1Bitmap;
	player.jetHeight = 3;
	player.jetWidth = 24;
	player.jetImage1 = spaceship_jet_1Bitmap;
	player.jetImage2 = spaceship_jet_2Bitmap;
	player.jetFrame = 1;
	player.jetTimer = JET_ANIM_LENGTH;
	player.cooldown = 0;
	player.iframes = 0;
}

// Initialize the pool of bullets for the player and aliens
void initBullets() {
	// The position of the bullets is irrelevant
	for (int i = 0; i < PLAYER_BULLET_NUM; i++) {
		playerBullets[i].rdel = -2;
		playerBullets[i].cdel = 0;
		playerBullets[i].height = 2;
		playerBullets[i].width = 1;
		playerBullets[i].colorIndex = BLUE_IDX;
		playerBullets[i].active = 0;
	}
	for (int i = 0; i < ALIEN_BULLET_NUM; i++) {
		alienBullets[i].rdel = 1;
		alienBullets[i].cdel = 0;
		alienBullets[i].height = 2;
		alienBullets[i].width = 1;
		// The colorIndex of alien bullets is dynamic
		alienBullets[i].active = 0;
	}
}

// Initialize the aliens
void initAliens() {
	for (int i = 0; i < NUM_ROWS; i++) {
		switch (i)
		{
		case 0:
			alienRows[i].row = 67;
			alienRows[i].cdel = -1;
			break;
		case 1:
			alienRows[i].row = 39;
			alienRows[i].cdel = 1;
			break;
		case 2:
			alienRows[i].row = 11;
			alienRows[i].cdel = -1;
			break;
		}
		alienRows[i].rdel = 0;
		alienRows[i].space = 4;
		alienRows[i].height = IMAGE_SIZE;
		alienRows[i].width = alienRows[i].space * (ALIENS_PER_ROW - 1) + IMAGE_SIZE * ALIENS_PER_ROW; // how wide is this row?
		alienRows[i].col = (SCREENWIDTH - alienRows[i].width) / 2;
		for (int j = 0; j < ALIENS_PER_ROW; j++) {
			alienRows[i].aliens[j].alive = 1;
			alienRows[i].aliens[j].height = IMAGE_SIZE;
			alienRows[i].aliens[j].width = IMAGE_SIZE;
			alienRows[i].aliens[j].col = alienRows[i].col + (j * IMAGE_SIZE) + (j * alienRows[i].space);
			alienRows[i].aliens[j].row = alienRows[i].row;
			alienRows[i].aliens[j].cooldown = 30; // give the player a little grace period
			// What kind of alien is this?
			switch (i)
			{
			case 0:
				alienRows[i].aliens[j].image = alien_1Bitmap;
				alienRows[i].aliens[j].bulletColor = GREEN_IDX;
				alienRows[i].aliens[j].score = SCORE_ALIEN_1;
				break;
			case 1:
				alienRows[i].aliens[j].image = alien_2Bitmap;
				alienRows[i].aliens[j].bulletColor = YELLOW_IDX;
				alienRows[i].aliens[j].score = SCORE_ALIEN_2;
				break;
			case 2:
				alienRows[i].aliens[j].image = alien_3Bitmap;
				alienRows[i].aliens[j].bulletColor = RED_IDX;
				alienRows[i].aliens[j].score = SCORE_ALIEN_3;
				break;
			}
		}
	}
}

// Initialize the explosion pool
void initExplosions() {
	// The position of the explosions is set at runtime
	for (int i = 0; i < EXPLOSION_MAX; i++) {
		explosions[i].height = IMAGE_SIZE;
		explosions[i].width = IMAGE_SIZE;
		explosions[i].image1 = explosion_1Bitmap;
		explosions[i].image2 = explosion_2Bitmap;
		explosions[i].image3 = explosion_3Bitmap;
		explosions[i].animFrame = 1;
		explosions[i].animTimer = EXPLOSION_ANIM_LENGTH;
		explosions[i].active = 0;
	}
}

// Updates the player
void updatePlayer() {
	// Update jet animation
	if (player.jetTimer == 0) {
		player.jetFrame = player.jetFrame ? 0 : 1;
		player.jetTimer = JET_ANIM_LENGTH;
	} else {
		player.jetTimer--;
	}

	// Move player
	if (BUTTON_HELD(BUTTON_LEFT)) {
		player.col -= player.cdel;
		if (player.col < 0) {
			player.col = 0;
		}
	} else if (BUTTON_HELD(BUTTON_RIGHT)) {
		player.col += player.cdel;
		if (player.col + player.bodyWidth - 1 >= SCREENWIDTH) {
			player.col = SCREENWIDTH - player.bodyWidth;
		}
	}

 	// Fire bullet
	if (BUTTON_PRESSED(BUTTON_B) && player.cooldown <= 0) {
 		firePlayerBullet();
		player.cooldown = BULLET_COOLDOWN;
	} else {
		player.cooldown--;
	}

	// Iframe logic
	if (player.iframes > 0) {
		player.iframes--;
	}
}

// Updates a player's bullet
void updatePlayerBullet(BULLET* bullet) {
	// Move bullet
	bullet->row += bullet->rdel;
	if (bullet->row < HUD_HEIGHT) {
		bullet->active = 0;
	}
	// Check for collision
	for (int i = 0; i < NUM_ROWS; i++) {
		for (int j = 0; j < ALIENS_PER_ROW; j++) {
			ALIEN* alien = &(alienRows[i].aliens[j]);
			int collided = collision(bullet->col, bullet->row, bullet->width, bullet->height,
									 alien->col, alien->row, alien->width, alien->height); 
			if (alien->alive && collided) {
				alien->alive = 0;
				aliensRemaining--;
				bullet->active = 0;
				score += alien->score;
				for (int k = 0; k < EXPLOSION_MAX; k++) {
					if (!explosions[k].active) {
						explosions[k].active = 1;
						explosions[k].col = alien->col;
						explosions[k].row = alien->row;
						// Explosions reset themselves so this is all we need to do
						break;
					}
				}
				// play sound
				REG_SND2CNT = DMG_DUTY_75 | DMG_STEP_TIME(1) | DMG_DIRECTION_DECR | DMG_ENV_VOL(15);
				REG_SND2FREQ = NOTE_E2 | SND_RESET | DMG_FREQ_TIMED;
				break;
			}
		}
	}
}

// Updates an alien's bullet
void updateAlienBullet(BULLET* bullet) {
	// Move bullet
	bullet->row += bullet->rdel;
	if (bullet->row >= SCREENHEIGHT) {
		bullet->active = 0;
	}
	// Check for collision
	if (!player.iframes && collision(bullet->col, bullet->row, bullet->width, bullet->height,
									 player.col, player.row, player.bodyWidth, player.bodyHeight)) {
		lives--;
		bullet->active = 0;
		// Update player image
		switch(lives) {
			case 2:
				player.bodyImage = spaceship_body_2Bitmap;
				player.iframes = IFRAMES;
				break;
			case 1:
				player.bodyImage = spaceship_body_3Bitmap;
				player.iframes = IFRAMES;
				break;
			case 0:
				player.bodyImage = spaceship_body_4Bitmap;
				break;
		}
		// play sound
		REG_SND2CNT = DMG_DUTY_12 | DMG_STEP_TIME(1) | DMG_DIRECTION_DECR | DMG_ENV_VOL(15);
		REG_SND2FREQ = NOTE_D2 | SND_RESET | DMG_FREQ_TIMED;
	}
}

// Updates a row of aliens
void updateAlienRow(ALIENROW* alienRow) {
	// Update position
	alienRow->col += alienRow->cdel;
	if (alienRow->col < 0) {
		alienRow->col = 0;
		alienRow->cdel *= -1;
	}
	if (alienRow->col + alienRow->width - 1 >= SCREENWIDTH) {
		alienRow->col = SCREENWIDTH - alienRow->width;
		alienRow->cdel *= -1;
	}

	// Update position of aliens in row
	for (int j = 0; j < ALIENS_PER_ROW; j++) {
		alienRow->aliens[j].col = alienRow->col + (j * IMAGE_SIZE) + (j * alienRow->space);
		alienRow->aliens[j].row = alienRow->row;
		// Try shooting
		if (alienRow->aliens[j].alive && alienRow->aliens[j].cooldown <= 0) {
			// Modify the fire rate based on how many aliens are left to try and keep up the difficulty
			if (rand() % (25 * aliensRemaining) == 0) {
				fireAlienBullet(&(alienRow->aliens[j]));
				alienRow->aliens[j].cooldown = ALIEN_BULLET_COOLDOWN;
			}
		} else {
			alienRow->aliens[j].cooldown--;
		}
	}
}

// Updates an explosion
void updateExplosion(EXPLOSION* explosion) {
	// Every few frames, change the image used
	if (explosion->animTimer == 0) {
		explosion->animFrame++;
		explosion->animTimer = EXPLOSION_ANIM_LENGTH;
		if (explosion->animFrame > 3) {
			// If it finished animating, reset it for the pool
			explosion->animFrame = 1;
			explosion->active = 0;
		}
	} else {
		explosion->animTimer--;
	}
}

// Fires a player bullet
void firePlayerBullet() {
	for (int i = 0; i < PLAYER_BULLET_NUM; i++) {
		if (!playerBullets[i].active) {
			playerBullets[i].active = 1;
			playerBullets[i].col = player.col + (player.bodyWidth / 2);
			playerBullets[i].row = player.row - playerBullets[i].height;
			// play sound
			REG_SND1SWEEP = DMG_SWEEP_NUM(5) | DMG_SWEEP_DOWN | DMG_SWEEP_STEPTIME(2);
			REG_SND1CNT = DMG_DUTY_12 | DMG_STEP_TIME(3) | DMG_DIRECTION_DECR | DMG_ENV_VOL(15);
			REG_SND1FREQ = NOTE_A4 | SND_RESET | DMG_FREQ_TIMED;
			break;
		}
	}
}

// Fires an alien bullet
void fireAlienBullet(ALIEN* a) {
	for (int i = 0; i < ALIEN_BULLET_NUM; i++) {
		if (!alienBullets[i].active) {
			alienBullets[i].active = 1;
			alienBullets[i].col = a->col + (a->width / 2);
			alienBullets[i].row = a->row + a->height;
			alienBullets[i].colorIndex = a->bulletColor;
			break;
		}
	}
}

// Draw the HUD
void drawHUD() {
	// All the fancy logic in here ensures that text is drawn as infrequently as possible.
	// Every time text is updated, a flag is set to update it on the next frame as well.
	// This saves us the work of drawing text on every frame, even if it doesn't change.
	static int updateLifeNextPage = 0;
	static int updateStageNextPage = 0;
	static int updateScoreNextPage = 0;
	// Draw lives
	if (lastLives != lives || updateLifeNextPage) {
		drawRect4(1 + STRINGWIDTH(6 + lives), 1, 6, 8, HUD_COLOR);
		if (lastLives != lives) {
			lastLives = lives;
			updateLifeNextPage = 1;
		} else if (updateLifeNextPage) {
			updateLifeNextPage = 0;
		}
	}
	// Draw stage
	if (lastStage != stage || updateStageNextPage) {
		drawRect4(((SCREENWIDTH - STRINGWIDTH(8)) / 2) + STRINGWIDTH(6), 1, STRINGWIDTH(2), 8, HUD_COLOR);
        drawInt4(((SCREENWIDTH - STRINGWIDTH(8)) / 2) + STRINGWIDTH(6), 1, 2, stage, WHITE_IDX);
		if (lastStage != stage) {
			lastStage = stage;
			updateStageNextPage = 1;
		} else if (updateStageNextPage) {
			updateStageNextPage = 0;
		}
	}
	// Draw score
	if (lastScore != score || updateScoreNextPage) {
		drawRect4(SCREENWIDTH - 1 - STRINGWIDTH(6), 1, STRINGWIDTH(6), 8, HUD_COLOR);
		drawInt4(SCREENWIDTH - 1 - STRINGWIDTH(6), 1, 6, score, WHITE_IDX);
		if (lastScore != score) {
			lastScore = score;
			updateScoreNextPage = 1;
		} else if (updateScoreNextPage) {
			updateScoreNextPage = 0;
		}
	}
}

// Draw the player
void drawPlayer() {
	// We check if the images are above the hud so that we can avoid drawing over it when doing the win animation
	// Draw body
	if (player.row >= HUD_HEIGHT) {
		// Every 4 frames the player will toggle between visible and invivisible
		if (!(player.iframes && player.iframes % 8 < 4)) {
			drawImage4(player.col, player.row, player.bodyWidth, player.bodyHeight, player.bodyImage);
		}
	} else {
		// This part is used for the victory animation. This also means iframe code is irrelevant
		drawImage4(player.col, 
					player.row + (HUD_HEIGHT - player.row), 
					player.bodyWidth,
					player.bodyHeight - (HUD_HEIGHT - player.row),
					player.bodyImage + OFFSET(0, (HUD_HEIGHT - player.row), player.bodyWidth) / 2);
	}
	// Draw jet
	int jetRow = player.row + player.bodyHeight;
	if (jetRow >= HUD_HEIGHT) {
		// Every 4 frames the player will toggle between visible and invivisible
		if (!(player.iframes && player.iframes % 8 < 4)) {
			if (player.jetFrame == 1) {
				drawImage4(player.col, jetRow, player.jetWidth, player.jetHeight, player.jetImage1);
			} else {
				drawImage4(player.col, jetRow, player.jetWidth, player.jetHeight, player.jetImage2);
			}
		}
	} else {
		// This part is used for the victory animation. This also means iframe code is irrelevant
		if (player.jetFrame == 1) {
			drawImage4(player.col,
						jetRow + (HUD_HEIGHT - jetRow),
						player.jetWidth,
						player.jetHeight - (HUD_HEIGHT - jetRow),
						player.jetImage1 + OFFSET(0, (HUD_HEIGHT - jetRow), player.jetWidth) / 2);
		} else {
			drawImage4(player.col,
						jetRow + (HUD_HEIGHT - jetRow),
						player.jetWidth,
						player.jetHeight - (HUD_HEIGHT - jetRow),
						player.jetImage2 + OFFSET(0, (HUD_HEIGHT - jetRow), player.jetWidth) / 2);
		}
	}
}

// Draw a bullet
void drawBullet(BULLET* b) {
	drawRect4(b->col, b->row, b->width, b->height, b->colorIndex);
}

// Draw an alien
void drawAlien(ALIEN* a) {
	// We check if the image is above the hud so that we can avoid drawing over it when doing the lose animation
	if (a->row >= HUD_HEIGHT) {
		drawImage4(a->col, a->row, a->width, a->height, a->image);
	} else {
		// This part is used in the ending animation
		drawImage4(a->col,
					a->row + (HUD_HEIGHT - a->row),
		 			a->width, 
					a->height - (HUD_HEIGHT - a->row),
		  			a->image + OFFSET(0, (HUD_HEIGHT - a->row), a->width) / 2);
	}
}

// Draw an explosion
void drawExplosion(EXPLOSION* e) {
	// Set this variable based on which frame of the animation we're on
	const unsigned short* image = NULL;
	switch (e->animFrame)
	{
	case 1:
		image = e->image1;
		break;
	case 2:
		image = e->image2;
		break;
	case 3:
		image = e->image3;
		break;
	}
	drawImage4(e->col, e->row, e->width, e->height, image);
}
