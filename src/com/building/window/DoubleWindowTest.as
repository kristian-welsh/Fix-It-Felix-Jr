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
		
		private var window:DoubleWindow;
		
		public function DoubleWindowTest(testMethod:String = null) {
			super([
				target_can_be_retrieved,
				broken_is_false_by_default,
				gives_shutter_status,
				breaking_window_makes_broken_true,
				breaking_window_shatters_panes_appropriately
				//,repairs_single_broken_pane
				], testMethod);
		}
		
		override protected function setUp():void {
			target = new FakeDoubleWindowMovieClip();
			topShutter = createShutter()
			leftShutter = createShutter()
			pane1 = createWindowPane()
			pane2 = createWindowPane()
			random = new QueFakeRandomValueGenerator()
			window = new DoubleWindow(target, pane1, pane2, topShutter, leftShutter, random)
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
		
		public function breaking_window_shatters_panes_appropriately():void {
			testFalse();
			resetPanes();
			testTrueFalse();
			resetPanes();
			testTrueTrue();
		}
		
		private function resetPanes():void {
			pane1.repair()
			pane2.repair()
		}
		
		private function testFalse():void {
			random.setBooleanQue([false])
			window.breakWindow()
			assertFalse(pane1.broken)
			assertTrue(pane2.broken)
		}
		
		private function testTrueFalse():void {
			random.setBooleanQue([true, false])
			window.breakWindow()
			assertTrue(pane1.broken)
			assertFalse(pane2.broken)
		}
		
		private function testTrueTrue():void {
			random.setBooleanQue([true, true])
			window.breakWindow()
			assertTrue(pane1.broken)
			assertTrue(pane2.broken)
		}
	
	/*
	   public function fully_repairing_window_makes_broken_true():void {
	   window.breakWindow()
	   }
	
	   public function repairs_single_broken_pane():void {
	   assertPaneRepairs(pane1)
	   assertPaneRepairs(pane2)
	   }
	
	   private function assertPaneRepairs(pane:WindowPane):void {
	   pane.shatter()
	   assert(pane.broken)
	   window.fixWindow()
	   assertFalse(pane.broken)
	 }*/
	}
}