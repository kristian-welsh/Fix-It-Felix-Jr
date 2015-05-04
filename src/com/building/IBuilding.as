package com.building {
	import com.building.segment.BuildingSegment;
	import flash.display.MovieClip;

	public interface IBuilding {
		function getSegment():BuildingSegment;
		function setSegment(input:BuildingSegment):void;
		function get target():MovieClip;
	}
}