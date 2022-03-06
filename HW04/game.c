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
int lives;
int score;
int hiscore = 0;
int aliensRemaining;

// Initialize the game
void initGame() {
	initPlayer();
	initBullets();
	initAliens();
	lives = LIFEMAX;
	score = 0;
	aliensRemaining = NUM_ROWS * ALIENS_PER_ROW;
}

// Updates the game each frame
void updateGame() {
	// Update player
	updatePlayer();
	// Update bullets
	for (int i = 0; i < PLAYER_BULLET_NUM; i++) {
		if (playerBullets[i].active) {
			updateBullet(&playerBullets[i]);
		}
	}
	for (int i = 0; i < ALIEN_BULLET_NUM; i++) {
		if (alienBullets[i].active) {
			updateBullet(&alienBullets[i]);
		}
	}
	// Update alien rows
	for (int i = 0; i < NUM_ROWS; i++) {
		updateAlienRow(&alienRows[i]);
	}
}

// Draws the game each frame
void drawGame() {
	// Clear the screen
	drawFullscreenImage4(backgroundBitmap);
	// Draw HUD
	drawHUD();
	// Draw player
	drawPlayer();
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
	// Draw aliens
	for (int i = 0; i < NUM_ROWS; i++) {
		for (int j = 0; j < ALIENS_PER_ROW; j++) {
			if (alienRows[i].aliens[j].alive) {
				drawAlien(&(alienRows[i].aliens[j]));
			}
		}
	}
}

// Initialize the player
void initPlayer() {
	player.row = SCREENWIDTH - 12;
	player.col = SCREENHEIGHT - 12 - 10;
	player.rdel = 1;
	player.cdel = 1;
	player.bodyHeight = 21;
	player.bodyWidth = 24;
	player.bodyImage = spaceship_body_1Bitmap;
	player.jetHeight = 3;
	player.jetWidth = 24;
	player.jetImage1 = spaceship_jet_1Bitmap;
	player.jetImage1 = spaceship_jet_2Bitmap;
	player.jetFrame = 1;
	player.jetTimer = JET_ANIM_LENGTH;
	player.cooldown = 0;
	player.iframes = 0;
}

// Initialize the pool of bullets for the player and aliens
void initBullets() {
	// The position of the bullets is irrelevant
	for (int i = 0; i < PLAYER_BULLET_NUM; i++) {
		playerBullets[i].rdel = 1;
		playerBullets[i].cdel = 0;
		playerBullets[i].height = 2;
		playerBullets[i].width = 1;
		playerBullets[i].colorIndex = BLUE_IDX;
		playerBullets[i].active = 0;
	}
	for (int i = 0; i < ALIEN_BULLET_NUM; i++) {
		alienBullets[i].rdel = -1;
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
			alienRows[i].row = 110;
			alienRows[i].rdel = -1;
			break;
		case 1:
			alienRows[i].row = 80;
			alienRows[i].rdel = 1;
			break;
		case 2:
			alienRows[i].row = 30;
			alienRows[i].rdel = -1;
			break;
		}
		alienRows[i].cdel = 0;
		alienRows[i].space = 4;
		alienRows[i].width = alienRows[i].space * (ALIENS_PER_ROW - 1) + IMAGE_SIZE * ALIENS_PER_ROW;
		alienRows[i].col = (SCREENWIDTH - alienRows[i].width) / 2;
		for (int j = 0; j < ALIENS_PER_ROW; j++) {
			alienRows[i].aliens[j].alive = 1;
			alienRows[i].aliens[j].height = IMAGE_SIZE;
			alienRows[i].aliens[j].width = IMAGE_SIZE;
			alienRows[i].aliens[j].col = alienRows[i].col + (j * IMAGE_SIZE) + (j * alienRows[i].space);
			switch (i)
			{
			case 0:
				alienRows[i].aliens[j].image = alien_1Bitmap;
				alienRows[i].aliens[j].bulletColor = GREEN_IDX;
				break;
			case 1:
				alienRows[i].aliens[j].image = alien_2Bitmap;
				alienRows[i].aliens[j].bulletColor = YELLOW_IDX;
				break;
			case 2:
				alienRows[i].aliens[j].image = alien_3Bitmap;
				alienRows[i].aliens[j].bulletColor = RED_IDX;
				break;
			}
		}
	}
}

// Updates the player
void updatePlayer() {

}

// Updates a bullet
void updateBullet(BULLET* bullet) {

}

// Updates a row of aliens
void updateAlienRow(ALIENROW* alienRow) {

}

// Draw the HUD
void drawHUD() {
	drawString4(1, 1, "Lives:", WHITE_IDX);
	for (int i = 0; i < lives; i++) {
		drawChar4(1 + STRINGWIDTH(6 + i), 1, 3, WHITE_IDX);
	}
    drawString4(SCREENWIDTH - 1 - STRINGWIDTH(12), 1, "Score:", WHITE_IDX);
	drawInt4(SCREENWIDTH - 1 - STRINGWIDTH(6), 1, 6, score, WHITE_IDX);
}

// Draw the player
void drawPlayer() {
	drawImage4(player.col, player.row, player.bodyWidth, player.bodyHeight, player.bodyImage);
	if (player.jetFrame == 1) {
		drawImage4(player.col, player.row + player.bodyHeight, player.jetWidth, player.jetHeight, player.jetImage1);
	} else {
		drawImage4(player.col, player.row + player.bodyHeight, player.jetWidth, player.jetHeight, player.jetImage2);
	}
}

// Draw a bullet
void drawBullet(BULLET* b) {
	drawRect4(b->col, b->row, b->width, b->height, b->colorIndex);
}

// Draw an alien
void drawAlien(ALIEN* a) {
	drawImage4(a->col, a->row, a->width, a->height, a->image);
}
