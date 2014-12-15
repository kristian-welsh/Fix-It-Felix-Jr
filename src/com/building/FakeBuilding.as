package com.building {
	import flash.display.MovieClip;

	public class FakeBuilding implements IBuilding {
		public function get segments():Array {
			return [];
		}

		public function get target():MovieClip {
			return new MovieClip;
		}

		public function get isBuilt():Boolean {
			return false;
		}
	}
}