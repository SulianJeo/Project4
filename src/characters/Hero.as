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
		
		// HP variable
		public var hitPoints:Number = 100;
		
		// Walking angle variables
		private var direction:String = "idle";
		private var PI_6:Number = Math.PI / 6;
		private var PI_3:Number = Math.PI / 3;
		
		// Combat variables
		private var attackHeight:Number = 24;
		private var attackWidth:Number = 24;
		private var attackDamage:Number = 10;
		private var time:Number = 0;
		private var attackCooldown:Number = 1;
		private var attacking:Boolean = false;
		public var target:Enemy;
		public var hitBox:FlxObject;
		public var attackBox:FlxObject;
		
		public function Hero(target:Enemy) 
		{
			// Graphic and animations
			loadGraphic(chromSprite, true, false, 32, 32);
			addAnimation("idle", [0, 1, 2, 3, 2, 1], 4, true);
			addAnimation("attack", [4, 5, 6, 7, 6, 5, 4], 8, false);
			addAnimation("walkleft", [8, 9, 10, 11, 10, 9], 8, true);
			addAnimation("walkright", [12, 13, 14, 15, 14, 13], 8, true);
			addAnimation("walkdown", [16, 17, 18, 19, 18, 17], 8, true);
			addAnimation("walkup", [20, 21, 22, 23, 22, 21], 8, true);
			addAnimation("walkdownright", [24, 25, 26, 27, 26, 25], 8, true);
			addAnimation("walkdownleft", [28, 29, 30, 31, 30, 29], 8, true);
			addAnimation("walkupright", [32, 33, 34, 35, 34, 33], 8, true);
			addAnimation("walkupleft", [36, 37, 38, 39, 38, 37], 8, true);
			// Set hitbox
			//hitBox = new FlxRect(9, 15, 14, 14);
			width = 14;
			height = 14;
			offset.x = 9;
			offset.y = 15;
			attackBox = new FlxObject(4, 4, attackWidth, attackHeight);
			// Set target
			this.target = target;
		}
		
		// Attack function
		private function attack():void
		{
			if (direction == "left")
			{
				attackBox.x = attackBox.x - attackBox.width / 2;
				if (FlxG.overlap(attackBox, target))
				{
					target.hitPoints = target.hitPoints - attackDamage;
					attackBox.x = attackBox.x + attackBox.width / 2;
				}
			}
			if (direction == "right")
			{
				attackBox.x = attackBox.x + attackBox.width / 2;
				if (FlxG.overlap(attackBox, target))
				{
					target.hitPoints = target.hitPoints - attackDamage;
					attackBox.x = attackBox.x - attackBox.width / 2;
				}
			}
			if (direction == "up")
			{
				attackBox.y = attackBox.y - attackBox.height / 2;
				if (FlxG.overlap(attackBox, target))
				{
					target.hitPoints = target.hitPoints - attackDamage;
					attackBox.y = attackBox.y + attackBox.height / 2;
				}
			}
			if (direction == "down" || direction == "idle")
			{
				attackBox.y = attackBox.y + attackBox.height / 2;
				if (FlxG.overlap(attackBox, target))
				{
					target.hitPoints = target.hitPoints - attackDamage;
					attackBox.y = attackBox.y - attackBox.height / 2;
				}
			}
		}
		
		// Player controls
		private function processControl():void
		{
			// Movement
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
			// Attacks
			if (FlxG.keys.SPACE)
			{
				if (time >= attackCooldown)
				{
				attack();
				time = 0;
				}
			}
		}
		
		private function faceDirection():void
		{
			// Determine travel angle
			var walking_angle:Number = Math.atan2(-velocity.y, velocity.x)
			
			// Match animations to angles
			if (walking_angle <= PI_6 && walking_angle >= -PI_6)
			{
				direction = "right";
			}
			if ((walking_angle >= 5 * PI_6 && walking_angle <= Math.PI) || (walking_angle <= -5 * PI_6 && walking_angle >= -Math.PI))
			{
				direction = "left";
			}
			if (walking_angle <= -PI_3 && walking_angle >= -2 * PI_3)
			{
				direction = "down";
			}
			if (walking_angle <= 2 * PI_3 && walking_angle >= PI_3)
			{
				direction = "up";
			}
			if (walking_angle > -PI_3 && walking_angle < -PI_6)
			{
				direction = "downright";
			}
			if (walking_angle > -5 * PI_6 && walking_angle < -2 * PI_3)
			{
				direction = "downleft";
			}
			if (walking_angle > PI_6 && walking_angle < PI_3)
			{
				direction = "upright";
			}
			if (walking_angle > 2 * PI_3 && walking_angle < 5 * PI_6)
			{
				direction = "upleft";
			}
			if (velocity.x == 0 && velocity.y == 0)
			{
				direction = "idle";
			}
		}
		
		// Play hero animations
		private function processAnimation():void
		{
			// Match animations to direction
			if (direction == "right")
			{
				play("walkright");
			}
			if (direction == "left")
			{
				play("walkleft");
			}
			if (direction == "down")
			{
				play("walkdown");
			}
			if (direction == "up")
			{
				play("walkup");
			}
			if (direction == "downright")
			{
				play("walkdownright");
			}
			if (direction == "downleft")
			{
				play("walkdownleft");
			}
			if (direction == "upright")
			{
				play("walkupright");
			}
			if (direction == "upleft")
			{
				play("walkupleft");
			}
			if (direction == "idle")
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
			// Reset velocity every frame
			velocity.x = 0
			velocity.y = 0
			// Run all functions
			processControl();
			normalizeVelocity();
			faceDirection();
			processAnimation();
			// Timer
			time = time + FlxG.elapsed;
			// Update
			super.update();
		}
		
	}

}