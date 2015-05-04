package com.building {
	import com.building.segment.BuildingSegment;
	import flash.display.MovieClip;

	public class FakeBuilding implements IBuilding {
		public function get target():MovieClip {
			return new MovieClip;
		}
		
		public function getSegment():BuildingSegment {
			return null;
		}
		
		public function setSegment(value:BuildingSegment):void {
			
		}
	}
}