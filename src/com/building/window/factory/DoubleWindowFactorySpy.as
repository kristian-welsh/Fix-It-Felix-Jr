package com.building.window.factory {
	import com.building.window.DoubleWindow;
	import com.building.window.FakeDoubleWindow;
	import com.building.window.pane.WindowPane;
	import com.building.window.shutter.Shutter;
	import com.building.window.shutter.switcher.ShutterSwitcher;
	import com.util.random.boolean.RandomBooleanGenerator;
	import flash.display.MovieClip;
	import kris.test.Spy;
	
	public class DoubleWindowFactorySpy implements DoubleWindowFactory {
		private var returnFakes:Boolean;
		private var _spy:Spy;
		
		public function DoubleWindowFactorySpy(returnFakes:Boolean = false) {
			this.returnFakes = returnFakes;
			_spy = new Spy(this)
		}
		
		public function create(view:MovieClip, pane1_:WindowPane = null, pane2_:WindowPane = null, topShutter_:Shutter = null, leftShutter_:Shutter = null, random_:RandomBooleanGenerator = null, shutterSwitcher_:ShutterSwitcher = null):DoubleWindow {
			_spy.log(create, [view, pane1_, pane2_, topShutter_, leftShutter_, random_, shutterSwitcher_])
			
			if(returnFakes)
				return new FakeDoubleWindow();
			else
				return new DoubleWindowFactoryImp().create(view, pane1_, pane2_, topShutter_, leftShutter_, random_, shutterSwitcher_)
		}
		
		public function get spy():Spy {
			return _spy
		}
	}
}