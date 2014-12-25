package com.test {
	import com.building.ShutterTest;
	import com.building.WindowPaneTest;
	import com.GameTest;
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