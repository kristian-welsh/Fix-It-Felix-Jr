package com.building.window {
	import flash.display.MovieClip;
	
	public class FakeDoubleWindow implements DoubleWindow {
		public function FakeDoubleWindow() {
			
		}
		
		public function shutter():void {
			
		}
		
		public function smash():void {
			
		}
		
		public function repair():void {
			
		}
		
		public function getBroken():Boolean {
			return false; // not sure if correct for fake yet
		}
		
		public function getTarget():MovieClip {
			return null; // not sure if correct for fake yet
		}
		
		public function leftShutterActive():Boolean {
			return false; // not sure if correct for fake yet
		}
		
		public function topShutterActive():Boolean {
			return false; // not sure if correct for fake yet
		}
	}
}