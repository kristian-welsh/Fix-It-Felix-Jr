package com.building.window.shutter {
	import flash.display.MovieClip;
	
	/**
	 * If a shutter is open it will block the player, if it is closed, it will allow the player to pass.
	 */
	public class ShutterImp implements Shutter {
		private var graphics:MovieClip;
		private var _active:Boolean;
		
		public function ShutterImp(graphics:MovieClip):void {
			this.graphics = graphics;
			active = false;
		}
		
		/**
		 * @deprecated Use open or close instead.
		 */
		public function set active(value:Boolean):void {
			value ? open() : close()
		}
		
		public function open():void {
			_active = true
			graphics.gotoAndStop(1)
		}
		
		public function close():void {
			_active = false
			graphics.gotoAndStop(2)
		}
		
		public function get active():Boolean {
			return _active;
		}
	}
}