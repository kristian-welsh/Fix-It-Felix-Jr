package com.util.collections {
	import com.errors.TwoDimentionalArrayError;
	
	public class TwoDimentionalArray {
		private var rowLength:uint;
		private var columnLength:uint;
		private var contents:Array = [];
		
		public function TwoDimentionalArray(rowLength:uint = 0, columnLength:uint = 0):void {
			setSize(rowLength, columnLength);
		}
		
		public function setSize(rowLength:uint, columnLength:uint):void {
			this.rowLength = rowLength;
			this.columnLength = columnLength;
		}
		
		/**
		 * Fill all available slots as determined by numColumns and numRows.
		 * @param	fillSource A method that returns the correct object to fill the array with. This cannot return null.
		 */
		public function fill(fillSource:Function):void {
			detectInvalidSizeError();
			for (var i:uint = 0; i <= lastIndex(); i++)
				addElementFrom(fillSource);
		}
		
		private function addElementFrom(fillSource:Function):void {
			var result:Object = fillSource();
			detectNullElementError(result)
			contents.push(result);
		}
		
		private function lastIndex():uint {
			return flatIndexOf(rowLength - 1, columnLength - 1)
		}
		
		private function flatIndexOf(columnIndex:uint, rowIndex:uint):uint {
			return rowIndex * rowLength + columnIndex;
		}
		
		/**
		 * Reads a value from a specific place in the array.
		 * @return	Object stored at required location in array.
		 */
		public function read(columnIndex:uint, rowIndex:uint):Object {
			detectBoundryExceededError(columnIndex, rowIndex);
			detectEmptyArrayError();
			
			return contents[flatIndexOf(columnIndex, rowIndex)]
		}
		
		private function detectBoundryExceededError(columnIndex:uint, rowIndex:uint):void {
			if (columnIndex > rowLength - 1 || rowIndex > columnLength - 1)
				throw TwoDimentionalArrayError.BOUNDARY_EXCEEDED;
		}
		
		private function detectEmptyArrayError():void {
			if (contents.length == 0)
				throw TwoDimentionalArrayError.EMPTY_ARRAY;
		}
		
		private function detectInvalidSizeError():void {
			if (rowLength < 1 || columnLength < 1)
				throw TwoDimentionalArrayError.INVALID_SIZE;
		}
		
		private function detectNullElementError(element:Object):void {
			if (element === null)
				throw TwoDimentionalArrayError.NULL_ELEMENT
		}
	}
}