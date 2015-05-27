package com.util {
	import kris.test.SuiteProvidingTestCase;
	
	public class TwoDimentionalArrayTest extends SuiteProvidingTestCase {
		private var firstTime:Boolean = true;
		private var contents1:Object;
		private var contents2:Object;
		
		public function TwoDimentionalArrayTest(testMethod:String = null) {
			super([
				invalid_read_throws_error,
				data_retrieveable_from_setSize_constructed_array,
				data_retrieveable_from_minimum_size_array,
				data_retrieveable_from_arbritrary_size_array
				], testMethod);
		}
		
		override protected function setUp():void {
			contents1 = new Object();
			contents2 = new Object();
		}
		
		public function invalid_read_throws_error():void {
			var array:TwoDimentionalArray = new TwoDimentionalArray(1, 1);
			
			assertThrows(TwoDimentionalArrayError, function():void {
					array.read(0, 0);
				});
		}
		
		public function data_retrieveable_from_setSize_constructed_array():void {
			dataRetrieveableFrom(1, 1, setSizeFactory);
		}
		
		public function data_retrieveable_from_minimum_size_array():void {
			dataRetrieveableFrom(1, 1);
		}
		
		public function data_retrieveable_from_arbritrary_size_array():void {
			dataRetrieveableFrom(36, 9);
		}
		
		private function dataRetrieveableFrom(rowLength:uint, columnLength:uint, factoryMethod:Function = null):void {
			factoryMethod = factoryMethod || constructorFactory;
			var array:TwoDimentionalArray = factoryMethod(rowLength, columnLength);
			
			array.fill(fillingFunction);
			for (var row:uint = 0; row < columnLength; row++)
				for (var column:uint = 0; column < rowLength; column++)
					assertSame(contentsToExpect(column, row), array.read(column, row));
		}
		
		private function fillingFunction():Object {
			if (firstTime) {
				firstTime = false;
				return contents1;
			}
			return contents2;
		}
		
		private function contentsToExpect(i:uint, j:uint):Object {
			return (i == 0 && j == 0) ? contents1 : contents2;
		}
		
		private function constructorFactory(rowLength:uint, columnLength:uint):TwoDimentionalArray {
			return new TwoDimentionalArray(rowLength, columnLength);
		}
		
		private function setSizeFactory(rowLength:uint, columnLength:uint):TwoDimentionalArray {
			var result:TwoDimentionalArray = new TwoDimentionalArray();
			result.setSize(rowLength, columnLength);
			return result;
		}
	}
}