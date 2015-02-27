package com.building.window.shutter.switcher {
	import com.building.window.shutter.ShutterImp;
	import com.util.QueFakeRandomValueGenerator;
	import flash.display.MovieClip;
	import kris.test.SuiteProvidingTestCase;
	
	public class ShutterSwitcherTest extends SuiteProvidingTestCase {
		private var topShutter:ShutterImp;
		private var leftShutter:ShutterImp;
		private var random:QueFakeRandomValueGenerator;
		private var switcher:ShutterSwitcher;
		
		/**
		 * This array holds the values necessary to test the reslut of a window.shutter() call.
		 * @param [0] Name to assign to window view to test resluts for.
		 * @param [1] Whether topShutter should be active after window.shutter()
		 * @param [2] Whether leftShutter should be active after window.shutter()
		 */
		private var nameResultsMappings:Array = [
			["window_00", true, true],
			["window_01", false, true],
			["window_02", false, true],
			["window_03", false, true],
			["window_04", false, true],
			["window_05", true, false],
			["window_10", true, false],
			["window_15", false, false]
		]
		
		public function ShutterSwitcherTest(testMethod:String = null) {
			super([
				test_configured_name_results,
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
		
		public function test_configured_name_results():void {
			for each (var mapping:Array in nameResultsMappings)
				assertMappingAccurate(mapping)
		}
		
		private function assertMappingAccurate(mapping:Array):void {
			assertNameResultsNonRandomly(mapping[0], mapping[1], mapping[2]);
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
			setUp() // Necessary call to reset after each mapped test.
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