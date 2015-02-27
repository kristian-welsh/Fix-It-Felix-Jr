package com.building.window.shutter.switcher {
	import com.building.window.shutter.Shutter;
	import com.building.window.shutter.ShutterImp;
	import com.util.QueFakeRandomValueGenerator;
	import flash.display.MovieClip;
	import kris.test.SuiteProvidingTestCase;
	
	public class ShutterSwitcherTest extends SuiteProvidingTestCase {
		private var topShutter:Shutter;
		private var leftShutter:Shutter;
		private var random:QueFakeRandomValueGenerator;
		private var switcher:ShutterSwitcher;
		
		public function ShutterSwitcherTest(testMethod:String = null) {
			super([
				window_00_activates_both_shutters,
				window_01_activates_left_shutter,
				window_02_activates_left_shutter,
				window_03_activates_left_shutter,
				window_04_activates_left_shutter,
				window_05_activates_top_shutter,
				window_10_activates_top_shutter,
				window_15_activates_no_shutters,
				other_names_activate_top_shutter_while_random_returns_true,
				other_names_activate_left_shutter_while_random_returns_false
				], testMethod);
		}
		
		override protected function setUp():void {
			topShutter = new ShutterImp(new MovieClip())
			leftShutter = new ShutterImp(new MovieClip())
			random = new QueFakeRandomValueGenerator()
			switcher = new ShutterSwitcher(topShutter, leftShutter, random)
		}
		
		public function window_00_activates_both_shutters():void {
			assertNameResultsNonRandomly("window_00", true, true);
		}
		
		public function window_01_activates_left_shutter():void {
			assertNameResultsNonRandomly("window_01", false, true);
		}
		
		public function window_02_activates_left_shutter():void {
			assertNameResultsNonRandomly("window_02", false, true);
		}
		
		public function window_03_activates_left_shutter():void {
			assertNameResultsNonRandomly("window_03", false, true);
		}
		
		public function window_04_activates_left_shutter():void {
			assertNameResultsNonRandomly("window_04", false, true);
		}
		
		public function window_05_activates_top_shutter():void {
			assertNameResultsNonRandomly("window_05", true, false);
		}
		
		public function window_10_activates_top_shutter():void {
			assertNameResultsNonRandomly("window_10", true, false);
		}
		
		public function window_15_activates_no_shutters():void {
			assertNameResultsNonRandomly("window_15", false, false);
		}
		
		public function other_names_activate_top_shutter_while_random_returns_true():void {
			random.setBooleanQue([true]);
			assertNameResults("foobarbaz", true, false);
		}
		
		public function other_names_activate_left_shutter_while_random_returns_false():void {
			random.setBooleanQue([false]);
			assertNameResults("foobarbaz", false, true);
		}
		
		private function assertNameResultsNonRandomly(name:String, topShutterActive:Boolean, leftShutterActive:Boolean):void {
			random.setBooleanQue([!topShutterActive]);
			assertNameResults(name, topShutterActive, leftShutterActive);
		}
		
		private function assertNameResults(name:String, topShutterActive:Boolean, leftShutterActive:Boolean):void {
			switcher.execute(name)
			assertEquals(topShutterActive, topShutter.active);
			assertEquals(leftShutterActive, leftShutter.active);
		}
	}
}