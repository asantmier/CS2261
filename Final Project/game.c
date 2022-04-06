#include <stdlib.h>
#include "mode0.h"
#include "print.h"
#include "game.h"

int submarineHp;
COMBATANT battleAllies[4];
COMBATANT battleOpponents[4];

// Initialize the game
void initGame() {
    submarineHp = 100;
    initParty();
}

// Set up the default player party
void initParty() {
    battleAllies[0].exists = 1;
    battleAllies[0].hp = 10;
    battleAllies[0].damage = 8;
    battleAllies[1].exists = 1;
    battleAllies[1].hp = 6;
    battleAllies[1].damage = 6;
}
