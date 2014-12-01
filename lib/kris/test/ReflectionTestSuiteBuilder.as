package kris.test {
	import asunit.framework.TestSuite;
	import assert;
	import kris.Util;

	public class ReflectionTestSuiteBuilder {
		private var objectInstance:Object;
		private var suite:TestSuite;

		public function ReflectionTestSuiteBuilder(objectInstance:Object) {
			suite = new TestSuite();
			this.objectInstance = objectInstance
		}

		/**
		 * @param	tests An array of public test functions, from the instance provided to the constructor.
		 */
		public function addTests(tests:Array):void {
			validateTests(tests)
			for each (var test:Object in tests)
				addTest(test as Function)
		}

		private function validateTests(tests:Array):void {
			for each (var test:Object in tests)
				assert(test is Function)
		}

		private function addTest(method:Function):void {
			var functionName:String = Util.getFunctionName(method, objectInstance)
			var requiredTestClass:Class = Util.getClassOf(objectInstance)
			suite.addTest(new requiredTestClass(functionName))
		}

		public function getSuite():TestSuite {
			return suite;
		}
	}
}