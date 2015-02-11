package com.building.window {
	import com.building.window.pane.WindowPane;
	import com.building.window.pane.WindowPaneImp;
	import com.building.window.shutter.Shutter;
	import com.building.window.shutter.ShutterImp;
	import com.util.FakeRandomValueGenerator;
	import com.util.RandomValueGeneratorImp;
	import kris.test.MovieClipSpy;
	import kris.test.SuiteProvidingTestCase;
	
	public class DoubleWindowTest extends SuiteProvidingTestCase {
		private var target:FakeDoubleWindowMovieClip;
		private var pane1:WindowPane;
		private var pane2:WindowPane;
		private var topShutter:Shutter;
		private var leftShutter:Shutter;
		private var random:FakeRandomValueGenerator;
		
		private var window:DoubleWindow;
		
		public function DoubleWindowTest(testMethod:String = null) {
			super([
				target_can_be_retrieved,
				broken_is_false_by_default,
				gives_shutter_status
				], testMethod);
		}
		
		override protected function setUp():void {
			target = new FakeDoubleWindowMovieClip();
			topShutter = createShutter()
			leftShutter = createShutter()
			pane1 = createWindowPane()
			pane2 = createWindowPane()
			random = new FakeRandomValueGenerator()
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
			testTopShutter()
			testLeftShutter()
		}
		
		private function testTopShutter():void {
			assertFalse(window.topShutterExists())
			topShutter.open()
			assertTrue(window.topShutterExists())
		}
		
		private function testLeftShutter():void {
			assertFalse(window.leftShutterExists())
			leftShutter.open()
			assertTrue(window.leftShutterExists())
		}
	}
}