package com.building.window {
	import com.building.window.pane.WindowPane;
	import com.building.window.shutter.Shutter;
	import com.util.FakeRandomValueGenerator;
	import flash.display.MovieClip;
	import kris.test.MovieClipSpy;
	import kris.test.SuiteProvidingTestCase;
	
	public class DoubleWindowFactoryTest extends SuiteProvidingTestCase {
		private var window:DoubleWindow;
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
			window = new DoubleWindowFactory().create(view, pane1_, pane2_, topShutter_, leftShutter_, random)
		}
		
		public function no_nulls_passed_to_window():void {
			createWindow()
			assertNoNullsPassed()
		}
		
		private function assertNoNullsPassed():void {
			// Call functions on window to detect null variables
			assertPanesExist()
			assertShuttersExist()
		}
		
		private function assertPanesExist():void {
			window.breakWindow()
		}
		
		private function assertShuttersExist():void {
			window.leftShutterExists()
			window.topShutterExists()
		}
		
		public function passes_provided_components_to_window():void {
			var pane1:WindowPane = createWindowPane()
			var pane2:WindowPane = createWindowPane()
			var topShutter:Shutter = createShutter()
			var leftShutter:Shutter = createShutter()
			createWindow(pane1, pane2, topShutter, leftShutter)
			assertComponentsPassed(pane1, pane2, topShutter, leftShutter)
		}
		
		private function assertComponentsPassed(pane1:WindowPane, pane2:WindowPane, topShutter:Shutter, leftShutter:Shutter):void {
			assertPanesPassed(pane1, pane2)
			assertShuttersPassed(topShutter, leftShutter)
		}
		
		private function assertPanesPassed(pane1:WindowPane, pane2:WindowPane):void {
			window.breakWindow()
			assertPanesBroken(pane1, pane2)
		}
		
		private function assertPanesBroken(pane1:WindowPane, pane2:WindowPane):void {
			assertTrue(pane1.broken)
			assertTrue(pane2.broken)
		}
		
		private function assertShuttersPassed(topShutter:Shutter, leftShutter:Shutter):void {
			assertTopShutterPassed(topShutter)
			assertLeftShutterPassed(leftShutter)
		}
		
		private function assertLeftShutterPassed(leftShutter:Shutter):void {
			leftShutter.open()
			assertTrue(window.leftShutterExists())
		}
		
		private function assertTopShutterPassed(topShutter:Shutter):void {
			topShutter.open()
			assertTrue(window.topShutterExists())
		}
		
		public function passes_view_and_children():void {
			assertViewPropertyUsed("pane_mc_1");
			assertViewPropertyUsed("pane_mc_2");
			assertViewPropertyUsed("top_shutter");
			assertViewPropertyUsed("left_shutter");
		}
		
		private function assertViewPropertyUsed(propertyName:String):void {
			// Asserts that a movieclip saved on view as propertyName is used during createWindow()
			var child:MovieClipSpy = new MovieClipSpy()
			view[propertyName] = child
			createWindow()
			assertGoToAndStopCalled(child)
		}
		
		private function assertGoToAndStopCalled(movieClip:MovieClipSpy):void {
			movieClip.spy.assertLogged(movieClip.gotoAndStop)
		}
	}
}