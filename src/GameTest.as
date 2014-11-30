package {
	import building.FakeBuilding;
	import enemies.FakeRalph;
	import felix.FakeFelix;
	import kris.test.SuiteProvider;

	public class GameTest extends SuiteProvidingTestCase {
		private var game:Game;

		public function GameTest(testMethod:String = null):void {
			super([it_should_construct_properly], testMethod);
		}

		override protected function setUp():void {
			game = new Game(new FakeBuilding(), new FakeFelix(), new FakeRalph())
		}

		public function it_should_construct_properly():void {
			new Game(new FakeBuilding(), new FakeFelix(), new FakeRalph())
		}

		public function it_should_do_other_stuff():void {

		}
	}
}