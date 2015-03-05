package com.building.window.shutter.switcher {
	import com.building.window.shutter.Shutter;
	import com.util.QueFakeRandomBooleanGenerator;
	import kris.test.Spy;
	
	public class ShutterSwitcherSpy implements ShutterSwitcher {
		private var _spy:Spy;
		
		public function ShutterSwitcherSpy() {
			_spy = new Spy(this)
		}
		
		public function execute(windowName:String):void {
			_spy.log(execute, [windowName])
		}
		
		public function get spy():Spy {
			return _spy;
		}
	}
}