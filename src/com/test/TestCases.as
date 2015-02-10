package com.test {
	import com.building.window.DoubleWindowFactoryTest;
	import com.building.window.DoubleWindowTest;
	import com.building.window.pane.WindowPaneTest;
	import com.building.window.shutter.ShutterTest;
	import com.game.GameTest;
	import kris.test.TestSuiteCollector;
	
	// possibility for future API: super(GameTest, ShutterTest, etc...)
	// maybe apply strategy pattern for test methods, so each has their own class.
	public class TestCases extends TestSuiteCollector {
		public function TestCases() {
			super()
			includeTestsFrom(GameTest)
			includeTestsFrom(ShutterTest)
			includeTestsFrom(WindowPaneTest)
			includeTestsFrom(DoubleWindowTest)
			includeTestsFrom(DoubleWindowFactoryTest)
		}
	}
}