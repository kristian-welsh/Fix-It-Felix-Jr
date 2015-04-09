package com.building.window.pane {
	import com.util.random.boolean.RandomBooleanGenerator;
	import flash.display.MovieClip;
	
	public class WindowPaneImp implements WindowPane {
		private var _broken:Boolean;
		private var view:WindowPaneView;
		
		public function WindowPaneImp(graphics:MovieClip, random:RandomBooleanGenerator):void {
			view = new WindowPaneView(graphics, random)
		}
		
		public function repair():void {
			if (broken) {
				_broken = false;
				view.displayIntact();
			}
		}
		
		public function smash():void {
			if (!broken) {
				_broken = true;
				view.displayBroken();
			}
		}
		
		public function get broken():Boolean {
			return _broken;
		}
	}
}