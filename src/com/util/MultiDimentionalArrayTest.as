package com.util {
	import kris.test.SuiteProvidingTestCase;
	
	public class MultiDimentionalArrayTest extends SuiteProvidingTestCase {
		private var array:MultiDimentionalArray;
		
		public function MultiDimentionalArrayTest(testMethod:String = null) {
			super([
				size_can_be_set_from_constructor,
				size_can_be_set_from_setSize
				], testMethod);
		}
		
		public function size_can_be_set_from_constructor():void {
			testSettingMinimumSize(constructorFactory);
			testSettingMaximumSize(constructorFactory);
		}
		
		private function constructorFactory(numColumns:uint, numRows:uint):void {
			array = new MultiDimentionalArray(numColumns, numRows);
		}
		
		public function size_can_be_set_from_setSize():void {
			testSettingMinimumSize(setSizeFactory);
			testSettingMaximumSize(setSizeFactory);
		}
		
		private function setSizeFactory(numColumns:uint, numRows:uint):void {
			array = new MultiDimentionalArray();
			array.setSize(numColumns, numRows);
		}
		
		private function testSettingMinimumSize(factoryMethod:Function):void {
			factoryMethod(1, 1);
			assertArrayIsMinimumSize();
		}
		
		private function testSettingMaximumSize(factoryMethod:Function):void {
			factoryMethod(uint.MAX_VALUE, uint.MAX_VALUE)
			assertArrayIsMaximumSize();
		}
		
		private function assertArrayIsMinimumSize():void {
			assertEquals(1, array.getNumColumns());
			assertEquals(1, array.getNumRows());
		}
		
		private function assertArrayIsMaximumSize():void {
			assertEquals(uint.MAX_VALUE, array.getNumColumns());
			assertEquals(uint.MAX_VALUE, array.getNumRows());
		}
	}
}