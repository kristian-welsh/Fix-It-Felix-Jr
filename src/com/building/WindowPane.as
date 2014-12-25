package com.building {
	import com.util.RandomValueGenerator;
	import flash.display.MovieClip;
	
	public class WindowPane {
		private var graphics:MovieClip;
		private var _broken:Boolean;
		private var random:RandomValueGenerator;
		
		public function WindowPane(graphics:MovieClip, random:RandomValueGenerator):void {
			this.random = random;
			this.graphics = graphics;
			graphics.gotoAndStop(1);
		}
		
		public function breakGlass():void {
			_broken = true;
			graphics.gotoAndStop(shouldShowAltGraphic() ? 2 : 3)
		}
		
		public function fixGlass():void {
			_broken = false;
			graphics.gotoAndStop(1);
		}
		
		private function shouldShowAltGraphic():Boolean {
			return random.boolean()
		}
		
		public function get broken():Boolean {
			return _broken;
		}
	}
}