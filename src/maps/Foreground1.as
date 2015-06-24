package maps 
{
	import org.flixel.FlxTilemap;
	
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class Foreground1 extends FlxTilemap 
	{
		[Embed(source = "../../assets/maps/cursedwoods/Layer1.txt", mimeType = "application/octet-stream")] 
		internal var layer1:Class;
		[Embed(source = "../../assets/maps/cursedwoods/CursedWoodsSheet.png")]
		internal var cursedWoodsSprite:Class;
		
		public function Foreground1() 
		{
			super();
			loadMap(new layer1, cursedWoodsSprite, 16, 16, OFF, 1);
			
		}
		
	}

}