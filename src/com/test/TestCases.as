package com.test {
	import asunit.framework.TestSuite;
	import com.building.ShutterTest;
	import com.building.WindowPaneTest;
	import kris.test.SuiteProvider;
	import com.GameTest;
	
	public class TestCases extends TestSuite {
		public function TestCases() {
			super()
			includeTestsFrom(GameTest)
			includeTestsFrom(ShutterTest)
			includeTestsFrom(WindowPaneTest)
		}
		
		private function includeTestsFrom(testClass:Class):void {
			var instance:Object = new testClass()
			assert(instance is SuiteProvider, "class must implement SuiteProvider")
			addTest(instance.getSuite());
		}
	}
}