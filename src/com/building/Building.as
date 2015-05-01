package com.building {
	import com.building.segment.BuildingSegment;
	import com.building.window.factory.DoubleWindowFactory;
	import com.building.window.factory.DoubleWindowFactoryImp;
	import com.building.window.factory.DoubleWindowFactorySpy;
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;

	public class Building extends EventDispatcher implements IBuilding {
		private var _target:MovieClip;
		private var _segments:Array = [];
		private var _isBuilt:Boolean = false;
		private var windowFactory:DoubleWindowFactory;

		public function Building(target:MovieClip, windowFactory:DoubleWindowFactory):void {
			_target = target;
			this.windowFactory = windowFactory;
			
			_segments = createSegments(1,10);
			_isBuilt = true;
		}

		private function createSegments(num_segments:uint, num_broken_windows:uint):Array{
			var finished_array:Array = new Array(num_segments);
			for( var i:uint = 0 ; i<num_segments ; ++i ){
				var clip:MovieClip = _target.getChildByName("segment_mc_"+i) as MovieClip;
				finished_array[i] = new BuildingSegment(clip, num_broken_windows, windowFactory);
			}
			return finished_array;
		}

		public function get segments():Array {
			return _segments;
		}

		public function get target ():MovieClip {
			return _target;
		}

		public function get isBuilt():Boolean {
			return _isBuilt;
		}
	}
}