package com.building.window.shutter {
	public interface Shutter {
		function open():void;
		function close():void;
		function set active(value:Boolean):void;
		function get active():Boolean;
	}

}