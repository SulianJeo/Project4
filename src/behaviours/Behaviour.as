package behaviours 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author qwerber
	 */
	public class Behaviour 
	{
		
		protected var target:FlxSprite;
		public var active:Boolean = false;
		
		public function Behaviour() 
		{
			
		}
		
		public function setTarget(target:FlxSprite):void
		{
			this.target = target;
		}
		
		public function update():void {
			
		}
		
	}

}