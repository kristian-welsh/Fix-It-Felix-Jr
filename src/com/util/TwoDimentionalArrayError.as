package com.util {
	
	public class TwoDimentionalArrayError extends Error {
		public function TwoDimentionalArrayError(message:* = "") {
			super(message);
			name = "MultiDimentionalArrayError";
		}
	}
}