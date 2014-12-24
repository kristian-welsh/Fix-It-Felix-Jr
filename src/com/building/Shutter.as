package com.building {
	import flash.display.MovieClip;
	
	public class Shutter {
		private var _target:MovieClip;
		
		public function Shutter(target:MovieClip):void {
			_target = target;
			active = false;
		}
		
		public function set active (value:Boolean):void  {
			_target.gotoAndStop(value ? 1 : 2)
		}
		
		public function get active ():Boolean {
			return _target.currentFrame==1;
		}
	}
}