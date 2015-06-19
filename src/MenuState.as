package 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class MenuState extends FlxState
	{
		private var startButton:FlxButton;
		
		public function MenuState() 
		{
			
		}
		
		override public function create():void
		{
			FlxG.mouse.show();
			startButton = new FlxButton(0, 0, "Start Game", startGame);
			startButton.x = FlxG.width / 2 - startButton.width / 2;
			startButton.y = FlxG.height / 2 - startButton.height / 2;
			add(startButton);
		}
		
		private function startGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new PlayState);
		}
		
	}

}