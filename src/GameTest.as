package  {
	import asunit.framework.TestCase;
	import building.FakeBuilding;

	public class GameTest extends TestCase {
		public function GameTest(testMethod:String = null):void {
			super(testMethod);
		}

		public function it_should_construct_properly():void {
			new Game(new FakeBuilding())
		}
	}
}