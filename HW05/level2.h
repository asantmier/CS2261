
//{{BLOCK(level2)

//======================================================================
//
//	level2, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 9 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 576 + 2048 = 3136
//
//	Time-stamp: 2022-03-14, 21:38:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LEVEL2_H
#define GRIT_LEVEL2_H

#define level2TilesLen 576
extern const unsigned short level2Tiles[288];

#define level2MapLen 2048
extern const unsigned short level2Map[1024];

#define level2PalLen 512
extern const unsigned short level2Pal[256];

#endif // GRIT_LEVEL2_H

//}}BLOCK(level2)
