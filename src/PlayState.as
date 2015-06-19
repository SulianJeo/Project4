package 
{
	import characters.Hero;
	import org.flixel.*;
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class PlayState extends FlxState
	{
		private var heroSprite:Hero;
		
		private var heroSpawnX:Number;
		private var heroSpawnY:Number;
		
		public function PlayState() 
		{
			super();
		}
		
		override public function create():void 
		{
			// Spawn hero
			heroSprite = new Hero;
			heroSpawnX = FlxG.width / 2 - heroSprite.width / 2;
			heroSpawnY = FlxG.height/2 - heroSprite.height / 2;
			heroSprite.x = heroSpawnX;
			heroSprite.y = heroSpawnY;
			add(heroSprite);
			// 
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}