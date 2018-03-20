package kex.slice;

import kex.SubTexture;
import kha.FastFloat;
import kha.graphics2.Graphics;
import kha.Image;

// parameter naming
//  - c* = cut region
//	- s* = subimage region
//	- d* = destination

class SliceTools {
	@:external public static inline function drawHorizontal3SliceImage(
		g: Graphics, image: Image,
		cx: FastFloat, cw: FastFloat,
		dx: FastFloat, dy: FastFloat, dw: FastFloat
	) {
		drawHorizontal3SliceSubImage(g, image, 0, 0, image.width, image.height, cx, cw, dx, dy, dw);
	}

	@:external public static inline function drawVertical3SliceImage(
		g: Graphics, image: Image,
		cy: FastFloat, ch: FastFloat,
		dx: FastFloat, dy: FastFloat, dh: FastFloat
	) {
		drawVertical3SliceSubImage(g, image, 0, 0, image.width, image.height, cy, ch, dx, dy, dh);
	}

	@:external public static function draw9SliceImage(
		g: Graphics, image: Image,
		cx: FastFloat, cy: FastFloat, cw: FastFloat, ch: FastFloat,
		dx: FastFloat, dy: FastFloat, dw: FastFloat, dh: FastFloat
	) {
		draw9SliceSubImage(g, image, 0, 0, image.width, image.height, cx, cy, cw, ch, dx, dy, dw, dh);
	}

	@:external public static inline function drawHorizontal3SliceSubImage(
		g: Graphics, image: Image,
		sx: FastFloat, sy: FastFloat, sw: FastFloat, sh: FastFloat,
		cx: FastFloat, cw: FastFloat,
		dx: FastFloat, dy: FastFloat, dw: FastFloat
	) {
		draw9SliceSubImage(g, image, sx, sy, sw, sh, cx, 0, cw, sh, dx, dy, dw, sh);
	}

	@:external public static inline function drawVertical3SliceSubImage(
		g: Graphics, image: Image,
		sx: FastFloat, sy: FastFloat, sw: FastFloat, sh: FastFloat,
		cy: FastFloat, ch: FastFloat,
		dx: FastFloat, dy: FastFloat, dh: FastFloat
	) {
		draw9SliceSubImage(g, image, sx, sy, sw, sh, 0, cy, sw, ch, dx, dy, sw, dh);
	}

	public static function draw9SliceSubImage(
		g: Graphics, image: Image,
		sx: FastFloat, sy: FastFloat, sw: FastFloat, sh: FastFloat,
		cx: FastFloat, cy: FastFloat, cw: FastFloat, ch: FastFloat,
		dx: FastFloat, dy: FastFloat, dw: FastFloat, dh: FastFloat
	) {
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

		g.drawScaledSubImage(image, sx,		sy,		cx,		cy,		dx,		dy,		cx,		cy);
		g.drawScaledSubImage(image, msx,	sy,		cw, 	cy,		mrx,	dy,		mrw,	cy);
		g.drawScaledSubImage(image, rsx, 	sy,		rw,		cy,		rrx,	dy,		rw,		cy);
		g.drawScaledSubImage(image, sx,		msy,	cx,		ch, 	dx,		mry, 	cx,		mrh);
		g.drawScaledSubImage(image, msx,	msy,	cw, 	ch, 	mrx,	mry,	mrw,	mrh);
		g.drawScaledSubImage(image, rsx, 	msy,	rw,		ch, 	rrx,	mry, 	rw,		mrh);
		g.drawScaledSubImage(image, sx,		bsy,	cx,		bh, 	dx,		bry,	cx,		bh);
		g.drawScaledSubImage(image, msx,	bsy,	cw,		bh, 	mrx,	bry,	mrw,	bh);
		g.drawScaledSubImage(image, rsx,	bsy,	rw,		bh, 	rrx,	bry,	rw,		bh);
	}

// #if kex_textureatlas_extension
	@:external public static inline function draw9SliceSubTexture(
		g: Graphics, t: SubTexture,
		cx: FastFloat, cy: FastFloat, cw: FastFloat, ch: FastFloat,
		dx: FastFloat, dy: FastFloat, dw: FastFloat, dh: FastFloat
	) {
		draw9SliceSubImage(g, t.image, t.sx, t.sy, t.sw, t.sh, cx, cy, cw, ch, dx, dy, dw, dh);
	}

	@:external public static inline function drawHorizontal3SliceSubTexture(
		g: Graphics, t: SubTexture,
		cx: FastFloat, cw: FastFloat,
		dx: FastFloat, dy: FastFloat, dw: FastFloat
	) {
		drawHorizontal3SliceSubImage(g, t.image, t.sx, t.sy, t.sw, t.sh, cx, cw, dx, dy, dw);
	}

	@:external public static inline function drawVertical3SliceSubTexture(
		g: Graphics, t: SubTexture,
		cy: FastFloat, ch: FastFloat,
		dx: FastFloat, dy: FastFloat, dh: FastFloa
	) {
		drawVertical3SliceSubImage(g, t.image, t.sx, t.sy, t.sw, t.sh, cy, ch, dx, dy, dh);
	}
// #end
}
