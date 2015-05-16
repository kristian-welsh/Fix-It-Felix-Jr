package com.util {
	import kris.test.SuiteProvidingTestCase;
	
	public class MultiDimentionalArrayTest extends SuiteProvidingTestCase {
		public function MultiDimentionalArrayTest(testMethod:String = null) {
			super([
				it_constructs
				], testMethod);
		}
		
		public function it_constructs():void {
			new MultiDimentionalArray();
		}
	}
}