package building{
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;

	public class Building extends EventDispatcher implements IBuilding {
		private var _target:MovieClip;
		private var _segments:Array = [];
		private var _isBuilt:Boolean = false;

		public function Building(target:MovieClip):void {
			_target = target;
			_segments = createSegments(1,10);
			_isBuilt = true;
		}

		private function createSegments(num_segments:uint, num_broken_windows:uint):Array{
			var finished_array:Array = new Array(num_segments);
			for( var i:uint = 0 ; i<num_segments ; ++i ){
				var clip:MovieClip = _target.getChildByName("segment_mc_"+i) as MovieClip;
				finished_array[i] = new BuildingSegment(clip, num_broken_windows);
			}
			return finished_array;
		}

		private function testCreateSegments():Boolean{

			var segments:Array=createSegments(2,8);

			for( var i:uint = 0 ; i<2 ; ++i ){
				if ( segments[i].toString() !== "[object BuildingSegment]" ){
					return false;
				}
				if( segments[i].num_broken !== uint(8) ){
					return false;
				}
			}

			return true;
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