package com.util {
	import kris.test.SuiteProvidingTestCase;
	
	public class MultiDimentionalArrayTest extends SuiteProvidingTestCase {
		public function MultiDimentionalArrayTest(testMethod:String = null) {
			super([
				size_can_be_set_from_constructor,
				size_can_be_set_from_setSize,
				array_can_be_filled_with_function_output,
				invalid_read_throws_error
				], testMethod);
		}
		
		public function size_can_be_set_from_constructor():void {
			testSizeBoundrys(constructorFactory);
		}
		
		public function size_can_be_set_from_setSize():void {
			testSizeBoundrys(setSizeFactory);
		}
		
		public function array_can_be_filled_with_function_output():void {
			var array:MultiDimentionalArray = new MultiDimentionalArray(1, 1);
			array.fill(function():Object {
					return new Object();
				});
		}
		
		public function invalid_read_throws_error():void {
			var array:MultiDimentionalArray = new MultiDimentionalArray(1, 1);
			assertThrows(MultiDimentionalArrayError, function():void {
					array.read(0, 0);
				});
		}
		
		private function testSizeBoundrys(factoryMethod:Function):void {
			testSettingSize(1, 1, factoryMethod);
			testSettingSize(uint.MAX_VALUE, uint.MAX_VALUE, factoryMethod);
		}
		
		private function testSettingSize(numColumns:uint, numRows:uint, factoryMethod:Function):void {
			var array:MultiDimentionalArray = factoryMethod(numColumns, numRows);
			assertEquals(numColumns, array.getNumColumns());
			assertEquals(numRows, array.getNumRows());
		}
		
		private function constructorFactory(numColumns:uint, numRows:uint):MultiDimentionalArray {
			return new MultiDimentionalArray(numColumns, numRows);
		}
		
		private function setSizeFactory(numColumns:uint, numRows:uint):MultiDimentionalArray {
			var result:MultiDimentionalArray = new MultiDimentionalArray();
			result.setSize(numColumns, numRows);
			return result;
		}
	}
}