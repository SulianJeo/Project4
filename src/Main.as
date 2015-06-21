package
{
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * Project 4: First Flixel Game
	 * @author Julian Seo
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{
		// Declare game
		private var game:FirstGame;

		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// Initialize game
			game = new FirstGame;
			// Spawn game
			addChild(game);
		}

	}

}