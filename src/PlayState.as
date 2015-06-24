package 
{
	import characters.Coin;
	import characters.Enemy;
	import characters.Hero;
	import characters.Slime;
	import flash.display.Sprite;
	import maps.Background;
	import maps.Foreground1;
	import maps.Foreground2;
	import maps.Foreground3;
	import maps.Foreground4;
	import org.flixel.*;
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class PlayState extends FlxState
	{
		// Map variable
		private var layer0:Background;
		private var layer1:Foreground1;
		private var layer2:Foreground2;
		private var layer3:Foreground3;
		private var layer4:Foreground4;
		
		// Character variables
		private var depthsortedgroup:FlxGroup;
		private var coinGroup:FlxGroup;
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
			layer0 = new Background;
			add(layer0);
			// Spawn hero
			heroSprite = new Hero(enemySprite);
			heroSprite.x = 96;
			heroSprite.y = 96;
			//aadd(heroSprite);
			enemySprite = new Enemy(heroSprite, layer0);
			enemySprite.x = 240;
			enemySprite.y = 240;
			//add(enemySprite);
			// Set target
			heroSprite.target = enemySprite;
			//depth sorting
			depthsortedgroup = new FlxGroup();
			depthsortedgroup.add(enemySprite);
			depthsortedgroup.add(heroSprite);
			add(depthsortedgroup);
			//coins
			coinGroup = new FlxGroup();
			add(coinGroup);
			var c:Coin = Coin(coinGroup.add(new Coin()));
			c.x = c.y = 200;
			// Spawn foreground
			layer1 = new Foreground1;
			add(layer1);
			layer2 = new Foreground2;
			add(layer2);
			layer3 = new Foreground3;
			add(layer3);
			layer4 = new Foreground4;
			add(layer4);
			// Spawn slime
			var s:Slime = new Slime(heroSprite);
			s.x = heroSprite.x;
			s.y = heroSprite.y;
			//add(s);
			// Fix camera
			FlxG.camera.setBounds(0, 0, layer0.width, layer0.height);
			FlxG.camera.follow(heroSprite, 2);
			FlxG.camera.deadzone = new FlxRect(FlxG.width * 3 / 8, FlxG.height * 3 / 8, FlxG.width / 4, FlxG.height / 4);
			layer0.follow();
		}
		
		override public function update():void
		{
			FlxG.collide(layer0, depthsortedgroup);
			FlxG.overlap(heroSprite, coinGroup, collect);
			depthsortedgroup.sort();
			super.update();
		}
		
		private function collect(o1:FlxObject, o2:FlxObject):void 
		{
			o2.kill();
		}
		
	}

}