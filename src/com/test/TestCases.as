package com.test {
	import com.building.window.shutter.ShutterTest;
	import com.building.window.pane.WindowPaneTest;
	import com.game.GameTest;
	import kris.test.TestSuiteCollector;
	
	public class TestCases extends TestSuiteCollector {
		public function TestCases() {
			super()
			includeTestsFrom(GameTest)
			includeTestsFrom(ShutterTest)
			includeTestsFrom(WindowPaneTest)
		}
	}
}