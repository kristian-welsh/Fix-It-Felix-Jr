package com.building {
	import flash.display.MovieClip;

	public class WindowPane {
		private var _target:MovieClip;
		private var _broken:Boolean;

		public function WindowPane(target:MovieClip):void {
			_target = target;
			_target.gotoAndStop(1);
		}

		public function breakGlass():void  {
			_broken = true;
			if(randomBoolean()){
				_target.gotoAndStop(2);
			} else {
				_target.gotoAndStop(3);
			}
		}

		public function fixGlass():void  {
			_broken = false;
			_target.gotoAndStop(1);
		}

		private function randomBoolean():Boolean {
			return Boolean(Math.round(Math.random()) == 1);
		}

		public function get broken():Boolean {
			return _broken;
		}

		public function get target ():MovieClip{
			return _target;
		}
	}
}