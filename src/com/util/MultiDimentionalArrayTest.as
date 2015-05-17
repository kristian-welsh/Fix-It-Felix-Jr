package com.util {
	import kris.test.SuiteProvidingTestCase;
	
	public class MultiDimentionalArrayTest extends SuiteProvidingTestCase {
		private var array:MultiDimentionalArray;
		
		public function MultiDimentionalArrayTest(testMethod:String = null) {
			super([
				its_size_can_be_retrieved_when_set_from_constructor,
				its_size_can_be_retrieved_when_set_from_setSize
				], testMethod);
		}
		
		public function its_size_can_be_retrieved_when_set_from_constructor():void {
			array = new MultiDimentionalArray(1, 1);
			assertEquals(1, array.getNumColumns());
			assertEquals(1, array.getNumRows());
			
			array = new MultiDimentionalArray(uint.MAX_VALUE, uint.MAX_VALUE);
			assertEquals(uint.MAX_VALUE, array.getNumColumns());
			assertEquals(uint.MAX_VALUE, array.getNumRows());
		}
		
		public function its_size_can_be_retrieved_when_set_from_setSize():void {
			array = new MultiDimentionalArray();
			
			array.setSize(1, 1);
			assertEquals(1, array.getNumColumns());
			assertEquals(1, array.getNumRows());
			
			array.setSize(uint.MAX_VALUE, uint.MAX_VALUE);
			assertEquals(uint.MAX_VALUE, array.getNumColumns());
			assertEquals(uint.MAX_VALUE, array.getNumRows());
		}
	}
}