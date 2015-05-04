package com.building {
	import com.building.segment.BuildingSegment;
	import com.building.window.factory.DoubleWindowFactory;
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	
	public class Building extends EventDispatcher implements IBuilding {
		private var _target:MovieClip;
		private var _segment:BuildingSegment;
		private var windowFactory:DoubleWindowFactory;
		
		public function Building(target:MovieClip, windowFactory:DoubleWindowFactory):void {
			_target = target;
			this.windowFactory = windowFactory;
			createSegments(10);
		}
		
		private function createSegments(num_broken_windows:uint):void {
			var segmentTarget:MovieClip = _target.getChildByName("segment_mc_0") as MovieClip;
			_segment = new BuildingSegment(segmentTarget, num_broken_windows, windowFactory);
		}
		
		public function getSegment():BuildingSegment {
			return _segment;
		}
		
		public function setSegment(input:BuildingSegment):void {
			_segment = input;
		}
		
		public function get target():MovieClip {
			return _target;
		}
	}
}