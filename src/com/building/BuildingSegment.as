﻿package com.building {
	import com.building.window.DoubleWindow;
	import com.building.window.factory.DoubleWindowFactory;
	import com.util.random.int.*;
	import flash.display.MovieClip;
	
	public class BuildingSegment {
		private var windowFactory:DoubleWindowFactory;
		private var random:RandomIntGenerator = new RandomIntGeneratorImp()
		
		public var _target:MovieClip;
		public var _num_broken:uint;
		public var _num_shutters:uint;
		public var _windows:Array = new Array(15);
		
		public function BuildingSegment(target:MovieClip, dificulty:uint, windowFactory:DoubleWindowFactory, random:RandomIntGenerator = null):void {
			this.windowFactory = windowFactory;
			this.random = random || new RandomIntGeneratorImp();
			
			_target = target;
			_num_broken = dificulty;
			_num_shutters = Math.ceil(dificulty / 4);
			createWindows();
			smashAppropriateWindows(_num_broken);
			shutterAppropriateWindows(_num_shutters);
		}
		
		private function createWindows():void {
			for (var i:uint = 0; i < _windows.length; ++i)
				_windows[i] = windowFactory.create(findWindowsView(i));
		}
		
		private function findWindowsView(i:uint):MovieClip {
			return _target.getChildByName("window_" + i) as MovieClip;
		}
		
		private function smashAppropriateWindows(numSmashed:uint):void {
			var indexesToSmash:Array = random.nonRepeatedBoundedInts(numSmashed, 0, 14);
			for each (var index:uint in indexesToSmash)
				_windows[index].smash()
		}
		
		private function shutterAppropriateWindows(numShuttered:uint):void {
			var indexesToShutter:Array = random.nonRepeatedBoundedInts(numShuttered, 0, 14);
			for each (var index:uint in indexesToShutter)
				_windows[index].shutter()
		}
		
		public function checkSegmentCleared():Boolean {
			for (var i:uint = 0; i < _windows.length; ++i) {
				if (_windows[i].getBroken()) {
					return false;
				}
			}
			return true;
		}
		
		public function getWindowAt(_XX:uint = 0, _YY:uint = 0):DoubleWindow {
			if (_XX > 4 || _YY > 2)
				throw new ArgumentError("Limit for x is 4, limit for y is 2")
			return _windows[_YY * 5 + _XX];
		}
		
		public function get num_broken():uint {
			return _num_broken;
		}
		
		public function get windows():Array {
			return _windows;
		}
		
		public function get target():MovieClip {
			return _target;
		}
	}
}