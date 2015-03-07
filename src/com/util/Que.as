package com.util {
	import flash.utils.getQualifiedClassName;
	
	public class Que {
		private const OVERFLOW_ERROR:QueError = new QueError(QueError.NEXT_OVERFLOW)
		
		private var currentPosition:uint;
		private var contents:Array;
		
		public function Que(... contents) {
			// fill setContents arguments with constructor array's contents
			setContents.apply(this, contents)
		}
		
		/**
		 * Sets the contents of the Que to the passed in arguments, and returns to the start of the Que.
		 */
		public function setContents(... contents):void {
			this.contents = contents;
			currentPosition = 0;
		}
		
		public function next():* {
			rejectOverflows()
			return contents[currentPosition++];
		}
		
		private function rejectOverflows():void {
			if (willOverflow())
				throw OVERFLOW_ERROR;
		}
		
		private function willOverflow():Boolean {
			return currentPosition >= contents.length;
		}
	}
}