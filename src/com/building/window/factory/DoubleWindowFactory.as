package com.building.window.factory {
	import com.building.window.DoubleWindow;
	import com.building.window.pane.WindowPane;
	import com.building.window.shutter.Shutter;
	import com.building.window.shutter.switcher.ShutterSwitcher;
	import com.util.random.RandomBooleanGenerator;
	import flash.display.MovieClip;
	
	public interface DoubleWindowFactory {
		function create(view:MovieClip, pane1_:WindowPane = null, pane2_:WindowPane = null, topShutter_:Shutter = null, leftShutter_:Shutter = null, random_:RandomBooleanGenerator = null, shutterSwitcher_:ShutterSwitcher = null):DoubleWindow;
	}
}