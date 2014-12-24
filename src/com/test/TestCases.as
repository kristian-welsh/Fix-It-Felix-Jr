package com.test {
	import asunit.framework.TestSuite;
	import com.building.ShutterTest;
	import kris.test.SuiteProvider;
	import com.GameTest;

	public class TestCases extends TestSuite {
		public function TestCases() {
			super()
			includeTestsFrom(GameTest)
			includeTestsFrom(ShutterTest)
		}

		private function includeTestsFrom(testClass:Class):void {
			var object:Object = new testClass()
			assert(object is SuiteProvider, "class must implement SuiteProvider")
			addTest(object.getSuite());
		}
	}
}