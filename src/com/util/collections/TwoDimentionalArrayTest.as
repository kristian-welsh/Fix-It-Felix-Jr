package com.util.collections {
	import com.errors.TwoDimentionalArrayError;
	import kris.test.SuiteProvidingTestCase;
	
	public class TwoDimentionalArrayTest extends SuiteProvidingTestCase {
		private var contents:Array = [];
		
		public function TwoDimentionalArrayTest(testMethod:String = null) {
			super([
				filling_before_setting_dimentions_throws_error,
				filling_with_null_throws_error,
				reading_before_filling_throws_error,
				reading_from_outside_of_size_throws_error,
				data_retrieveable_from_setSize_constructed_array,
				data_retrieveable_from_minimum_size_array,
				data_retrieveable_from_arbritrary_size_array
				], testMethod);
		}
		
		public function filling_before_setting_dimentions_throws_error():void {
			var array:TwoDimentionalArray = new TwoDimentionalArray();
			
			assertThrows(TwoDimentionalArrayError, function():void {
					fill(array);
				});
		}
		
		public function filling_with_null_throws_error():void {
			var array:TwoDimentionalArray = new TwoDimentionalArray();
			
			assertThrows(TwoDimentionalArrayError, function():void {
					array.fill(function():Object {
							return null; } );
				});
		}
		
		public function reading_before_filling_throws_error():void {
			var array:TwoDimentionalArray = new TwoDimentionalArray(1, 1);
			
			assertThrows(TwoDimentionalArrayError, function():void {
					array.read(0, 0);
				});
		}
		
		public function reading_from_outside_of_size_throws_error():void {
			var array:TwoDimentionalArray = new TwoDimentionalArray(1, 1);
			fill(array);
			
			assertThrows(TwoDimentionalArrayError, function():void {
					array.read(1, 0);
				});
			assertThrows(TwoDimentionalArrayError, function():void {
					array.read(0, 1);
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
			array.fill(fillFunction);
		}
		
		private function fillFunction():Object {
			var content:Object = new Object();
			contents.push(content);
			return content;
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