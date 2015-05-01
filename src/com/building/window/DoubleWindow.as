package com.building.window {
	import flash.display.MovieClip;
	
	public interface DoubleWindow {
		function shutter():void;
		function smash():void;
		function repair():void;
		function getBroken():Boolean;
		function getTarget():MovieClip;
		function leftShutterActive():Boolean;
		function topShutterActive():Boolean;
	}
}