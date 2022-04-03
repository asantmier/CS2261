
//{{BLOCK(tempsplash)

//======================================================================
//
//	tempsplash, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 52 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3328 + 2048 = 5888
//
//	Time-stamp: 2022-04-03, 13:33:20
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TEMPSPLASH_H
#define GRIT_TEMPSPLASH_H

#define tempsplashTilesLen 3328
extern const unsigned short tempsplashTiles[1664];

#define tempsplashMapLen 2048
extern const unsigned short tempsplashMap[1024];

#define tempsplashPalLen 512
extern const unsigned short tempsplashPal[256];

#endif // GRIT_TEMPSPLASH_H

//}}BLOCK(tempsplash)
