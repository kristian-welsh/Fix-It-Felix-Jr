package com.util {
	
	public class QueError extends Error {
		static public const NEXT_OVERFLOW:String = "Que::next has been called but it has reached the end of the collection.";
		
		public function QueError(message:* = "", id:* = 0) {
			super(message, id);
			name = "QueError"
		}
	}
}