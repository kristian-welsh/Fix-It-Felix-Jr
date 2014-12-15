package com {
	import asunit.framework.TestCase;
	import asunit.framework.TestSuite;
	import kris.test.ReflectionTestSuiteBuilder;
	import kris.test.SuiteProvider;

	public class SuiteProvidingTestCase extends TestCase implements SuiteProvider {
		private var builder:ReflectionTestSuiteBuilder;
		private var testFunctions:Array;

		public function SuiteProvidingTestCase(testFunctions:Array, testMethod:String = null) {
			validateContentsType(testFunctions, Function)
			builder = new ReflectionTestSuiteBuilder(this)
			this.testFunctions = testFunctions;
			super(testMethod);
		}

		private function validateContentsType(collection:Array, type:Class):void {
			for each (var object:*in collection)
				assert(object is type, "Can only provide " + type + " objects as test functions.")
		}

		public function getSuite():TestSuite {
			registerTestFunctions(testFunctions)
			return builder.getSuite()
		}

		private function registerTestFunctions(functions:Array):void {
			builder.addTests(functions)
		}
	}
}