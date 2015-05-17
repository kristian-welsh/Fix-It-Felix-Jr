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
		
		override protected function setUp():void {
			array = new MultiDimentionalArray();
		}
		
		public function size_can_be_set_from_constructor():void {
			testSettingMinimumSize(false);
			testSettingMaximumSize(false);
		}
		
		public function size_can_be_set_from_setSize():void {
			testSettingMinimumSize(true);
			testSettingMaximumSize(true);
		}
		
		private function testSettingMinimumSize(useSetFunction:Boolean):void {
			setupArray(1, 1, useSetFunction);
			assertArrayIsMinimumSize();
		}
		
		private function testSettingMaximumSize(useSetFunction:Boolean):void {
			setupArray(uint.MAX_VALUE, uint.MAX_VALUE, useSetFunction);
			assertArrayIsMaximumSize();
		}
		
		private function setupArray(numColumns:uint, numRows:uint, useSetFunction:Boolean):void {
			if (useSetFunction)
				array.setSize(numColumns, numRows);
			else
				array = new MultiDimentionalArray(numColumns, numRows);
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