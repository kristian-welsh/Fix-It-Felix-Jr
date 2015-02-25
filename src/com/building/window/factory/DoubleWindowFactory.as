package com.building.window.factory {
	import com.building.window.DoubleWindow;
	import com.building.window.pane.*;
	import com.building.window.shutter.*;
	import com.util.*;
	import flash.display.MovieClip;
	
	public class DoubleWindowFactory {
		private var random:RandomValueGenerator;
		
		public function create(view:MovieClip, pane1_:WindowPane = null, pane2_:WindowPane = null, topShutter_:Shutter = null, leftShutter_:Shutter = null, random:RandomValueGenerator = null):DoubleWindow {
			this.random = random || new RandomValueGeneratorImp()
			
			var pane1:WindowPane = createWindowPane(pane1_, view.pane_mc_1)
			var pane2:WindowPane = createWindowPane(pane2_, view.pane_mc_2)
			var topShutter:Shutter = createShutter(topShutter_, view.top_shutter)
			var leftShutter:Shutter = createShutter(leftShutter_, view.left_shutter)
			
			return new DoubleWindow(view, pane1, pane2, topShutter, leftShutter, random);
		}
		
		private function createWindowPane(pane:WindowPane, graphics:MovieClip):WindowPane {
			graphics = graphics || new MovieClip();
			return pane || new WindowPaneImp(graphics, random);
		}
		
		private function createShutter(shutter:Shutter, graphics:MovieClip):Shutter {
			graphics = graphics || new MovieClip();
			return shutter || new ShutterImp(graphics);
		}
	}
}