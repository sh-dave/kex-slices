package kex;

import kha.FastFloat;
import kha.Image;

@:structInit
class SubTexture {
	public var image: Image;
	public var sx: FastFloat;
	public var sy: FastFloat;
	public var sw: FastFloat;
	public var sh: FastFloat;
	public var fx: FastFloat;
	public var fy: FastFloat;
	public var fw: FastFloat;
	public var fh: FastFloat;
	public var rotated: Bool;
}
