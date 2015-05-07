package com.building.window.pane {
	import com.util.random.boolean.RandomBooleanGenerator;
	import flash.display.MovieClip;
	
	public class WindowPaneView {
		private var graphics:MovieClip;
		private var randomBooleanGenerator:RandomBooleanGenerator;
		
		public function WindowPaneView(graphics:MovieClip, random:RandomBooleanGenerator) {
			this.graphics = graphics;
			this.randomBooleanGenerator = random;
			displayIntact();
		}
		
		public function displayIntact():void {
			graphics.gotoAndStop(1);
		}
		
		public function displayBroken():void {
			graphics.gotoAndStop(randomBrokenFrame())
		}
		
		private function randomBrokenFrame():uint {
			return randomBooleanGenerator.generate() ? 2 : 3
		}
	}
}