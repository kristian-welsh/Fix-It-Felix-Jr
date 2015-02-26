package com.building.window {
	import com.building.window.pane.WindowPane;
	import com.building.window.pane.WindowPaneImp;
	import com.building.window.shutter.Shutter;
	import com.building.window.shutter.ShutterImp;
	import com.util.QueFakeRandomValueGenerator;
	import com.util.RandomValueGeneratorImp;
	import kris.test.MovieClipSpy;
	import kris.test.SuiteProvidingTestCase;
	
	public class DoubleWindowTest extends SuiteProvidingTestCase {
		private var target:FakeDoubleWindowMovieClip;
		private var pane1:WindowPane;
		private var pane2:WindowPane;
		private var topShutter:Shutter;
		private var leftShutter:Shutter;
		private var random:QueFakeRandomValueGenerator;
		
		// This is now ready to have the tests seperated
		private var shutterSwitcher:ShutterSwitcher;
		
		private var window:DoubleWindow;
		
		public function DoubleWindowTest(testMethod:String = null) {
			super([
				target_can_be_retrieved,
				broken_is_false_by_default,
				gives_shutter_status,
				breaking_window_makes_broken_true,
				pane2_breaks_for_false_random_output,
				pane1_breaks_for_true_false_random_output,
				both_panes_break_for_true_true_random_output,
				fixing_both_shattered_panes_chooses_one_randomly,
				can_repair_single_broken_pane,
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
			target = new FakeDoubleWindowMovieClip();
			topShutter = createShutter()
			leftShutter = createShutter()
			pane1 = createWindowPane()
			pane2 = createWindowPane()
			random = new QueFakeRandomValueGenerator()
			shutterSwitcher = new ShutterSwitcher(topShutter, leftShutter, random)
			window = new DoubleWindow(target, pane1, pane2, topShutter, leftShutter, random, shutterSwitcher)
		}
		
		private function createWindowPane():WindowPane {
			return new WindowPaneImp(new MovieClipSpy(), new RandomValueGeneratorImp())
		}
		
		private function createShutter():Shutter {
			return new ShutterImp(new MovieClipSpy())
		}
		
		public function target_can_be_retrieved():void {
			assertEquals(target, window.target);
		}
		
		public function broken_is_false_by_default():void {
			assertFalse(window.broken);
		}
		
		public function gives_shutter_status():void {
			givesTopShutterStatus()
			givestestLeftShutterStatus()
		}
		
		private function givesTopShutterStatus():void {
			assertFalse(window.topShutterExists())
			topShutter.open()
			assertTrue(window.topShutterExists())
		}
		
		private function givestestLeftShutterStatus():void {
			assertFalse(window.leftShutterExists())
			leftShutter.open()
			assertTrue(window.leftShutterExists())
		}
		
		public function breaking_window_makes_broken_true():void {
			assert(!window.broken)
			window.breakWindow()
			assertTrue(window.broken)
		}
		
		public function pane2_breaks_for_false_random_output():void {
			random.setBooleanQue([false])
			assertPanesBreak(false, true)
		}
		
		public function pane1_breaks_for_true_false_random_output():void {
			random.setBooleanQue([true, false])
			assertPanesBreak(true, false)
		}
		
		public function both_panes_break_for_true_true_random_output():void {
			random.setBooleanQue([true, true])
			assertPanesBreak(true, true)
		}
		
		private function assertPanesBreak(pane1Breaks:Boolean, pane2Breaks:Boolean):void {
			repairPanes();
			window.breakWindow()
			assertEquals(pane1Breaks, pane1.broken)
			assertEquals(pane2Breaks, pane2.broken)
		}
		
		private function repairPanes():void {
			pane1.repair()
			pane2.repair()
		}
		
		public function repairing_window_makes_broken_false():void {
			assertFixingWindowMakesBrokenFalse()
		}
		
		private function assertFixingWindowMakesBrokenFalse():void {
			window.breakWindow()
			assert(window.broken)
			window.repair()
			assertFalse(window.broken)
		}
		
		public function fixing_both_shattered_panes_chooses_one_randomly():void {
			assertRandomResultFixesPane(true, pane1)
			assertRandomResultFixesPane(false, pane2)
		}
		
		private function assertRandomResultFixesPane(randomResult:Boolean, pane:WindowPane):void {
			shatterBothPanes()
			random.setBooleanQue([randomResult])
			window.repair()
			assertFalse(pane.broken)
		}
		
		private function shatterBothPanes():void {
			pane1.shatter()
			pane2.shatter()
		}
		
		public function can_repair_single_broken_pane():void {
			assertPaneRepairs(pane1)
			assertPaneRepairs(pane2)
		}
		
		private function assertPaneRepairs(pane:WindowPane):void {
			pane.shatter()
			assert(pane.broken)
			window.repair()
			assertFalse(pane.broken)
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
			target.name = name;
			window.shutterWindow();
			assertEquals(topShutterActive, topShutter.active);
			assertEquals(leftShutterActive, leftShutter.active);
		}
	}
}