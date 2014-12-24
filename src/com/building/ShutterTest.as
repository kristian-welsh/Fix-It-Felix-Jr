package com.building {
	import com.test.SuiteProvidingTestCase;
	import kris.test.MovieClipSpy;
	
	public class ShutterTest extends SuiteProvidingTestCase {
		private var graphics:MovieClipSpy;
		private var shutter:Shutter;
		
		public function ShutterTest(testMethod:String = null) {
			super([
				shutter_set_up_correctly,
				can_set_active,
				can_set_inactive], testMethod);
		}
		
		override protected function setUp():void {
			graphics = new MovieClipSpy()
			shutter = new Shutter(graphics)
		}
		
		public function shutter_set_up_correctly():void {
			assertGotoAndStopCalled(2)
		}
		
		public function can_set_active():void {
			shutter.active = true
			assertGotoAndStopCalled(1, 1)
		}
		
		public function can_set_inactive():void {
			shutter.active = false
			assertGotoAndStopCalled(2, 1)
		}
		
		/**
		 * @param	value Expected value to have been passed to the call.
		 * @param	position Chronological position of call from start of class, 0 = 1st, 1 = 2nd etc.
		 */
		private function assertGotoAndStopCalled(value:uint, position:int = -1):void {
			assert(position >= -1)
			if (position == -1)
				graphics.spy.assertLogged(graphics.gotoAndStop, [value])
			else
				graphics.spy.assertLoggedAtPosition(position, graphics.gotoAndStop, [value])
		}
	}
}