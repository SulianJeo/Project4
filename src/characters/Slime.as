package characters 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Slime extends FlxSprite 
	{
		[Embed(source = "../../assets/characters/slime.png")]
		internal var slimeSprite:Class;
		
		public function Slime() 
		{
			loadGraphic(slimeSprite, true, false, 48, 48);
			addAnimation("idle", [0, 1, 2, 1], 8);
			addAnimation("moving", [3, 4, 5, 4], 8);
			
			play("idle");
		}
		
	}

}