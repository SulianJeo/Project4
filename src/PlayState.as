package 
{
	import characters.Enemy;
	import characters.Hero;
	import characters.Slime;
	import flash.display.Sprite;
	import maps.Map1;
	import org.flixel.*;
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class PlayState extends FlxState
	{
		// Map variable
		private var mapSprite:Map1;
		// Character variables
		private var heroSprite:Hero;
		private var enemySprite:Enemy;
		// Hero spawn location
		private var heroSpawnX:Number;
		private var heroSpawnY:Number;
		
		public function PlayState() 
		{
			super();
		}
		
		override public function create():void 
		{
			// Spawn map
			mapSprite = new Map1;
			add(mapSprite);
			// Spawn hero
			heroSprite = new Hero;
			heroSpawnX = FlxG.width / 2 - heroSprite.width / 2;
			heroSpawnY = FlxG.height/2 - heroSprite.height / 2;
			heroSprite.x = heroSpawnX;
			heroSprite.y = heroSpawnY;
			add(heroSprite);
			// Spawn enemy
			enemySprite = new Enemy(heroSprite, mapSprite);
			enemySprite.x = 24;
			enemySprite.y = 48;
			add(enemySprite);
			// Spawn slime
			var s:Slime = new Slime(heroSprite);
			s.x = heroSprite.x;
			s.y = heroSprite.y;
			//add(s);
			// Fix camera
			FlxG.camera.setBounds(0, 0, mapSprite.width, mapSprite.height);
			FlxG.camera.follow(heroSprite, 2);
			FlxG.camera.deadzone = new FlxRect(FlxG.width * 3 / 8, FlxG.height * 3 / 8, FlxG.width / 4, FlxG.height / 4);
			mapSprite.follow();
		}
		
		override public function update():void
		{
			FlxG.collide(mapSprite, heroSprite);
			FlxG.collide(mapSprite, enemySprite);
			super.update();
		}
		
	}

}