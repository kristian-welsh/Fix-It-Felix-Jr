package com.util {
	import kris.test.SuiteProvidingTestCase;
	import org.flashdevelop.utils.FlashConnect;
	
	public class MultiDimentionalArrayTest extends SuiteProvidingTestCase {
		private var array:MultiDimentionalArray;
		private var contents1:Object;
		private var contents2:Object;
		
		private const SIZES_TO_TEST:Array = [
			[1, 1],
			[2, 1],
			[5, 1],
			[1, 2],
			[1, 5],
			[5, 5]
			];
		
		public function MultiDimentionalArrayTest(testMethod:String = null) {
			super([
				size_can_be_set_from_constructor,
				size_can_be_set_from_setSize,
				array_can_be_filled_with_function_output,
				invalid_read_throws_error,
				data_can_be_retrieved_from_any_sized_array
				], testMethod);
		}
		
		override protected function setUp():void {
			contents1 = new Object();
			contents2 = new Object();
		}
		
		public function size_can_be_set_from_constructor():void {
			testSizeBoundrys(constructorFactory);
		}
		
		public function size_can_be_set_from_setSize():void {
			testSizeBoundrys(setSizeFactory);
		}
		
		private function testSizeBoundrys(factoryMethod:Function):void {
			testSettingSize(1, 1, factoryMethod);
			testSettingSize(uint.MAX_VALUE, uint.MAX_VALUE, factoryMethod);
		}
		
		private function testSettingSize(numColumns:uint, numRows:uint, factoryMethod:Function):void {
			var sizeTestArray:MultiDimentionalArray = factoryMethod(numColumns, numRows);
			assertEquals(numColumns, sizeTestArray.getNumColumns());
			assertEquals(numRows, sizeTestArray.getNumRows());
		}
		
		private function constructorFactory(numColumns:uint, numRows:uint):MultiDimentionalArray {
			return new MultiDimentionalArray(numColumns, numRows);
		}
		
		private function setSizeFactory(numColumns:uint, numRows:uint):MultiDimentionalArray {
			var result:MultiDimentionalArray = new MultiDimentionalArray();
			result.setSize(numColumns, numRows);
			return result;
		}
		
		public function array_can_be_filled_with_function_output():void {
			array = new MultiDimentionalArray(1, 1);
			
			array.fill(function():Object {
					return new Object();
				});
		}
		
		public function invalid_read_throws_error():void {
			array = new MultiDimentionalArray(1, 1);
			
			assertThrows(MultiDimentionalArrayError, function():void {
					array.read(0, 0);
				});
		}
		
		public function data_can_be_retrieved_from_any_sized_array():void {
			for each(var size:Array in SIZES_TO_TEST)
				testAllDataRetrieveableFromSize(size[0], size[1])
		}
		
		private function testAllDataRetrieveableFromSize(numColumns:uint, numRows:uint):void {
			array = new MultiDimentionalArray(numColumns, numRows);
			
			fillWithContents();
			
			for (var column:uint = 0; column < numColumns; column++)
				for (var row:uint = 0; row < numRows; row++)
					assertSame(contentsToExpect(column, row), array.read(column, row));
		}
		
		private function contentsToExpect(i:uint, j:uint):Object {
			return (i == 0 && j == 0) ? contents1 : contents2;
		}
		
		private function fillWithContents():void {
			var firstTime:Boolean = true;
			array.fill(function():Object {
					if (firstTime) {
						firstTime = false;
						return contents1;
					}
					return contents2;
				});
		}
	}
}