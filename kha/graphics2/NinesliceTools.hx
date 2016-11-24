package kha.graphics2;

// parameter naming
//  - c* = cut region
//	- s* = subimage region
//	- d* = destination

class NinesliceTools {
	public static inline function drawHorizontal3SliceImage( g2 : Graphics, image : Image, cx, cw, dx, dy, dw )
		drawHorizontal3SliceSubImage(g2, image, 0, 0, image.width, image.height, cx, cw, dx, dy, dw);

	public static inline function drawVertical3SliceImage( g2 : Graphics, image : Image, cy, ch, dx, dy, dh )
		drawVertical3SliceSubImage(g2, image, 0, 0, image.width, image.height, cy, ch, dx, dy, dh);

	public static function draw9SliceImage( g2 : Graphics, image : Image, cx, cy, cw, ch, dx, dy, dw, dh )
		draw9SliceSubImage(g2, image, 0, 0, image.width, image.height, cx, cy, cw, ch, dx, dy, dw, dh);
	
	public static inline function drawHorizontal3SliceSubImage( g2 : Graphics, image : Image, sx, sy, sw, sh, cx, cw, dx, dy, dw )
		draw9SliceSubImage(g2, image, sx, sy, sw, sh, cx, 0, cw, sh, dx, dy, dw, sh);

	public static inline function drawVertical3SliceSubImage( g2 : Graphics, image : Image, sx, sy, sw, sh, cy, ch, dx, dy, dh )
		draw9SliceSubImage(g2, image, sx, sy, sw, sh, 0, cy, sw, ch, dx, dy, sw, dh);

	public static function draw9SliceSubImage(
		g2 : Graphics, image : Image, sx : FastFloat, sy : FastFloat, sw : FastFloat, sh : FastFloat,
		cx : FastFloat, cy : FastFloat, cw : FastFloat, ch : FastFloat, dx : FastFloat, dy : FastFloat, dw : FastFloat, dh : FastFloat )
	{
		var rw = sw - cw - cx;
		var bh = sh - ch - cy;
		var mrx = dx + cx;
		var rrx = dx + dw - rw;
		var mrw = dw - cx - rw;
		var mrh = dh - cy - bh;
		var mry = dy + cy;
		var msy = sy + cy;
		var bsy = msy + ch;
		var bry = dy + dh - bh;
		var msx = sx + cx;
		var rsx = msx + cw;

		g2.drawScaledSubImage(image, sx,	sy,		cx,		cy,		dx,		dy,		cx,		cy);
		g2.drawScaledSubImage(image, msx,	sy,		cw, 	cy,		mrx,	dy,		mrw,	cy);
		g2.drawScaledSubImage(image, rsx, 	sy,		rw,		cy,		rrx,	dy,		rw,		cy);
		g2.drawScaledSubImage(image, sx,	msy,	cx,		ch, 	dx,		mry, 	cx,		mrh);
		g2.drawScaledSubImage(image, msx,	msy,	cw, 	ch, 	mrx,	mry,	mrw,	mrh);
		g2.drawScaledSubImage(image, rsx, 	msy,	rw,		ch, 	rrx,	mry, 	rw,		mrh);
		g2.drawScaledSubImage(image, sx,	bsy,	cx,		bh, 	dx,		bry,	cx,		bh);
		g2.drawScaledSubImage(image, msx,	bsy,	cw,		bh, 	mrx,	bry,	mrw,	bh);
		g2.drawScaledSubImage(image, rsx,	bsy,	rw,		bh, 	rrx,	bry,	rw,		bh);
	}

#if kha_textureatlas_extension
	// TODO (DK) handle subtextures with frames?

	public static inline function draw9SliceSubTexture( g2 : Graphics, t : SubTexture, cx, cy, cw, ch, dx, dy, dw, dh )
		draw9SliceSubImage(g2, t.image, t.sx, t.sy, t.sw, t.sh, cx, cy, cw, ch, dx, dy, dw, dh);

	public static inline function drawHorizontal3SliceSubTexture( g2 : Graphics, t : SubTexture, cx, cw, dx, dy, dw )
		drawHorizontal3SliceSubImage(g2, t.image, t.sx, t.sy, t.sw, t.sh, cx, cw, dx, dy, dw);

	public static inline function drawVertical3SliceSubTexture( g2 : Graphics, t : SubTexture, cy, ch, dx, dy, dh )
		drawVertical3SliceSubImage(g2, t.image, t.sx, t.sy, t.sw, t.sh, cy, ch, dx, dy, dh);
#end
}
