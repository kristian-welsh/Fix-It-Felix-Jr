package com.building.window.factory {
	import com.building.window.DoubleWindow;
	import com.building.window.pane.WindowPaneImp;
	import com.building.window.shutter.ShutterImp;
	import com.util.random.boolean.fake.SetFakeRandomBooleanGenerator;
	import flash.display.MovieClip;
	import kris.test.MovieClipSpy;
	import kris.test.SuiteProvidingTestCase;
	
	public class DoubleWindowFactoryTest extends SuiteProvidingTestCase {
		private var window:DoubleWindow;
		private var view:MovieClip;
		private var random:SetFakeRandomBooleanGenerator;
		
		public function DoubleWindowFactoryTest(testMethod:String = null) {
			super([
				no_nulls_passed_to_window,
				passes_provided_components_to_window,
				passes_view_and_children
				], testMethod);
		}
		
		override protected function setUp():void {
			view = new MovieClip()
			random = new SetFakeRandomBooleanGenerator()
			random.setBooleanReturnValue(true)
		}
		
		private function createWindowPane():WindowPaneImp {
			return new WindowPaneImp(new MovieClip(), random);
		}
		
		private function createShutter():ShutterImp {
			return new ShutterImp(new MovieClip())
		}
		
		private function createWindow(pane1_:WindowPaneImp = null, pane2_:WindowPaneImp = null, topShutter_:ShutterImp = null, leftShutter_:ShutterImp = null):void {
			window = new DoubleWindowFactoryImp().create(view, pane1_, pane2_, topShutter_, leftShutter_, random)
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
			window.smash()
		}
		
		private function assertShuttersExist():void {
			window.leftShutterActive()
			window.topShutterActive()
		}
		
		public function passes_provided_components_to_window():void {
			var pane1:WindowPaneImp = createWindowPane()
			var pane2:WindowPaneImp = createWindowPane()
			var topShutter:ShutterImp = createShutter()
			var leftShutter:ShutterImp = createShutter()
			createWindow(pane1, pane2, topShutter, leftShutter)
			assertComponentsPassed(pane1, pane2, topShutter, leftShutter)
		}
		
		private function assertComponentsPassed(pane1:WindowPaneImp, pane2:WindowPaneImp, topShutter:ShutterImp, leftShutter:ShutterImp):void {
			assertPanesPassed(pane1, pane2)
			assertShuttersPassed(topShutter, leftShutter)
		}
		
		private function assertPanesPassed(pane1:WindowPaneImp, pane2:WindowPaneImp):void {
			window.smash()
			assertPanesBroken(pane1, pane2)
		}
		
		private function assertPanesBroken(pane1:WindowPaneImp, pane2:WindowPaneImp):void {
			assertTrue(pane1.broken)
			assertTrue(pane2.broken)
		}
		
		private function assertShuttersPassed(topShutter:ShutterImp, leftShutter:ShutterImp):void {
			assertTopShutterPassed(topShutter)
			assertLeftShutterPassed(leftShutter)
		}
		
		private function assertLeftShutterPassed(leftShutter:ShutterImp):void {
			leftShutter.open()
			assertTrue(window.leftShutterActive())
		}
		
		private function assertTopShutterPassed(topShutter:ShutterImp):void {
			topShutter.open()
			assertTrue(window.topShutterActive())
		}
		
		public function passes_view_and_children():void {
			assertViewPropertyUsed("pane_mc_1");
			assertViewPropertyUsed("pane_mc_2");
			assertViewPropertyUsed("top_shutter");
			assertViewPropertyUsed("left_shutter");
		}
		
		/**
		 * Asserts that a movieclip saved on view as propertyName is used during createWindow()
		 * @param	propertyName
		 */
		private function assertViewPropertyUsed(propertyName:String):void {
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