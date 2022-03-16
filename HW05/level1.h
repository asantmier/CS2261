
//{{BLOCK(level1)

//======================================================================
//
//	level1, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 32 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2048 + 2048 = 4608
//
//	Time-stamp: 2022-03-15, 20:25:40
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LEVEL1_H
#define GRIT_LEVEL1_H

#define level1TilesLen 2048
extern const unsigned short level1Tiles[1024];

#define level1MapLen 2048
extern const unsigned short level1Map[1024];

#define level1PalLen 512
extern const unsigned short level1Pal[256];

#endif // GRIT_LEVEL1_H

//}}BLOCK(level1)
