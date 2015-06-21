package behaviours 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author qwerber
	 */
	public class BehaviourRunner 
	{
		private var behaviourMap:Object;
		private var target:FlxSprite;
		
		public function BehaviourRunner(target:FlxSprite) 
		{
			this.target = target;
			behaviourMap = new Object();
		}
		
		public function addBehaviour(name:String, behaviour:Behaviour):void {
			behaviour.setTarget(target);
			behaviourMap[name] = behaviour;
		}
		
		public function activate(name:String):void {
			behaviourMap[name].active = true;
		}
		
		public function deactivate(name:String):void {
			behaviourMap[name].active = false;
		}
		
		public function removeBehaviour(name:String):void {
			delete behaviourMap[name];
		}
		
		public function update():void {
			for each(var value:Behaviour in behaviourMap) {
				if(value.active){
					value.update();
				}
			}
		}
	}
}