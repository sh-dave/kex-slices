package kex.internal;

using haxe.io.Path;
using StringTools;

class FilenameTools {
	public static function sanitizeAssetPath( path: String )
		return path
			.replace('-', '_')
			.replace(' ', '_')
			.replace('+', '_')
			.replace('.', '_')
			.replace('/', '_')
			.replace(',', '_')
			.replace('\\', '_')
			.replace(';', '_');

	public static function sanitizeImagePath( path: String )
		return sanitizeAssetFilename(Path.withoutExtension(path));
}
