package com.building.window {
	import com.building.window.pane.WindowPane;
	import com.building.window.shutter.Shutter;
	import com.util.FakeRandomValueGenerator;
	import flash.display.MovieClip;
	import kris.test.MovieClipSpy;
	import kris.test.SuiteProvidingTestCase;
	
	public class DoubleWindowFactoryTest extends SuiteProvidingTestCase {
		private var subject:DoubleWindow;
		private var view:MovieClip;
		private var random:FakeRandomValueGenerator
		
		public function DoubleWindowFactoryTest(testMethod:String = null) {
			super([
				no_nulls_passed_to_window,
				passes_provided_components_to_window,
				passes_view_and_children
				], testMethod);
		}
		
		override protected function setUp():void {
			view = new MovieClip()
			random = new FakeRandomValueGenerator()
			random.setBooleanReturnValue(true)
		}
		
		private function createWindowPane():WindowPane {
			return new WindowPane(new MovieClip(), random);
		}
		
		private function createShutter():Shutter {
			return new Shutter(new MovieClip())
		}
		
		private function createWindow(pane1_:WindowPane = null, pane2_:WindowPane = null, topShutter_:Shutter = null, leftShutter_:Shutter = null):void {
			subject = new DoubleWindowFactory().create(view, pane1_, pane2_, topShutter_, leftShutter_, random)
		}
		
		public function no_nulls_passed_to_window():void {
			createWindow()
			assertNoNullsPassed()
		}
		
		public function passes_provided_components_to_window():void {
			var pane1:WindowPane = createWindowPane()
			var pane2:WindowPane = createWindowPane()
			var topShutter:Shutter = createShutter()
			var leftShutter:Shutter = createShutter()
			createWindow(pane1, pane2, topShutter, leftShutter)
			assertComponentsPassed(pane1, pane2, topShutter, leftShutter)
		}
		
		public function passes_view_and_children():void {
			assertViewPropertyUsed("pane_mc_1", 1);
			assertViewPropertyUsed("pane_mc_2", 1);
			assertViewPropertyUsed("top_shutter", 2);
			assertViewPropertyUsed("left_shutter", 2);
		}
		
		private function assertViewPropertyUsed(name:String, frame:uint):void {
			// Asserts that a movieclip saved into a value on view named "name" is changed to frame "frame"
			var bar:MovieClipSpy = new MovieClipSpy()
			view[name] = bar
			createWindow()
			bar.spy.assertLogged(bar.gotoAndStop, [frame])
		}
		
		private function assertNoNullsPassed():void {
			// Call functions on double window to detect null variables
			assertShuttersWithViewsReceived()
			assertPanesWithViewsReceived()
		}
		
		private function assertPanesWithViewsReceived():void {
			subject.breakWindow()
		}
		
		private function assertShuttersWithViewsReceived():void {
			subject.leftShutterExists()
			subject.topShutterExists()
		}
		
		private function assertComponentsPassed(pane1:WindowPane, pane2:WindowPane, topShutter:Shutter, leftShutter:Shutter):void {
			assertPanesPassed(pane1, pane2)
			assertShuttersPassed(topShutter, leftShutter)
		}
		
		private function assertPanesPassed(pane1:WindowPane, pane2:WindowPane):void {
			subject.breakWindow()
			assertTrue(pane1.broken)
			assertTrue(pane2.broken)
		}
		
		private function assertShuttersPassed(topShutter:Shutter, leftShutter:Shutter):void {
			topShutter.open()
			leftShutter.open()
			assertTrue(subject.topShutterExists())
			assertTrue(subject.leftShutterExists())
		}
	}
}