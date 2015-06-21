package 
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class MenuState extends FlxState
	{
		// Import background
		[Embed(source = "../assets/menubackground/Fire_Emblem_icon.png")]
		private var FE:Class;
		// Background variable
		private var background:FlxSprite;
		// Button variable
		private var startButton:FlxButton;
		// Title text variable
		private var title:FlxText;
		// Instruction text variable
		private var startInstruction:FlxText;
		
		public function MenuState() 
		{
			
		}
		
		override public function create():void
		{
			// Display mouse
			FlxG.mouse.show();
			// Spawn background
			background = new FlxSprite(100, -30, FE);
			add(background);
			// Spawn start button
			// startButton = new FlxButton(0, 0, "Start Game", startGame);
			// startButton.x = FlxG.width / 2 - startButton.width / 2;
			// startButton.y = FlxG.height / 4 - startButton.height / 2;
			// add(startButton);
			// Spawn game title
			title = new FlxText(0, 0, 256, "Game Title");
			title.setFormat(null, 20, 0xFFFFFF, "center");
			title.x = FlxG.width / 2 - title.width / 2;
			title.y = FlxG.height / 2 - title.height / 2;
			add(title);
			// Spawn game start instructions
			startInstruction = new FlxText(0, 0, 256, "Press [ SPACE ] to play");
			startInstruction.setFormat(null, 8, 0xFFFFFF, "center");
			startInstruction.x = FlxG.width / 2 - startInstruction.width / 2;
			startInstruction.y = FlxG.height * 3 / 4;
			add(startInstruction);
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
			if (FlxG.keys.justPressed("SPACE")) {
					startGame();
			}
			super.update();
		}
		
	}

}