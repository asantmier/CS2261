#ifndef MOVES_H
#define MOVES_H

// Targeting mode enum
enum { OPPONENT, ALLY };

typedef struct tag_move {
    char text[10]; // 9 letters + \0
    char flavorText[61]; // 60 letters + \0
    int damage;
    int hitAll;
    int targeting;
    int healing;
} MOVE;

extern MOVE MOVE_SLASH;
extern MOVE MOVE_BLAST;
extern MOVE MOVE_HEAL;

#endif