package com.util {
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
		
		public function getRowLength():uint {
			return rowLength;
		}
		
		public function getColumnLength():uint {
			return columnLength;
		}
		
		/**
		 * Fill all available slots as determined by numColumns and numRows.
		 * @param	fillSource A method that returns the correct object to fill the array with.
		 */
		public function fill(fillSource:Function):void {
			for (var i:uint = 0; i <= flatIndexOf(rowLength - 1, columnLength - 1); i++)
				contents.push(fillSource());
		}
		
		/**
		 * Reads a value from a specific place in the array.
		 * @return	Object stored at required location in array.
		 * @throws	MultiDimentionalArrayError
		 */
		public function read(columnIndex:uint, rowIndex:uint):Object {
			detectReadErrors();
			return contents[flatIndexOf(columnIndex, rowIndex)]
		}
		
		private function detectReadErrors():void {
			if (contents.length == 0)
				throw new TwoDimentionalArrayError("Array has not been filled");
		}
		
		private function flatIndexOf(columnIndex:uint, rowIndex:uint):uint {
			return rowIndex * rowLength + columnIndex;
		}
	}
}