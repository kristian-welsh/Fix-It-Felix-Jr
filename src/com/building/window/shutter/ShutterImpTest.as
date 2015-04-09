package com.building.window.shutter {
	import kris.test.MovieClipSpy;
	import kris.test.SuiteProvidingTestCase;
	
	public class ShutterImpTest extends SuiteProvidingTestCase {
		private var graphics:MovieClipSpy;
		private var shutter:ShutterImp;
		
		public function ShutterImpTest(testMethod:String = null) {
			super([
				shutter_set_up_correctly,
				can_set_active,
				can_open,
				can_set_inactive,
				can_close,
				can_get_active], testMethod);
		}
		
		override protected function setUp():void {
			graphics = new MovieClipSpy()
			shutter = new ShutterImp(graphics)
		}
		
		public function shutter_set_up_correctly():void {
			assertGotoAndStopCalled(2)
		}
		
		public function can_set_active():void {
			shutter.open()
			assertGotoAndStopCalled(1, 1)
		}
		
		public function can_open():void {
			shutter.open()
			assertGotoAndStopCalled(1, 1)
		}
		
		public function can_set_inactive():void {
			shutter.close()
			assertGotoAndStopCalled(2, 1)
		}
		
		public function can_close():void {
			shutter.close()
			assertGotoAndStopCalled(2, 1)
		}
		
		public function can_get_active():void {
			assertFalse(shutter.active)
			shutter.open()
			assertTrue(shutter.active)
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