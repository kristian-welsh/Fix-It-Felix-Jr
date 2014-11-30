package {
	import asunit.framework.TestSuite;
	import kris.test.SuiteProvider;

	public class TestCases extends TestSuite {
		public function TestCases() {
			super()
			includeTestsFrom(GameTest)
		}

		private function includeTestsFrom(testClass:Class):void {
			var object:Object = new testClass()
			assert(object is SuiteProvider, "class must implement SuiteProvider")
			addTest(object.getSuite());
		}
	}
}