package com.util.random.int {
	import kris.test.SuiteProvidingTestCase;
	
	public class RandomIntGeneratorTest extends SuiteProvidingTestCase {
		private var generator:RandomIntGenerator;
		private var returned:Array;
		
		public function RandomIntGeneratorTest(testMethod:String = null) {
			super([
				asking_for_zero_results_returns_empty_array,
				
				], testMethod);
		}
		
		override protected function setUp():void {
			generator = new RandomIntGeneratorImp()
		}
		
		public function asking_for_zero_results_returns_empty_array():void {
			testInputs(0, 0, 0)
			assertEquals(0, returned.length)
		}
		
		private function testInputs(num:Number, lowest:Number, highest:Number):void {
			returned = generator.nonRepeatedBoundedInts(num, lowest, highest)
		}
	}
}