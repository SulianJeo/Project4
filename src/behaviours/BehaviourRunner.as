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
		
		public function addBehaviour(name:String, behaviour:Behaviour) {
			behaviour.setTarget(target);
			behaviourMap[name] = behaviour;
		}
		
		public function removeBehaviour(name:String) {
			delete behaviourMap[name];
		}
		
		public function update() {
			for each(var value:Behaviour in behaviourMap) {
				value.update();
			}
		}

}