package behaviours 
{
	import characters.Enemy;
	import characters.Hero;
	import org.flixel.FlxG;
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
			if (Math.round(newx) != Math.round(target.x) ||
				Math.round(newy) != Math.round(target.y)) 
			{
				target.velocity.x = newx - target.x;
				target.velocity.y = newy - target.y;
				Enemy(target).normalizeVelocity();
			}
		}
		
		private function walk():void 
		{
			newx = target.x + Math.random() * distance * 2 - distance;
			newy = target.y + Math.random() * distance * 2 - distance;
		}
		
	}

}