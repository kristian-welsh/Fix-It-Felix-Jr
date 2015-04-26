package com.building.segment {
	public class BuildingSegmentError extends Error {
		static public const WINDOW_ARRAY_DIMENSIONS_EXCEEDED:String = "You have exceeded the dimensions of the window format. The limits are x:0-4, y:0-2";
		
		public function BuildingSegmentError(message:*="") {
			super(message, 0);
		}
	}
}