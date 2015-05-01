package com.building.segment {
	import com.building.window.DoubleWindowImp;
	import com.building.window.factory.DoubleWindowFactorySpy;
	import com.building.window.FakeDoubleWindowMovieClip;
	import com.util.random.int.*;
	import flash.display.MovieClip;
	import kris.test.SuiteProvidingTestCase;
	
	public class BuildingSegmentTest extends SuiteProvidingTestCase {
		private const REQUIRED_WINDOW_NAMES:Array = ["window_0", "window_1", "window_2", "window_3", "window_4", "window_5",
			"window_6", "window_7", "window_8", "window_9", "window_10", "window_11", "window_12", "window_13", "window_14"];
		
		private const INDICES_TO_SMASH:Array = [0, 1, 2, 3, 4, 5, 6, 7]
		private const INDICES_TO_SHUTTER:Array = [0, 1]
		
		private var target:MovieClip;
		private var difficulty:uint;
		private var factory:DoubleWindowFactorySpy;
		private var random:FakeRandomIntGenerator;
		private var segment:BuildingSegment;
		
		private var numShuttered:uint = 0;
		private var broken:uint = 0;
		
		public function BuildingSegmentTest(testMethod:String = null) {
			super([
				constructor_sets_basic_parameters_correctly,
				constructor_builds_window_array_correctly,
				constructor_smashes_the_correct_windows,
				constructor_shutters_the_correct_windows,
				check_segment_cleared_returns_true_when_no_windows_are_broken,
				check_segment_cleared_returns_false_when_first_window_is_broken,
				check_segment_cleared_returns_false_when_last_window_is_broken,
				get_window_at_throws_error_when_given_indecies_over_bounds,
				get_window_at_works_correctly
				], testMethod);
		}
		
		override protected function setUp():void {
			target = createTarget()
			difficulty = 8; // Found i'm using this value in Game.as, so test this first.
			factory = new DoubleWindowFactorySpy()
			random = new FakeRandomIntGenerator()
			setRandomReturnsAndCreateSegment()
		}
		
		private function setRandomReturnsAndCreateSegment(indicesToSmash:Array = null, indiciesToShutter:Array = null):void {
			random.setOutputs(indicesToSmash || INDICES_TO_SMASH, indiciesToShutter || INDICES_TO_SHUTTER)
			segment = new BuildingSegment(target, difficulty, factory, random)
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
			assertWindowTargetsFromConstructor();
			assertWindowsShutteredAndBrokenCorrectly()
		}
		
		private function assertUsesFactoryToCreateWindow():void {
			factory.spy.assertLogged(factory.create, [target, null])
		}
		
		private function assertWindowTargetsFromConstructor():void {
			for each (var window:DoubleWindowImp in segment._windows)
				assertWindowCorrect(window);
		}
		
		private function assertWindowCorrect(window:DoubleWindowImp):void {
			assertTargetFromConstructor(window)
		}
		
		private function assertTargetFromConstructor(window:DoubleWindowImp):void {
			assertNotNull(target.getChildByName(window.getTarget().name));
		}
		
		private function assertWindowsShutteredAndBrokenCorrectly():void {
			countWindowConditions()
			assertEquals(2, numShuttered)
			assertEquals(8, broken)
		}
		
		private function countWindowConditions():void {
			for each (var window:DoubleWindowImp in segment._windows)
				logWindowConditions(window);
		}
		
		private function logWindowConditions(window:DoubleWindowImp):void {
			if (window.leftShutterActive() || window.topShutterActive())
				numShuttered++
			if (window.getBroken())
				broken++
		}
		
		public function constructor_smashes_the_correct_windows():void {
			assertSmashed(INDICES_TO_SMASH);
		}
		
		private function assertSmashed(indices:Array):void {
			for each (var index:uint in indices)
				assertTrue(isSmashed(windowAt(index)));
		}
		
		private function isSmashed(window:DoubleWindowImp):Boolean {
			return window.getBroken();
		}
		
		public function constructor_shutters_the_correct_windows():void {
			assertShuttered(INDICES_TO_SHUTTER);
		}
		
		private function assertShuttered(indices:Array):void {
			for each (var index:uint in indices)
				assertTrue(isShuttered(windowAt(index)));
		}
		
		private function isShuttered(window:DoubleWindowImp):Boolean {
			return window.leftShutterActive() || window.topShutterActive();
		}
		
		private function windowAt(index:uint):DoubleWindowImp {
			return segment._windows[index];
		}
		
		public function check_segment_cleared_returns_true_when_no_windows_are_broken():void {
			setRandomReturnsAndCreateSegment([]);
			assertTrue(segment.checkSegmentCleared());
		}
		
		public function check_segment_cleared_returns_false_when_first_window_is_broken():void {
			setRandomReturnsAndCreateSegment([0]);
			assertFalse(segment.checkSegmentCleared());
		}
		
		public function check_segment_cleared_returns_false_when_last_window_is_broken():void {
			setRandomReturnsAndCreateSegment([14]);
			assertFalse(segment.checkSegmentCleared());
		}
		
		public function get_window_at_throws_error_when_given_indecies_over_bounds():void {
			assertThrows(BuildingSegmentError, function():void {
					segment.getWindowAt(5, 0)
				})
			assertThrows(BuildingSegmentError, function():void {
					segment.getWindowAt(0, 3);
				})
		}
		
		public function get_window_at_works_correctly():void {
			assertEquals(segment._windows[0], segment.getWindowAt(0, 0));
			assertEquals(segment._windows[4], segment.getWindowAt(4, 0));
			assertEquals(segment._windows[5], segment.getWindowAt(0, 1));
			assertEquals(segment._windows[9], segment.getWindowAt(4, 1));
			assertEquals(segment._windows[10], segment.getWindowAt(0, 2));
			assertEquals(segment._windows[14], segment.getWindowAt(4, 2));
		}
	}
}