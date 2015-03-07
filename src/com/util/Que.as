package com.util {
	import flash.utils.getQualifiedClassName;
	
	public class Que {
		private var currentPosition:uint = 0
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
		}
		
		public function next():* {
			if (currentPosition >= contents.length)
				throw new QueError(QueError.NEXT_OVERFLOW)
			return contents[currentPosition++];
		}
	}
}