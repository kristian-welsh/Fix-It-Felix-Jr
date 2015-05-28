package com.util {
	import kris.test.*;
	import org.flashdevelop.utils.*;
	
	public class TwoDimentionalArrayTest extends SuiteProvidingTestCase {
		private var contents:Array = [];
		
		public function TwoDimentionalArrayTest(testMethod:String = null) {
			super([
				invalid_read_throws_error,
				data_retrieveable_from_setSize_constructed_array,
				data_retrieveable_from_minimum_size_array,
				data_retrieveable_from_arbritrary_size_array
				], testMethod);
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
			
			fill(array);
			validateContents(array, rowLength, columnLength);
		}
		
		private function fill(array:TwoDimentionalArray):void {
			array.fill(function():Object {
					var content:Object = new Object();
					contents.push(content);
					return content;
				});
		}
		
		private function validateContents(array:TwoDimentionalArray, rowLength:uint, columnLength:uint):void {
			var localIndex:uint = 0;
			for (var row:uint = 0; row < columnLength; row++)
				for (var column:uint = 0; column < rowLength; column++, localIndex++)
					assertCorrectRead(contents[localIndex], array.read(column, row));
		}
		
		private function assertCorrectRead(local:Object, read:Object):void {
			assertSame(local, read);
			assertNotNull(read);
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