package maps 
{
	import org.flixel.FlxTilemap;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class Background extends FlxTilemap 
	{
		// Load map
		[Embed(source = "../../assets/maps/cursedwoods/Layer0.txt", mimeType = "application/octet-stream")] 
		internal var layer0:Class;
		//[Embed(source = "../../assets/maps/cursedwoods/Layer1.txt", mimeType = "application/octet-stream")] 
		//internal var layer1:Class;
		//[Embed(source = "../../assets/maps/cursedwoods/Layer2.txt", mimeType = "application/octet-stream")] 
		//internal var layer2:Class;
		//[Embed(source = "../../assets/maps/cursedwoods/Layer3.txt", mimeType = "application/octet-stream")] 
		//internal var layer3:Class;
		//[Embed(source = "../../assets/maps/cursedwoods/Layer4.txt", mimeType = "application/octet-stream")]
		//internal var layer4:Class;
		
		// Import graphics
		[Embed(source = "../../assets/maps/cursedwoods/CursedWoodsSheet.png")]
		internal var cursedWoodsSprite:Class;
		
		public function Background() 
		{
			// 
			super();
			loadMap(new layer0, cursedWoodsSprite, 16, 16, OFF, 1);
			//loadMap(new layer1, cursedWoodsSprite, 16, 16, OFF, 1);
			//loadMap(new layer2, cursedWoodsSprite, 16, 16, OFF, 1);
			//loadMap(new layer3, cursedWoodsSprite, 16, 16, OFF, 1);
			
			// dark patch in light grass
			setTileProperties(14, 0);
			setTileProperties(1, 0);
			setTileProperties(2, 0);
			setTileProperties(16, 0);
			setTileProperties(17, 0);
			setTileProperties(18, 0);
			setTileProperties(32, 0);
			setTileProperties(33, 0);
			setTileProperties(34, 0);
			
			// light patch in dirt
			setTileProperties(3, 0);
			setTileProperties(4, 0);
			setTileProperties(5, 0);
			setTileProperties(19, 0);
			setTileProperties(20, 0);
			setTileProperties(21, 0);
			setTileProperties(35, 0);
			setTileProperties(36, 0);
			setTileProperties(37, 0);
			
			// dark grass
			setTileProperties(6, 0);
			setTileProperties(7, 0);
			setTileProperties(22, 0);
			setTileProperties(23, 0);
			
			// light grass
			setTileProperties(8, 0);
			setTileProperties(9, 0);
			setTileProperties(24, 0);
			setTileProperties(25, 0);
			
			// dirt
			setTileProperties(10, 0);
			setTileProperties(11, 0);
			setTileProperties(26, 0);
			setTileProperties(27, 0);
			
			// small dark weeds
			setTileProperties(38, 0);
			setTileProperties(39, 0);
			setTileProperties(54, 0);
			setTileProperties(55, 0);
			
			// small light weeds
			setTileProperties(40, 0);
			setTileProperties(41, 0);
			setTileProperties(56, 0);
			setTileProperties(57, 0);
			
			// large light weeds
			setTileProperties(42, 0);
			setTileProperties(43, 0);
			setTileProperties(58, 0);
			setTileProperties(59, 0);
			
			// more weed
			setTileProperties(48, 0);
			setTileProperties(49, 0);
			setTileProperties(50, 0);
			setTileProperties(51, 0);
			
			// stones
			setTileProperties(52, 0);
			setTileProperties(53, 0);
			
			setTileProperties(147, 0);
			setTileProperties(148, 0);
			setTileProperties(149, 0);
			setTileProperties(150, 0);
			
			
			// Background Trees
			// 64,65,66,67,68,69,70,71,72,73
			// 80,81,82,83,84,85,86,87,88,89
			// 96,97,98,99,100,101,102,103,104,105
			// 112,113,114,115,116,117,118,119,120,121
			// 128,129,130,131,132,133,134,135,136,137
			// 145,145,146,147,148,149,150,151,152,152
			
			
			
			
		}
		
	}

}