package maps 
{
	import org.flixel.FlxTilemap;
	
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class Foreground4 extends FlxTilemap 
	{
		
		[Embed(source = "../../assets/maps/cursedwoods/Layer4.txt", mimeType = "application/octet-stream")] 
		internal var layer4:Class;
		[Embed(source = "../../assets/maps/cursedwoods/CursedWoodsSheet.png")]
		internal var cursedWoodsSprite:Class;
		
		public function Foreground4() 
		{
			super();
			loadMap(new layer4, cursedWoodsSprite, 16, 16, OFF, 1);
			
		}
		
	}

}