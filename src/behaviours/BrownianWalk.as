package behaviours 
{
	import characters.Enemy;
	import characters.Hero;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author qwerber
	 */
	public class BrownianWalk extends Behaviour 
	{
		
		private var distance:Number;
		private var speed:Number;
		private var time:Number = 0;
		private var timer:Number;
		private var newx:Number;
		private var newy:Number;
		
		public function BrownianWalk(distance:Number, speed:Number, timer:Number) 
		{
			this.distance = distance;
			this.speed = speed;
			this.timer = timer;
		}
		
		override public function setTarget(target:FlxSprite):void 
		{
			newx = target.x;
			newy = target.y;
			super.setTarget(target);
		}
		
		override public function update():void
		{
			time += FlxG.elapsed;
			if (time >= timer) {
				walk();
				time = 0;
			}
			if (BreadCrumbs.dist2(new FlxPoint(newx, newy), 
								  new FlxPoint(target.x, target.y)) > 100) 
			{
				target.velocity.x = newx - target.x;
				target.velocity.y = newy - target.y;
				Enemy(target).normalizeVelocity();
			}else {
				target.velocity.x = target.velocity.y = 0;	
			}
		}
		
		private function walk():void 
		{
			newx = target.x + Math.random() * distance * 2 - distance;
			newy = target.y + Math.random() * distance * 2 - distance;
		}
		
	}

}