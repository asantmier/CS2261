# 1 "moves.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "moves.c"
# 1 "moves.h" 1




enum { OPPONENT, ALLY };

typedef struct tag_move {
    char text[10];
    char flavorText[61];
    int damage;
    int hitAll;
    int targeting;
    int healing;
} MOVE;

extern MOVE MOVE_SLASH;
extern MOVE MOVE_BLAST;
extern MOVE MOVE_HEAL;
# 2 "moves.c" 2

MOVE MOVE_SLASH = { "SLASH", "%s STRUCK %s!", 4, 0, OPPONENT, 0 };
MOVE MOVE_BLAST = { "BLAST", "%s BLASTED THE ENEMY!", 3, 1, OPPONENT, 0 };
MOVE MOVE_HEAL = { "HEAL", "%s HEALED %s!", 0, 0, ALLY, 3 };
