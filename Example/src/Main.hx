package;

using kha.graphics2.NinesliceTools;

class Main {
	public static function main()
		kha.System.init(
			{ width : 1024, height : 320 },
			kha.Assets.loadEverything.bind(kha.System.notifyOnRender.bind(render))
		);

#if kha_textureatlas_extension
	static var quadsAtlas : QuadsAtlas;
#end

	static function render( fb : kha.Framebuffer ) {
		var g2 = fb.g2;

#if kha_textureatlas_extension
		if (quadsAtlas == null) quadsAtlas = new QuadsAtlas();
#end		
		g2.begin();
			g2.drawImage(kha.Assets.images.quads, 8, 8); // original image
			g2.drawScaledImage(kha.Assets.images.quads, 16, 48, 96, 96); // scaled to see how shit it looks

			g2.draw9SliceImage(kha.Assets.images.quads, 16, 3, 16, 10, 256 + 160, 48, 128, 128);
			g2.drawHorizontal3SliceImage(kha.Assets.images.quads, 16, 16, 256 + 160, 48 + 128 + 16, 128);
			g2.drawVertical3SliceImage(kha.Assets.images.quads, 3, 10, 256 + 160 + 16 + 128, 48, 128);

			g2.draw9SliceSubImage(kha.Assets.images.quads, 0, 0, 48, 16, 16, 3, 16, 10, 160, 48, 128, 128);
			g2.drawHorizontal3SliceSubImage(kha.Assets.images.quads, 0, 0, 48, 16, 16, 16, 160, 48 + 128 + 16, 128);
			g2.drawVertical3SliceSubImage(kha.Assets.images.quads, 0, 0, 48, 16, 3, 10, 160 + 16 + 128, 48, 128);

#if kha_textureatlas_extension
			g2.draw9SliceSubTexture(quadsAtlas.quads, 16, 3, 16, 10, 512 + 160, 48, 128, 128);
			g2.drawHorizontal3SliceSubTexture(quadsAtlas.quads, 16, 16, 512 + 160, 48 + 128 + 16, 128);
			g2.drawVertical3SliceSubTexture(quadsAtlas.quads, 3, 10, 512 + 160 + 16 + 128, 48, 128);
#end
		g2.end();
	}
}

#if kha_textureatlas_extension
@:build(kha.internal.TPJsonArrayBuilder.build('quads-jsonarray.json', 'quads_jsonarray'))
private class QuadsAtlas {}
#end
