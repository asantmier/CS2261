
//{{BLOCK(world1)

//======================================================================
//
//	world1, 1024x1024@8, 
//	+ palette 256 entries, not compressed
//	+ 50 tiles (t reduced) not compressed
//	+ affine map, not compressed, 128x128 
//	Total size: 512 + 3200 + 16384 = 20096
//
//	Time-stamp: 2022-04-12, 17:28:17
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WORLD1_H
#define GRIT_WORLD1_H

#define world1TilesLen 3200
extern const unsigned short world1Tiles[1600];

#define world1MapLen 16384
extern const unsigned short world1Map[8192];

#define world1PalLen 512
extern const unsigned short world1Pal[256];

#endif // GRIT_WORLD1_H

//}}BLOCK(world1)
