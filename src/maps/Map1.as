package maps 
{
	import org.flixel.FlxTilemap;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class Map1 extends FlxTilemap 
	{
		// Load map
		[Embed(source = "../../assets/maps/cursedwoods/Map1.txt", mimeType = "application/octet-stream")] 
		internal var txtMap:Class;
		// Import graphic
		[Embed(source = "../../assets/maps/cursedwoods/CursedWoodsSheet.png")]
		internal var cursedWoodsSprite:Class;
		
		public function Map1() 
		{
			super();
			loadMap(new txtMap, cursedWoodsSprite, 16, 16);
			setTileProperties(8, 0);
			setTileProperties(7, 0x1111);
		}
		
	}

}