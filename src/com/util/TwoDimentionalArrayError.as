package com.util {
	public class TwoDimentionalArrayError extends Error {
		static public const BOUNDARY_EXCEEDED:TwoDimentionalArrayError = new TwoDimentionalArrayError("Read is outside of array's size.");
		static public const EMPTY_ARRAY:TwoDimentionalArrayError = new TwoDimentionalArrayError("Array has not been filled.");
		static public const INVALID_SIZE:TwoDimentionalArrayError = new TwoDimentionalArrayError("Size must be at least 1x1.");
		static public const NULL_ELEMENT:TwoDimentionalArrayError = new TwoDimentionalArrayError("fillSource cannot return null at any point.");
		
		public function TwoDimentionalArrayError(message:* = "") {
			super(message);
			name = "MultiDimentionalArrayError";
		}
	}
}