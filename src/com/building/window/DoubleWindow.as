﻿package com.building.window {
	import com.building.window.pane.WindowPane;
	import com.building.window.shutter.Shutter;
	import com.util.RandomValueGenerator;
	import flash.display.MovieClip;
	
	public class DoubleWindow {
		private var _target:MovieClip;
		private var _broken:Boolean;
		
		private var _pane1:WindowPane;
		private var _pane2:WindowPane;
		
		private var _top_shutter:Shutter;
		private var _left_shutter:Shutter;
		private var random:RandomValueGenerator;
		
		public function DoubleWindow(target:MovieClip, pane1:WindowPane, pane2:WindowPane, topShutter:Shutter, leftShutter:Shutter, random:RandomValueGenerator):void {
			_target = target;
			_pane1 = pane1
			_pane2 = pane2
			_top_shutter = topShutter
			_left_shutter = leftShutter
			this.random = random;
		}
		
		// TODO: extract class that decided how the window should be shuttered, and replace this function with shutterTop(), and shutterBottom()
		// TODO: rename to shutter
		public function shutterWindow():void {
			//breaks random combos of  panes on broken windows
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
			
			if (randomBoolean()) {
				_top_shutter.active = true;
			} else {
				_left_shutter.active = true;
			}
		}
		
		// TODO: rename to break
		public function breakWindow():void {
			// breaks random combos of panes on broken windows
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
		
		/**
		 * @deprecated Please use repair instead.
		 */
		public function fixWindow():void {
			repair()
		}
		
		public function repair():void {
			if (_pane1.broken && _pane2.broken)
				repairPaneAtRandom()
			else
				repairSingleBrokenPane()
		}
		
		private function repairPaneAtRandom():void {
			if (randomBoolean())
				_pane1.repair()
			else
				_pane2.repair()
		}
		
		private function repairSingleBrokenPane():void {
			_broken = false;
			if (_pane1.broken)
				_pane1.repair()
			else if (_pane2.broken)
				_pane2.repair()
		}
		
		private function randomBoolean():Boolean {
			return random.boolean()
		}
		
		// TODO: rename to getBroken()s
		public function get broken():Boolean {
			return _broken;
		}
		
		// TODO: rename to getTarget()
		public function get target():MovieClip {
			return _target;
		}
		
		//rename to leftShutterOpen
		public function leftShutterExists():Boolean {
			return _left_shutter.active;
		}
		
		//rename to topShutterOpen
		public function topShutterExists():Boolean {
			return _top_shutter.active;
		}
	
	}
}