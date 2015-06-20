package characters 
{
	import flash.geom.Point;
	import mx.core.FlexSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Slime extends FlxSprite 
	{
		[Embed(source = "../../assets/characters/slime.png")]
		internal var slimeSprite:Class;
		
		private var jumpTimer:int;
		private var jumpTime:Number;
		private var target:FlxSprite;
		
		public function Slime(target:FlxSprite) 
		{
			loadGraphic(slimeSprite, true, false, 48, 48);
			addAnimation("idle", [0, 1, 2, 1], 4);
			
			this.target = target;
			
			jumpTime = 0;
			jumpTimer = 2;
			
			drag.x = drag.y = 100;
			
			play("idle");
		}
		
		override public function update():void 
		{
			jumpTime += FlxG.elapsed;
			if (jumpTime > jumpTimer) {
				jump();
				jumpTime = 0;
			}
			super.update();
		}
		
		private function normalizeVelocity():void
		{
			var p:Point = new Point();
			velocity.copyToFlash(p);
			p.normalize(100);
			velocity.copyFromFlash(p);
		}
		
		private function jump():void 
		{
			velocity.x = target.x - x;
			velocity.y = target.y - y;
			normalizeVelocity();
		}
		
	}

}