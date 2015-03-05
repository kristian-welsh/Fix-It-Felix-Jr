package com.util {
	
	public class Que {
		private var contents:*;
		
		public function Que(... contents) {
		
		}
		
		public function setContents(... contents):void {
			this.contents = contents[0]
		}
		
		public function next():* {
			return this.contents;
		}
	}
}