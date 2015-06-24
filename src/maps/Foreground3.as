package maps 
{
	import org.flixel.FlxTilemap;
	
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class Foreground3 extends FlxTilemap 
	{
		
		[Embed(source = "../../assets/maps/cursedwoods/Layer3.txt", mimeType = "application/octet-stream")] 
		internal var layer3:Class;
		[Embed(source = "../../assets/maps/cursedwoods/CursedWoodsSheet.png")]
		internal var cursedWoodsSprite:Class;
		
		public function Foreground3() 
		{
			super();
			loadMap(new layer3, cursedWoodsSprite, 16, 16, OFF, 1);
			
		}
		
	}

}