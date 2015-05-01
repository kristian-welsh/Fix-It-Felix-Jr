package com.building.window {
	import com.building.window.pane.*;
	import com.building.window.shutter.*;
	import com.building.window.shutter.switcher.ShutterSwitcherSpy;
	import com.util.random.boolean.fake.QueFakeRandomBooleanGenerator;
	import com.util.random.boolean.RandomBooleanGeneratorImp;
	import kris.test.MovieClipSpy;
	import kris.test.SuiteProvidingTestCase;
	
	public class DoubleWindowTest extends SuiteProvidingTestCase {
		private var target:FakeDoubleWindowMovieClip;
		private var pane1:WindowPane;
		private var pane2:WindowPane;
		private var topShutter:Shutter;
		private var leftShutter:Shutter;
		private var random:QueFakeRandomBooleanGenerator;
		
		private var shutterSwitcher:ShutterSwitcherSpy;
		
		private var window:DoubleWindowImp;
		
		public function DoubleWindowTest(testMethod:String = null) {
			super([
				target_can_be_retrieved,
				broken_is_false_by_default,
				gives_shutter_status,
				breaking_window_makes_broken_true,
				both_panes_break_for_true_true_random_output,
				pane1_breaks_for_true_extra_random_output_after_non_true_true,
				pane2_breaks_for_false_extra_random_output_after_non_true_true,
				fixing_both_broken_panes_chooses_one_randomly,
				can_repair_single_broken_pane,
				uses_shutter_switcher_to_shutter_window,
				passes_shutter_switcher_correct_name
				], testMethod);
		}
		
		override protected function setUp():void {
			target = new FakeDoubleWindowMovieClip();
			topShutter = createShutter()
			leftShutter = createShutter()
			pane1 = createWindowPane()
			pane2 = createWindowPane()
			random = new QueFakeRandomBooleanGenerator()
			shutterSwitcher = new ShutterSwitcherSpy()
			window = new DoubleWindowImp(target, pane1, pane2, topShutter, leftShutter, random, shutterSwitcher)
		}
		
		private function createWindowPane():WindowPane {
			return new WindowPaneImp(new MovieClipSpy(), new RandomBooleanGeneratorImp())
		}
		
		private function createShutter():Shutter {
			return new ShutterImp(new MovieClipSpy())
		}
		
		public function target_can_be_retrieved():void {
			assertEquals(target, window.getTarget());
		}
		
		public function broken_is_false_by_default():void {
			assertFalse(window.getBroken());
		}
		
		public function gives_shutter_status():void {
			givesTopShutterStatus()
			givestestLeftShutterStatus()
		}
		
		private function givesTopShutterStatus():void {
			assertFalse(window.topShutterActive())
			topShutter.open()
			assertTrue(window.topShutterActive())
		}
		
		private function givestestLeftShutterStatus():void {
			assertFalse(window.leftShutterActive())
			leftShutter.open()
			assertTrue(window.leftShutterActive())
		}
		
		public function breaking_window_makes_broken_true():void {
			assert(!window.getBroken())
			random.setBooleanQue([false, false, false])
			window.smash()
			assertTrue(window.getBroken())
		}
		
		public function both_panes_break_for_true_true_random_output():void {
			random.setBooleanQue([true, true])
			assertPanesBreak(true, true)
		}
		
		public function pane1_breaks_for_true_extra_random_output_after_non_true_true():void {
			//first two decides that a single pane is broken, third decides it's pane1
			random.setBooleanQue([true, false, true])
			assertPanesBreak(true, false)
		}
		
		public function pane2_breaks_for_false_extra_random_output_after_non_true_true():void {
			//first two decides that a single pane is broken, third decides it's pane2
			random.setBooleanQue([true, false, false])
			assertPanesBreak(false, true)
		}
		
		private function assertPanesBreak(pane1Breaks:Boolean, pane2Breaks:Boolean):void {
			repairPanes();
			window.smash()
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
			window.smash()
			assert(window.getBroken())
			window.repair()
			assertFalse(window.getBroken())
		}
		
		public function fixing_both_broken_panes_chooses_one_randomly():void {
			assertRandomResultFixesPane(true, pane1)
			assertRandomResultFixesPane(false, pane2)
		}
		
		private function assertRandomResultFixesPane(randomResult:Boolean, pane:WindowPane):void {
			smashBothPanes()
			random.setBooleanQue([randomResult])
			window.repair()
			assertFalse(pane.broken)
		}
		
		private function smashBothPanes():void {
			pane1.smash()
			pane2.smash()
		}
		
		public function can_repair_single_broken_pane():void {
			assertPaneRepairs(pane1)
			assertPaneRepairs(pane2)
		}
		
		private function assertPaneRepairs(pane:WindowPane):void {
			pane.smash()
			assert(pane.broken)
			window.repair()
			assertFalse(pane.broken)
		}
		
		public function uses_shutter_switcher_to_shutter_window():void {
			window.shutter()
			shutterSwitcher.spy.assertLogged(shutterSwitcher.execute)
		}
		
		public function passes_shutter_switcher_correct_name():void {
			target.name = "test"
			window.shutter()
			shutterSwitcher.spy.assertLogged(shutterSwitcher.execute, ["test"])
		}
	}
}