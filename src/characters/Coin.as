package characters 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author qwerber
	 */
	public class Coin extends FlxSprite
	{
		[Embed(source="../../assets/characters/spinning_coin_gold.png")]
		internal var coinSprite:Class;
		
		public function Coin() 
		{
			loadGraphic(coinSprite, true, false, 16, 24);
			addAnimation("spin", [0, 1, 2, 3, 4, 5, 6, 7],12);
			play("spin");
		}
		
		
	}

}