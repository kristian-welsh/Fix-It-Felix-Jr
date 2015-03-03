package com.building.window.factory {
	import com.building.window.DoubleWindow;
	import com.building.window.pane.*;
	import com.building.window.shutter.*;
	import com.building.window.shutter.switcher.*;
	import com.util.*;
	import flash.display.MovieClip;
	
	public class DoubleWindowFactoryImp implements DoubleWindowFactory {
		private var random:RandomValueGenerator;
		private var pane1:WindowPane;
		private var pane2:WindowPane;
		private var topShutter:Shutter;
		private var leftShutter:Shutter;
		private var shutterSwitcher:ShutterSwitcher;
		
		public function create(view:MovieClip, pane1_:WindowPane = null, pane2_:WindowPane = null, topShutter_:Shutter = null, leftShutter_:Shutter = null, random_:RandomValueGenerator = null, shutterSwitcher_:ShutterSwitcher = null):DoubleWindow {
			this.random = random_ || new RandomValueGeneratorImp()
			
			pane1 = createWindowPane(pane1_, view.pane_mc_1)
			pane2 = createWindowPane(pane2_, view.pane_mc_2)
			topShutter = createShutter(topShutter_, view.top_shutter)
			leftShutter = createShutter(leftShutter_, view.left_shutter)
			shutterSwitcher = createShutterSwitcher(shutterSwitcher_)
			
			return createDoubleWindow(view)
		}
		
		/**
		 * Depends upon random
		 */
		private function createWindowPane(pane:WindowPane, graphics:MovieClip):WindowPane {
			graphics = graphics || new MovieClip();
			return pane || new WindowPaneImp(graphics, random);
		}
		
		private function createShutter(shutter:Shutter, graphics:MovieClip):Shutter {
			graphics = graphics || new MovieClip();
			return shutter || new ShutterImp(graphics);
		}
		
		/**
		 * Depends upon topShutter, leftShutter, and random
		 */
		private function createShutterSwitcher(shutterSwitcher_:ShutterSwitcher):ShutterSwitcher {
			return shutterSwitcher_ || new ShutterSwitcherImp(topShutter, leftShutter, random)
		}
		
		/**
		 * Depends upon all other instances
		 */
		private function createDoubleWindow(view:MovieClip):DoubleWindow {
			return new DoubleWindow(view, pane1, pane2, topShutter, leftShutter, random, shutterSwitcher);
		}
	}
}