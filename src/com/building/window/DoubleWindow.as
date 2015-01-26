package com.building.window {
	import com.building.window.pane.WindowPane;
	import com.building.window.shutter.Shutter;
	import com.util.RandomValueGeneratorImp;
	import flash.display.MovieClip;
	
	public class DoubleWindow {
		private var _target:MovieClip;
		private var _broken:Boolean;
		
		private var _pane1:WindowPane;
		private var _pane2:WindowPane;
		
		private var _top_shutter:Shutter;
		private var _left_shutter:Shutter;
		
		public function DoubleWindow(target:MovieClip):void {
			_target = target;
			
			_pane1 = new WindowPane(_target.pane_mc_1, new RandomValueGeneratorImp());
			_pane2 = new WindowPane(_target.pane_mc_2, new RandomValueGeneratorImp());
			
			_top_shutter = new Shutter(_target.top_shutter);
			_left_shutter = new Shutter(_target.left_shutter);
		
		}
		
		public function shutterWindow():void {
			//breaks random combos of  panes on broken windows
			var randomness:Boolean = randomBoolean()
			switch (_target.name) {
				case "window_00":
					_top_shutter.active = true;
					_left_shutter.active = true;
					return;
				case "window_01":
				case "window_02":
				case "window_03":
				case "window_04":
					_left_shutter.active = true;
					return;
				case "window_05":
				case "window_10":
					_top_shutter.active = true;
					return;
				case "window_15":
					return;
			}
			
			if (randomness) {
				_top_shutter.active = true;
			} else {
				_left_shutter.active = true;
			}
		}
		
		public function breakWindow():void {
			//breaks random combos of  panes on broken windows
			
			_broken = true;
			if (randomBoolean()) {
				_pane1.shatter();
				if (randomBoolean()) {
					_pane2.shatter();
				}
			} else {
				_pane2.shatter();
			}
		}
		
		public function fixWindow():void {
			//breaks random combos of  panes on broken windows
			if (_pane1.broken && _pane2.broken) {
				if (randomBoolean()) {
					_pane1.repair()
				} else {
					_pane2.repair()
				}
			} else if (_pane1.broken && !_pane2.broken) {
				_pane1.repair()
			} else if (!_pane1.broken && _pane2.broken) {
				_pane2.repair()
			}
			if (!_pane1.broken && !_pane2.broken) {
				_broken = false;
			}
		}
		
		private function randomBoolean():Boolean {
			return Boolean(Math.random() > 0.5);
		}
		
		public function get broken():Boolean {
			return _broken;
		}
		
		public function get target():MovieClip {
			return _target;
		}
		
		public function leftShutterExists():Boolean {
			return _left_shutter.active;
		}
		
		public function topShutterExists():Boolean {
			return _top_shutter.active;
		}
	
	}
}