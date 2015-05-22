package com.util {
	
	public class MultiDimentionalArray {
		private var numColumns:uint;
		private var numRows:uint;
		private var contents:Array = [];
		
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
		
		public function fill(fillSource:Function):void {
			for (var i:uint = 0; i < numRows; i++)
				for (var j:uint = 0; j < numColumns; j++)
					contents.push(fillSource());
		}
		
		public function read(columnIndex:uint, rowIndex:uint):Object {
			if (contents.length == 0)
				throw new MultiDimentionalArrayError();
			
			// add one to indeces to ensure correct position calculation (without zero-ing)
			return contents[((columnIndex + 1) * (rowIndex + 1)) - 1]
		}
	}
}