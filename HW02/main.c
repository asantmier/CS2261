
#include "lab2lib.h"
#include "sprites.h"
#include <stdlib.h>
#include <time.h>

// prototypes
void initialize();
void update();
void draw();
void updateStage();

// buttons
unsigned short buttons;
unsigned short oldButtons;

// background
unsigned short bgColor;

// player
Sprite player;
int stage;
Sprite oldPlayer;
int eraseOldPlayer;
// track whether the player is still alive
int alive;

// food
Sprite food = { 0, 0, 0, 0, 0, 0, FOOD_HEIGHT, FOOD_WIDTH, foodSprite };
const int DROP_TIME = 8 * 60;
int foodTimer;
int foodActive;
int eraseOldFood;

// spikes
Sprite spikes[] = { 
					{ SCREENHEIGHT + 999, 0, 0, 0, 1, 0, SPIKE_HEIGHT, SPIKE_WIDTH, spikeSprite },
					{ SCREENHEIGHT + 999, 0, 0, 0, 1, 0, SPIKE_HEIGHT, SPIKE_WIDTH, spikeSprite },
					{ SCREENHEIGHT + 999, 0, 0, 0, 1, 0, SPIKE_HEIGHT, SPIKE_WIDTH, spikeSprite } 
				};
int numSpikes = 3;
int spikeTimer;
const int SPIKE_TIME = 2 * 60;
// Drawing any more spikes causes crazy flicker, so this will do fine even if it's a bit easy

// victory screen
Sprite victory = { (SCREENHEIGHT / 2) - (CONGRAT_HEIGHT / 2), (SCREENWIDTH / 2) - (CONGRAT_WIDTH / 2), 0, 0, 0, 0, CONGRAT_HEIGHT, CONGRAT_WIDTH, congratSprite };
Sprite restart = { 10, (SCREENWIDTH / 2) - (RESTART_WIDTH / 2), 0, 0, 0, 0, RESTART_HEIGHT, RESTART_WIDTH, restartSprite };

int main() {
	while(1) {
		initialize();

		// we'll use this later to flash the "press start to play again" prompt
		int flashTimer = 0;

		// If alive is ever set to 0, the game will reset
		while (alive) {
			// update the button variables each frame
			oldButtons = buttons;
			buttons = BUTTONS;
			if (stage < 4) {
				// Player hasn't won yet
				update();
				waitForVBlank();
				draw();
			} else {
				// Player has won
				flashTimer++;
				waitForVBlank();
				// Congratulatory text (doesn't need to be every frame but it doesn't flicker so I don't care)
				drawSprite(&victory);
				// Flash the play again text
				if (flashTimer == 30) {
					drawSprite(&restart);
				} else if (flashTimer == 60) {
					eraseFullSprite(&restart, bgColor);
					flashTimer = 0;
				}
				
				// reset the game
				if (BUTTON_PRESSED(BUTTON_START)) {
					alive = 0;
				}
			}
		}
	}	
}

// sets up the display and the game "objects"
void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	// seed random
	srand(368566);

	// init timer
	foodTimer = 0;
	spikeTimer = 0;

	// intialize button variables
	buttons = BUTTONS;
	oldButtons = 0;

	// initialize background color and draw background
	bgColor = WHITE;
	fillScreen(bgColor);				

	// initialize player
	stage = 1;
	alive = 1;
	updateStage();
	player.col = (SCREENWIDTH / 2) - (player.width / 2);
	player.oldRow = player.row;
	player.oldCol = player.col;
	player.rDel = 2;
	player.cDel = 2;
	eraseOldPlayer = 0;

	// initialize spikes
	for (int i = 0; i < numSpikes; i++) {
		spikes[i].row = SCREENHEIGHT + 999;
	}

	// initialize food
	foodActive = 0;
	eraseOldFood = 0;
}

// performs all of the game's calculations
void update() {

	// Try adding food
	foodTimer++;
	if (!foodActive && foodTimer > DROP_TIME) {
		food.row = SCREENHEIGHT - food.height;
		// r's max bound is the number of spaces a food is allowed to spawn in
		int r = rand() % (SCREENWIDTH - food.width - player.width);
		// if r is to the right of the left of player, add player's width to prevent overlap
		if (r > player.col) {
			food.col = r + player.width;
		} else {
			food.col = r;
		}
		// Tell game there is food on screen
		foodActive = 1;
	}

	// Try adding a spike
	spikeTimer++;
	if (spikeTimer > SPIKE_TIME) {
		for (int i = 0; i < numSpikes; i++) {
			// Uses the first spike that isn't on screen
			if (spikes[i].row > SCREENHEIGHT) {
				spikes[i].row = 0;
				spikes[i].col = rand() % (SCREENWIDTH - spikes[i].width);
				spikeTimer = 0;
				break;
			}
		}
	}
	// Move spikes
	for (int i = 0; i < numSpikes; i++) {
		spikes[i].row += spikes[i].rDel;
	}

	// Move player
	if (BUTTON_HELD(BUTTON_LEFT)) {
		int tmp = player.col - player.cDel;
		player.col = tmp < 0 ? 0 : tmp;
	}
	if (BUTTON_HELD(BUTTON_RIGHT)) {
		int tmp = player.col + player.cDel;
		player.col = tmp + player.width > SCREENWIDTH ? (SCREENWIDTH - 1) - (player.width - 1) : tmp;
	}

	// Collide with food
	if (foodActive && collision(player.col, player.row, player.width, player.height, food.col, food.row, food.width, food.height)) {
		foodActive = 0;
		foodTimer = 0;
		// flags draw() to erase the food
		eraseOldFood = 1;
		stage++;
		updateStage();
	}
	// Collide with spikes
	for (int i = 0; i < numSpikes; i++) {
		if (spikes[i].row < SCREENHEIGHT) {
			if (collision(player.col, player.row, player.width, player.height, spikes[i].col, spikes[i].row, spikes[i].width, spikes[i].height)) {
				// This will break the inner game loop causing a reset
				alive = 0;
				break;
			}
		}
	}
}

void updateStage() {
	// Sets the tamagotchi's growth stage and relevant variables
	// All of this is used to erase the old player sprite before changing because each sprite is a different shape
	oldPlayer.height = player.height;
	oldPlayer.width = player.width;
	oldPlayer.oldRow = player.oldRow;
	oldPlayer.oldCol = player.oldCol;
	oldPlayer.row = player.row;
	oldPlayer.col = player.col;
	oldPlayer.sprite = player.sprite;
	// Flag draw() to erase this instead of player
	eraseOldPlayer = 1;
	switch(stage) {
		case 1:
			player.height = TAMA1_HEIGHT;
			player.width = TAMA1_WIDTH;
			player.row = SCREENHEIGHT - player.height;
			player.sprite = tama1Sprite;
			break;
		case 2:

			player.height = TAMA2_HEIGHT;
			player.width = TAMA2_WIDTH;
			player.row = SCREENHEIGHT - player.height;
			player.sprite = tama2Sprite;
			break;
		case 3:
			player.height = TAMA3_HEIGHT;
			player.width = TAMA3_WIDTH;
			player.row = SCREENHEIGHT - player.height;
			player.sprite = tama3Sprite;
			break;
		case 4:
			// Do nothing, the player will win in main
			break;
	}
}

// performs all of the writing to screen
void draw() {
	// erase the previous player location
	if (eraseOldPlayer) {
		// Gets rid of the old player sprite on this frame only
		eraseMovingSprite(&oldPlayer, bgColor);
		eraseOldPlayer = 0;
	} else {
		eraseMovingSprite(&player, bgColor);
	}

	// erase the food only once after it's been eaten
	if (eraseOldFood) {
		eraseFullSprite(&food, bgColor);
		eraseOldFood = 0;
	}

	// draw spikes
	for (int i = 0; i < numSpikes; i++) {
		if (spikes[i].oldRow < SCREENHEIGHT) {
			eraseMovingSprite(&spikes[i], bgColor);
		}
		if (spikes[i].row < SCREENHEIGHT) {
			drawSprite(&spikes[i]);
		}
	}

	// We actually need to do this every frame because falling spikes can overlap the food
	// You could optimize this to do it less often 'cause collision is faster but its good enough
	if (foodActive) {
		drawSprite(&food);
	}

	// draw the new player location
	drawSprite(&player);

	// update old variables
	player.oldRow = player.row;
	player.oldCol = player.col;

	// really only needs to be called once per food spawn but who cares
	food.oldRow = food.row;
	food.oldCol = food.col;

	for (int i = 0; i < numSpikes; i++) {
		spikes[i].oldRow = spikes[i].row;
		spikes[i].oldCol = spikes[i].col;
	}
}
