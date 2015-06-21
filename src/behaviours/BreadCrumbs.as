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
			time += FlxG.elapsed;
			if (time > waypointTimer) {
				waypoints.push(new FlxPoint(chaseAfter.x + chaseAfter.width/2, chaseAfter.y+chaseAfter.height/2));
				time = 0;
			}
			
			// move
			
			if (map.ray(new FlxPoint(target.x+target.width/2, target.y+target.height/2),
						new FlxPoint(chaseAfter.x + chaseAfter.width/2, chaseAfter.y+chaseAfter.height/2), null, 2) //&&
						
				/*map.ray(new FlxPoint(target.x + target.width, target.y + target.height),
						new FlxPoint(chaseAfter.x + chaseAfter.width, chaseAfter.y + chaseAfter.height), null, 2) && 
						
				map.ray(new FlxPoint(target.x + target.width, target.y),
						new FlxPoint(chaseAfter.x + chaseAfter.width, chaseAfter.y), null, 2) &&
						
				map.ray(new FlxPoint(target.x, target.y + target.height),
						new FlxPoint(chaseAfter.x, chaseAfter.y + chaseAfter.height),null,2)*/)
			{
				target.velocity.x = chaseAfter.x - target.x;
				target.velocity.y = chaseAfter.y - target.y;
				trace("can see");
				while (waypoints.length > 30) {
				waypoints.shift();	
				}
				//
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
			else if (waypoints.length != 0) {
				var targetPoint:FlxPoint = waypoints[0];
				if (dist2(new FlxPoint(target.x,target.y), targetPoint) > 400)
				{
					target.velocity.x = targetPoint.x - (target.x+target.width/2);
					target.velocity.y = targetPoint.y - (target.y+target.height/2);
					if (Math.random() < 0.003) {
						trace("jitter");
						//jitter to knock out of bad solutions, unless want to apply higher chase resoution
						//waypoints.shift();
						//waypoints.unshift(new FlxPoint(target.x + Math.random() * 100 - 50, target.y + Math.random() * 100 - 50));
					}
					if (target.isTouching(FlxObject.DOWN))
					{
						target.velocity.x *= 3;
					}
					if (target.isTouching(FlxObject.LEFT))
					{
						target.velocity.y *= 3;
					}				
					if (target.isTouching(FlxObject.UP))
					{
						target.velocity.x *= 3;
					}
					if (target.isTouching(FlxObject.RIGHT))
					{
						target.velocity.y *= 3;
					}
				}else {
					waypoints.shift();
				}
			}
			//avoid walls
			
			
			
		}
		
	}

}