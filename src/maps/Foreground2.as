package maps 
{
	import org.flixel.FlxTilemap;
	
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class Foreground2 extends FlxTilemap 
	{
		[Embed(source = "../../assets/maps/cursedwoods/Layer2.txt", mimeType = "application/octet-stream")] 
		internal var layer2:Class;
		[Embed(source = "../../assets/maps/cursedwoods/CursedWoodsSheet.png")]
		internal var cursedWoodsSprite:Class;
		
		public function Foreground2() 
		{
			super();
			loadMap(new layer2, cursedWoodsSprite, 16, 16, OFF, 1);
			
		}
		
	}

}