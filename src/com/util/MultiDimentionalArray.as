package com.util {
	
	public class MultiDimentionalArray {
		private var numColumns:uint;
		private var numRows:uint;
		
		public function MultiDimentionalArray(numColumns:uint = 0, numRows:uint = 0):void {
			setSize(numColumns, numRows);
		}
		
		public function setSize(numColumns:uint, numRows:uint):void {
			this.numColumns = numColumns;
			this.numRows = numRows;
		}
		
		public function getNumColumns():uint {
			return numColumns;
		}
		
		public function getNumRows():uint {
			return numRows;
		}
	}
}