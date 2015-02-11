package com.building.window.pane {
	import com.util.RandomValueGenerator;
	import flash.display.MovieClip;
	
	public class WindowPaneImp implements WindowPane {
		private var _broken:Boolean = false;
		private var graphics:MovieClip;
		private var random:RandomValueGenerator;
		
		public function WindowPaneImp(graphics:MovieClip, random:RandomValueGenerator):void {
			this.graphics = graphics;
			this.random = random;
			displayIntact();
		}
		
		public function repair():void {
			_broken = false;
			displayIntact();
		}
		
		private function displayIntact():void {
			graphics.gotoAndStop(1);
		}
		
		public function shatter():void {
			_broken = true;
			displayBroken();
		}
		
		private function displayBroken():void {
			graphics.gotoAndStop(randomBrokenFrame())
		}
		
		private function randomBrokenFrame():uint {
			return random.boolean() ? 2 : 3
		}
		
		public function get broken():Boolean {
			return _broken;
		}
	}
}