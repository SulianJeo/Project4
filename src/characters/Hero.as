package characters 
{
	import flash.geom.Point;
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
		private var walkingSpeed:Number = 96;
		
		public function Hero() 
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
			height = 16;
			offset.x = 8;
			offset.y = 15;
		}
		// Player controls
		private function processControl():void
		{
			if (FlxG.keys.UP || FlxG.keys.W)
			{
				velocity.y = -walkingSpeed;
			}
			if (FlxG.keys.DOWN || FlxG.keys.S)
			{
				velocity.y = walkingSpeed;
			}
			if (FlxG.keys.LEFT || FlxG.keys.A)
			{
				velocity.x = -walkingSpeed;
			}
			if (FlxG.keys.RIGHT || FlxG.keys.D)
			{
				velocity.x = walkingSpeed;
			}
		}
		// Play hero animations
		private function processAnimation():void
		{
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
		}
		// Normalize diagonal movement to walking speed.
		private function normalizeVelocity():void
		{
			var p:Point = new Point();
			velocity.copyToFlash(p);
			p.normalize(walkingSpeed);
			velocity.copyFromFlash(p);
		}
		
		override public function update():void
		{
			// Eeset velocity every frame
			velocity.x = 0
			velocity.y = 0
			// Run all functions
			processControl();
			normalizeVelocity();
			processAnimation();
			// Update
			super.update();
		}
		
	}

}