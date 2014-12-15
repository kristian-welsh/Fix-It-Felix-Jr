package com.building {
	import flash.display.MovieClip;

	public class BuildingSegment {
		public var _target:MovieClip;
		public var _num_broken:uint;
		public var _num_shutters:uint;
		public var _windows:Array = [];

		public function BuildingSegment(target:MovieClip, dificulty:uint):void {

			_target = target;
			_num_broken = dificulty;
			_num_shutters = Math.ceil(dificulty/4);
			_windows = createWindows(15,_num_broken,_num_shutters);
			//trace(testCreateWindows());
			//trace(testCreateRandomBoundedInts());
		}

		private function createWindows(num_windows:uint, num_broken_windows:uint, num_shuttered_windows:uint):Array {
			var finished_array:Array = new Array(num_windows);
			var windows_to_break:Array = createNonRepeatedRandomBoundedInts(num_broken_windows,0,14);
			var windows_to_shutter:Array = createNonRepeatedRandomBoundedInts(num_shuttered_windows,0,14);
			var clip:MovieClip;

			for( var i:uint = 0 ; i < num_windows ; ++i ){
				if(i<10){
					clip = _target.getChildByName("window_0"+i) as MovieClip;
				} else {
					clip = _target.getChildByName("window_"+i) as MovieClip;
				}
				finished_array[i] = new DoubleWindow(clip);
				if(windows_to_break.indexOf(i)!=-1){
					finished_array[i].breakWindow();
				}
				if(windows_to_shutter.indexOf(i)!=-1){
					finished_array[i].shutterWindow();
				}
			}

			return finished_array;
		}

		private function testCreateWindows():Boolean {

			var windows:Array = createWindows(15,8,2);
			var num_broken:uint = 0;

			for( var i:uint = 0 ; i<15 ; ++i ){
				if ( windows[i].toString() !== "[object DoubleWindow]" )
					return false;

				if( windows[i].broken === true )
					num_broken++;
			}

			if(num_broken != 8)
				return false

			return Boolean(windows.length==i);
		}

		private function createRandomBoundedInts(num:uint, lowest:int, highest:int):Array {
			// returns a an array with length=[num] filled with integers which are randomly dispursed between the [lowest] and [highest]
			var return_me:Array=[];
			var temp_rand:int;
			while(return_me.length<num) {
				temp_rand = createRandomBoundedInt(lowest, highest);
				return_me.push(temp_rand);
			}
			return return_me;
		}

		private function createNonRepeatedRandomBoundedInts(num:uint, lowest:int, highest:int):Array {
			// returns a an array with length=[num] filled with integers which are randomly dispursed between the [lowest] and [highest]
			var return_me:Array=[];
			var temp_rand:int;
			while(return_me.length<num) {
				temp_rand = createRandomBoundedInt(lowest, highest);
				if(return_me.indexOf(temp_rand)==-1){
					return_me.push(temp_rand);
				}
			}
			return return_me;
		}

		private function createRandomBoundedInt(lowest:int, highest:int):int {
			return Math.round((Math.random()*(highest-lowest))+lowest);
		}

		private function testCreateRandomBoundedInts():Boolean {
			var rand0:Array = [10,20,30];
			var rand1:Array = [10,-50,50];
			var rand2:Array = [1,0,1];
			var rand3:Array = [1,0,0];
			var rand4:Array = [15,0,14];
			var rand5:Array = [100,0,50];
			var rand6:Array = [1000,0,0];
			var rand7:Array = [10,1,10];
			var rand8:Array = [0,0,0];
			var rand9:Array = [0,-1,5];
			var rands:Array = [rand0,rand1,rand2,rand3,rand4,rand5,rand6,rand7,rand8,rand9];
			var products:Array = new Array(10);

			for( var i : uint = 0 ; i < products.length ; ++i ) {
				products[i] = createRandomBoundedInts(rands[i][0],rands[i][1],rands[i][2]);
				/*//decomment to actively debug this function
				trace(rands[i]);
				trace(products[i]);
				trace();*/
			}

			for( i = 0 ; i < products.length ; ++i ) {
				if( products[i].length != rands[i][0] ){
					return false;
				}
				for( var j :uint = 0 ; j < products[i].length ; ++j ) {
					if(rands[i][1] > products[i][j]){
						return false;
					}
					if(products[i][j] > rands[i][2]){
						return false;
					}
				}
			}
			return true;
		}

		public function checkSegmentCleared():Boolean {
			for( var i:uint = 0 ; i < _windows.length ; ++i ){
				if(_windows[i].broken){
					return false;
				}
			}
			return true;
		}

		public function getWindowAt(_XX:uint=0, _YY:uint=0):DoubleWindow{
			return _windows[_XX+_YY*5];
		}

		public function get num_broken ():uint {
			return _num_broken;
		}

		public function get windows():Array {
			return _windows;
		}

		public function get target ():MovieClip {
			return _target;
		}

		public function replicate(TO_REP:BuildingSegment):void {
			_windows = TO_REP.windows;
		}
	}
}