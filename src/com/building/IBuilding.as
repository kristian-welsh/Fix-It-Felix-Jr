package com.building {
	import flash.display.MovieClip;

	public interface IBuilding {
		function get segments():Array;
		function get target():MovieClip;
		function get isBuilt():Boolean;
	}
}