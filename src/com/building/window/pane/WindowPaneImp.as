package com.building.window.pane {
	import com.util.random.RandomBooleanGenerator;
	import flash.display.MovieClip;
	
	public class WindowPaneImp implements WindowPane {
		private var _broken:Boolean = false;
		private var graphics:MovieClip;
		private var random:RandomBooleanGenerator;
		
		public function WindowPaneImp(graphics:MovieClip, random:RandomBooleanGenerator):void {
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
		
		public function smash():void {
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