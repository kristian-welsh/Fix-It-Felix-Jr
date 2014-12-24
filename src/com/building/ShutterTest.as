package com.building {
	import com.test.SuiteProvidingTestCase;
	import kris.test.MovieClipSpy;
	
	public class ShutterTest extends SuiteProvidingTestCase {
		private var graphics:MovieClipSpy;
		private var shutter:Shutter;
		
		public function ShutterTest(testMethod:String = null) {
			super([shutter_set_up_correctly], testMethod);
		}
		
		override protected function setUp():void {
			graphics = new MovieClipSpy()
			shutter = new Shutter(graphics)
		}
		
		public function shutter_set_up_correctly():void {
			graphics.spy.assertLogged(graphics.gotoAndStop, [2])
		}
	}
}