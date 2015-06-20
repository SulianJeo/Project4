package 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class MenuState extends FlxState
	{
		// Button variable
		private var startButton:FlxButton;
		
		public function MenuState() 
		{
			
		}
		
		override public function create():void
		{
			// Display mouse
			FlxG.mouse.show();
			// Create start button
			startButton = new FlxButton(0, 0, "Start Game", startGame);
			startButton.x = FlxG.width / 2 - startButton.width / 2;
			startButton.y = FlxG.height / 4 - startButton.height / 2;
			add(startButton);
		}
		
		private function startGame():void
		{
			// Hide mouse
			FlxG.mouse.hide();
			// Go to new state
			FlxG.switchState(new PlayState);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("TAB")) {
					startGame();
			}
			super.update();
		}
		
	}

}