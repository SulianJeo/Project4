package behaviours 
{
	import flash.geom.Point;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author qwerber
	 */
	public class BreadCrumbs extends Behaviour 
	{
		private var chaseAfter:FlxSprite;
		private var waypointTimer:Number = 0.02;
		private var time:Number = 0;
		private var waypoints:Vector.<FlxPoint>;
		private var map:FlxTilemap;
		private var wallTimer:Number = 0.5;
		private var vx:Number = 0;
		private var vy:Number = 0;
		public function BreadCrumbs(chaseAfter:FlxSprite, map:FlxTilemap) 
		{
			super();
			
			this.chaseAfter = chaseAfter;
			this.map = map;
			waypoints = new Vector.<FlxPoint>();
		}
		
		private function dist2(p1:FlxPoint, p2:FlxPoint):Number {
			var dx:Number = p1.x - p2.x;
			var dy:Number = p1.y - p2.y;
			return dx * dx + dy * dy;
		}
		
		override public function update():void 
		{
			
			// update way points
			
			
			var t1:FlxPoint = new FlxPoint(target.x, target.y);
			var t2:FlxPoint = new FlxPoint(t1.x + target.width, t1.y);
			var t3:FlxPoint = new FlxPoint(t1.x + target.width, t1.y + target.height);
			var t4:FlxPoint = new FlxPoint(t1.x, t1.y + target.height);
			
			var c1:FlxPoint = new FlxPoint(chaseAfter.x, chaseAfter.y);
			var c2:FlxPoint = new FlxPoint(c1.x + chaseAfter.width, c1.y);
			var c3:FlxPoint = new FlxPoint(c1.x + chaseAfter.width, c1.y + chaseAfter.height);
			var c4:FlxPoint = new FlxPoint(c1.x, c1.y + chaseAfter.height);
			
			time += FlxG.elapsed;
			if (time > waypointTimer) {
				waypoints.push(new FlxPoint(c1.x, c1.y));
				time = 0;
			}
			
			// move
			if (map.ray(t1, c1, null, 1) &&
				map.ray(t2, c2, null, 1) &&
				map.ray(t3, c3, null, 1) &&
				map.ray(t4, c4, null, 1))
			{
				target.velocity.x = c1.x - t1.x;
				target.velocity.y = c1.y - t1.y;
				trace("can see");
				/*while (waypoints.length > 30) {
				waypoints.shift();	
				}*/
				waypoints.length = 0;
			}
			else if (waypoints.length != 0) {
				var targetPoint:FlxPoint = waypoints[0];
				if (dist2(new FlxPoint(target.x,target.y), targetPoint) > 100)
				{
					target.velocity.x = targetPoint.x - (t1.x);
					target.velocity.y = targetPoint.y - (t1.y);
					if (Math.random() < 0.003) {
						trace("jitter");
						//jitter to knock out of bad solutions, unless want to apply higher chase resoution
						//waypoints.shift();
						//waypoints.unshift(new FlxPoint(target.x + Math.random() * 100 - 50, target.y + Math.random() * 100 - 50));
					}
				}else {
					waypoints.shift();
				}
			}
			//avoid walls
			if (target.isTouching(FlxObject.DOWN))
			{
				target.velocity.x *= 30;
			}
			if (target.isTouching(FlxObject.LEFT))
			{
				target.velocity.y *= 30;
			}				
			if (target.isTouching(FlxObject.UP))
			{
				target.velocity.x *= 30;
			}
			if (target.isTouching(FlxObject.RIGHT))
			{
				target.velocity.y *= 30;
			}
			
			
		}
		
	}

}