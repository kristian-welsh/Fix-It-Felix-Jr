package com.game {
	import com.building.FakeBuilding;
	import com.enemies.FakeRalph;
	import com.felix.FakeFelix;
	import lib.kris.test.SuiteProvidingTestCase;
	import lib.kris.test.SuiteProvider;

	public class GameTest extends SuiteProvidingTestCase {
		private var game:Game;

		public function GameTest(testMethod:String = null):void {
			super([
				it_should_construct_properly,
				it_should_do_other_stuff], testMethod);
		}

		override protected function setUp():void {
			game = new Game(new FakeBuilding(), new FakeFelix(), new FakeRalph())
		}

		public function it_should_construct_properly():void {
			new Game(new FakeBuilding(), new FakeFelix(), new FakeRalph())
		}

		public function it_should_do_other_stuff():void {
			//game.spawnBricks(
		}
	}
}