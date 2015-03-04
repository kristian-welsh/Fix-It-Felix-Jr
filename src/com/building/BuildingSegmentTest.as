package com.building {
	import com.building.window.DoubleWindow;
	import com.building.window.factory.DoubleWindowFactoryImp;
	import com.building.window.factory.DoubleWindowFactorySpy;
	import com.building.window.FakeDoubleWindowMovieClip;
	import flash.display.MovieClip;
	import kris.test.SuiteProvidingTestCase;
	
	public class BuildingSegmentTest extends SuiteProvidingTestCase {
		private const REQUIRED_WINDOW_NAMES:Array = ["window_00", "window_01", "window_02", "window_03", "window_04", "window_05",
			"window_06", "window_07", "window_08", "window_09", "window_10", "window_11", "window_12", "window_13", "window_14"];
		
		private var target:MovieClip;
		private var difficulty:uint;
		private var factory:DoubleWindowFactorySpy;
		private var segment:BuildingSegment;
		
		private var shuttered:uint = 0;
		private var broken:uint = 0;
		
		public function BuildingSegmentTest(testMethod:String = null) {
			super([
				constructor_sets_basic_parameters_correctly,
				constructor_builds_window_array_correctly
				], testMethod);
		}
		
		override protected function setUp():void {
			target = createTarget()
			difficulty = 8; // Found i'm using this value in Game.as, so test this first.
			factory = new DoubleWindowFactorySpy()
			segment = new BuildingSegment(target, difficulty, factory)
		}
		
		private function createTarget():MovieClip {
			var target:MovieClip = new MovieClip()
			addNamedWindowsTo(target)
			return target
		}
		
		private function addNamedWindowsTo(view:MovieClip):void {
			for each (var name:String in REQUIRED_WINDOW_NAMES)
				view.addChild(createNamedWindowView(name))
		}
		
		private function createNamedWindowView(name:String):MovieClip {
			var returnMe:FakeDoubleWindowMovieClip = new FakeDoubleWindowMovieClip()
			returnMe.name = name
			return returnMe
		}
		
		public function constructor_sets_basic_parameters_correctly():void {
			assertEquals(target, segment._target)
			assertEquals(8, segment._num_broken)
			assertEquals(2, segment._num_shutters)
		}
		
		public function constructor_builds_window_array_correctly():void {
			assertEquals(15, segment._windows.length)
			assertUsesFactoryToCreateWindow();
			// TODO: Consider outputing fake windows from factory to improve testing.
			for each (var window:DoubleWindow in segment._windows)
				assertWindowCorrect(window);
		}
		
		private function assertUsesFactoryToCreateWindow():void {
			factory.spy.assertLogged(factory.create, [target, null])
		}
		
		private function assertWindowCorrect(window:DoubleWindow):void {
			if (window.leftShutterActive() || window.topShutterActive())
				shuttered++
			if (window.getBroken())
				broken++
			assertTargetFromConstructor(window)
		}
		
		private function assertTargetFromConstructor(window:DoubleWindow):void {
			assertNotNull(target.getChildByName(window.getTarget().name));
		}
	}
}