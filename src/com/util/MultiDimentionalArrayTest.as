package com.util {
	import kris.test.SuiteProvidingTestCase;
	import org.flashdevelop.utils.FlashConnect;
	
	public class MultiDimentionalArrayTest extends SuiteProvidingTestCase {
		private var array:MultiDimentionalArray;
		
		public function MultiDimentionalArrayTest(testMethod:String = null) {
			super([
				size_can_be_set_from_constructor,
				size_can_be_set_from_setSize,
				array_can_be_filled_with_function_output,
				invalid_read_throws_error,
				data_can_be_retrieved_from_1_1_array,
				data_can_be_retrieved_from_2_1_array,
				data_can_be_retrieved_from_5_1_array,
				data_can_be_retrieved_from_1_2_array,
				data_can_be_retrieved_from_1_5_array,
				data_can_be_retrieved_from_5_5_array
				], testMethod);
		}
		
		override protected function setUp():void {
			array = new MultiDimentionalArray(1, 1);
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
			array.fill(function():Object {
					return new Object();
				});
		}
		
		public function invalid_read_throws_error():void {
			assertThrows(MultiDimentionalArrayError, function():void {
					array.read(0, 0);
				});
		}
		
		public function data_can_be_retrieved_from_1_1_array():void {
			var contents:Object = new Object();
			array.fill(function():Object {
					return contents;
				});
			
			assertSame(contents, array.read(0, 0));
		}
		
		public function data_can_be_retrieved_from_2_1_array():void {
			array = new MultiDimentionalArray(2, 1);
			
			var firstTime:Boolean = true;
			var contents1:Object = new Object();
			var contents2:Object = new Object();
			array.fill(function():Object {
					if (firstTime) {
						firstTime = false;
						return contents1;
					}
					return contents2;
				});
			
			assertSame(contents1, array.read(0, 0));
			assertSame(contents2, array.read(1, 0));
		}
		
		public function data_can_be_retrieved_from_5_1_array():void {
			array = new MultiDimentionalArray(5, 1);
			
			var firstTime:Boolean = true;
			var contents1:Object = new Object();
			var contents2:Object = new Object();
			array.fill(function():Object {
					if (firstTime) {
						firstTime = false;
						return contents1;
					}
					return contents2;
				});
			
			assertSame(contents1, array.read(0, 0));
			assertSame(contents2, array.read(1, 0));
			assertSame(contents2, array.read(2, 0));
			assertSame(contents2, array.read(3, 0));
			assertSame(contents2, array.read(4, 0));
		}
		
		public function data_can_be_retrieved_from_1_2_array():void {
			array = new MultiDimentionalArray(1, 2);
			
			var firstTime:Boolean = true;
			var contents1:Object = new Object();
			var contents2:Object = new Object();
			array.fill(function():Object {
					if (firstTime) {
						firstTime = false;
						return contents1;
					}
					return contents2;
				});
			
			assertSame(contents1, array.read(0, 0));
			assertSame(contents2, array.read(0, 1));
		}
		
		public function data_can_be_retrieved_from_1_5_array():void {
			array = new MultiDimentionalArray(1, 5);
			
			var firstTime:Boolean = true;
			var contents1:Object = new Object();
			var contents2:Object = new Object();
			array.fill(function():Object {
					if (firstTime) {
						firstTime = false;
						return contents1;
					}
					return contents2;
				});
			
			assertSame(contents1, array.read(0, 0));
			assertSame(contents2, array.read(0, 1));
			assertSame(contents2, array.read(0, 2));
			assertSame(contents2, array.read(0, 3));
			assertSame(contents2, array.read(0, 4));
		}
		
		public function data_can_be_retrieved_from_5_5_array():void {
			array = new MultiDimentionalArray(5, 5);
			
			var firstTime:Boolean = true;
			var contents1:Object = new Object();
			var contents2:Object = new Object();
			array.fill(function():Object {
					if (firstTime) {
						firstTime = false;
						return contents1;
					}
					return contents2;
				});
			
			assertSame(contents1, array.read(0, 0));
			assertSame(contents2, array.read(4, 4));
		}
	}
}