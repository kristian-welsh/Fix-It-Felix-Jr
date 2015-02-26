package com.building.window {
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
		
		private var shutterSwitcher:ShutterSwitcher;
		
		public function DoubleWindow(target:MovieClip, pane1:WindowPane, pane2:WindowPane, topShutter:Shutter, leftShutter:Shutter, random:RandomValueGenerator, shutterSwitcher:ShutterSwitcher = null):void {
			_target = target;
			_pane1 = pane1
			_pane2 = pane2
			_top_shutter = topShutter
			_left_shutter = leftShutter
			this.random = random;
			this.shutterSwitcher = shutterSwitcher
		}
		
		/**
		 * @deprecated Please use shutter() instead.
		 */
		public function shutterWindow():void {
			shutter()
		}
		
		public function shutter():void {
			shutterSwitcher.execute(_target.name)
		}
		
		/**
		 * @deprecated Please use shatter() instead.
		 */
		public function breakWindow():void {
			shatter()
		}
		
		public function shatter():void {
			couldShatterBoth() ? maybeShatterBoth() : shatterPane(_pane2);
			_broken = true;
		}
		
		private function couldShatterBoth():Boolean {
			return randomBoolean()
		}
		
		private function maybeShatterBoth():void {
			shatterPane(_pane1);
			mightShatterPane2();
		}
		
		private function mightShatterPane2():void {
			if (randomBoolean())
				shatterPane(_pane2);
		}
		
		private function shatterPane(pane:WindowPane):void {
			pane.shatter()
		}
		
		public function repair():void {
			bothPanesBroken() ? repairPaneAtRandom() : repairSingleBrokenPane();
		}
		
		private function bothPanesBroken():Boolean {
			return brokenPane(_pane1) && brokenPane(_pane2)
		}
		
		private function brokenPane(pane:WindowPane):Boolean {
			return pane.broken
		}
		
		private function repairPaneAtRandom():void {
			shouldRepairPane1() ? repairPane(_pane1) : repairPane(_pane2);
		}
		
		private function shouldRepairPane1():Boolean {
			return randomBoolean()
		}
		
		private function repairSingleBrokenPane():void {
			_broken = false;
			if (brokenPane(_pane1))
				repairPane(_pane1)
			else if (brokenPane(_pane2))
				repairPane(_pane2)
		}
		
		private function repairPane(pane:WindowPane):void {
			pane.repair()
		}
		
		private function randomBoolean():Boolean {
			return random.boolean()
		}
		
		// TODO: rename to getBroken()
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