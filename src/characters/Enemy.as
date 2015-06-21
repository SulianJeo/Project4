package characters 
{
	import behaviours.Behaviour;
	import behaviours.BehaviourRunner;
	import behaviours.BreadCrumbs;
	import behaviours.BrownianWalk;
	import flash.geom.Point;
	import mx.core.FlexSprite;
	import org.flixel.FlxSprite;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Julian Seo
	 */
	public class Enemy extends FlxSprite 
	{
		// Import graphic
		[Embed(source = "../../assets/characters/Myrmidon.png")]
		internal var enemySprite:Class;
		// Speed variable and distance varaibles
		private var walkingSpeed:Number = 48;
		private var tauntDistance:Number = 80;
		private var stopDistance:Number = 256;
		// Target variable (used to save passed variable).
		private var target:FlxSprite;
		// Taunted variable (determines whether to chase or not)
		private var taunted:Boolean = false;
		private var behave:BehaviourRunner;
		
		public function Enemy(target:FlxSprite, map:FlxTilemap)
		{
			// Graphic and animations
			loadGraphic(enemySprite, true, false, 32, 32);
			addAnimation("idle", [0, 1, 2, 3, 2, 1], 4, true);
			addAnimation("walkleft", [8, 9, 10, 11, 10, 9], 8, true);
			addAnimation("walkright", [12, 13, 14, 15, 14, 13], 8, true);
			addAnimation("walkdown", [16, 17, 18, 19, 18, 17], 8, true);
			addAnimation("walkup", [20, 21, 22, 23, 22, 21], 8, true);
			addAnimation("walkdownleft", [24, 25, 26, 27, 26, 25], 8, true);
			addAnimation("walkdownright", [28, 29, 30, 31, 30, 29], 8, true);
			addAnimation("walkupleft", [32, 33, 34, 35, 34, 33], 8, true);
			addAnimation("walkupright", [36, 37, 38, 39, 38, 37], 8, true);
			// Set hitbox
			width = 16;
			height = 16;
			offset.x = 8;
			offset.y = 15;
			// set target property equivalent to passed variable
			this.target = target;
			
			// add brownian walk and breakdumbs AI but only activate BW in the beginning
			behave = new BehaviourRunner(this);
			behave.addBehaviour("bw", new BrownianWalk(20, 20, 2));
			behave.addBehaviour("bc", new BreadCrumbs(target, map));
			behave.activate("bw");
		}
		// Enemy AI
		private function lookOut(target:FlxSprite):void
		{
			if (Math.sqrt(Math.pow(target.x - x, 2) + (Math.pow(target.y - y, 2))) < tauntDistance)
			{
				// change behaviours
				behave.deactivate("bw");
				behave.activate("bc");
			}
			if (Math.sqrt(Math.pow(target.x - x, 2) + (Math.pow(target.y - y, 2))) > stopDistance)
			{
				taunted = false;
			}
		}
		// Normalize diagonal movement to walking speed.
		public function normalizeVelocity():void
		{
			var p:Point = new Point();
			velocity.copyToFlash(p);
			p.normalize(walkingSpeed);
			velocity.copyFromFlash(p);
		}
		// Play enemy animations
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
		
		override public function update():void 
		{
			// Run all functions
			lookOut(target);
			//run behavrous
			behave.update();
			normalizeVelocity();
			processAnimation();
			
			// Update
			super.update();
		}
		
	}

}