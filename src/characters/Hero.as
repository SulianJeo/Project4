package characters 
{
	import org.flixel.*;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class Hero extends FlxSprite 
	{
		//Import graphic
		[Embed(source = "../../assets/characters/Chrom.png")]
		internal var chromSprite:Class;
		// Speed variables
		private var walkingSpeed:Number = 100;
		
		public function Hero(X:Number=0, Y:Number=0) 
		{
			// Graphic and animations
			loadGraphic(chromSprite, true, false, 32, 32);
			addAnimation("idle", [0, 1, 2, 3, 2, 1], 4, true);
			addAnimation("walkleft", [8, 9, 10, 11, 10, 9], 8, true);
			addAnimation("walkright", [12, 13, 14, 15, 14, 13], 8, true);
			addAnimation("walkdown", [16, 17, 18, 19, 18, 17], 8, true);
			addAnimation("walkup", [20, 21, 22, 23, 22, 21], 8, true);
			addAnimation("walkdownright", [24, 25, 26, 27, 26, 25], 8, true);
			addAnimation("walkdownleft", [28, 29, 30, 31, 30, 29], 8, true);
			addAnimation("walkupright", [32, 33, 34, 35, 34, 33], 8, true);
			addAnimation("walkupleft", [36, 37, 38, 39, 38, 37], 8, true);
			// Set hitbox
			width = 16;
			height = 24
			offset.x = 8;
			offset.y = 4;
		}
		
		override public function update():void
		{
			//reset velocity every frame
			velocity.x = 0
			velocity.y = 0
			// Hero movement
			if (FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("W"))
			{
				velocity.y = velocity.y - walkingSpeed;
			}
			if (FlxG.keys.justPressed("DOWN") || FlxG.keys.justPressed("S"))
			{
				velocity.y = velocity.y + walkingSpeed;
			}
			if (FlxG.keys.justPressed("LEFT") || FlxG.keys.justPressed("A"))
			{
				velocity.x = velocity.x - walkingSpeed;
			}
			if (FlxG.keys.justPressed("RIGHT") || FlxG.keys.justPressed("D"))
			{
				velocity.x = velocity.x + walkingSpeed;
			}
			if (FlxG.keys.UP || FlxG.keys.W)
			{
				velocity.y = velocity.y - walkingSpeed;
			}
			if (FlxG.keys.DOWN || FlxG.keys.S)
			{
				velocity.y = velocity.y + walkingSpeed;
			}
			if (FlxG.keys.LEFT || FlxG.keys.A)
			{
				velocity.x = velocity.x - walkingSpeed;
			}
			if (FlxG.keys.RIGHT || FlxG.keys.D)
			{
				velocity.x = velocity.x + walkingSpeed;
			}
			// Hero Animations
			if (velocity.x > 0 && velocity.y == 0)
			{
				play("walkright");
			}
			if (velocity.x < 0 && velocity.y == 0)
			{
				play("walkleft");
			}
			if (velocity.x == 0 && velocity.y > 0)
			{
				play("walkdown");
			}
			if (velocity.x == 0 && velocity.y < 0)
			{
				play("walkup");
			}
			if (velocity.x > 0 && velocity.y > 0)
			{
				play("walkdownright");
			}
			if (velocity.x < 0 && velocity.y > 0)
			{
				play("walkdownleft");
			}
			if (velocity.x > 0 && velocity.y < 0)
			{
				play("walkupright");
			}
			if (velocity.x < 0 && velocity.y < 0)
			{
				play("walkupleft");
			}
			if (velocity.x == 0 && velocity.y == 0)
			{
				play("idle");
			}
			// Update
			super.update();
		}
		
	}

}