package com.building.window {
	import com.building.window.pane.WindowPane;
	import com.building.window.shutter.Shutter;
	import com.building.window.shutter.switcher.ShutterSwitcher;
	import com.util.random.boolean.RandomBooleanGenerator;
	import flash.display.MovieClip;
	
	public class DoubleWindow {
		private var _target:MovieClip;
		private var _broken:Boolean;
		
		private var _pane1:WindowPane;
		private var _pane2:WindowPane;
		
		private var _top_shutter:Shutter;
		private var _left_shutter:Shutter;
		private var random:RandomBooleanGenerator;
		
		private var shutterSwitcher:ShutterSwitcher;
		
		public function DoubleWindow(target:MovieClip, pane1:WindowPane, pane2:WindowPane, topShutter:Shutter, leftShutter:Shutter, random:RandomBooleanGenerator, shutterSwitcher:ShutterSwitcher = null):void {
			_target = target;
			_pane1 = pane1
			_pane2 = pane2
			_top_shutter = topShutter
			_left_shutter = leftShutter
			this.random = random;
			this.shutterSwitcher = shutterSwitcher
		}
		
		public function shutter():void {
			shutterSwitcher.execute(_target.name)
		}
		
		public function smash():void {
			smallChance() ? smashBothPanes() : smashRandomPane();
		}
		
		private function smallChance():Boolean {
			return randomBoolean() && randomBoolean();
		}
		
		private function smashBothPanes():void {
			smashPane(_pane1);
			smashPane(_pane2);
		}
		
		private function smashRandomPane():void {
			randomBoolean() ? smashPane(_pane1) : smashPane(_pane2);
		}
		
		private function smashPane(pane:WindowPane):void {
			pane.smash()
			_broken = true;
		}
		
		public function repair():void {
			bothPanesBroken() ? repairPaneAtRandom() : repairSingleBrokenPane();
		}
		
		private function bothPanesBroken():Boolean {
			return paneBroken(_pane1) && paneBroken(_pane2)
		}
		
		private function paneBroken(pane:WindowPane):Boolean {
			return pane.broken
		}
		
		private function repairPaneAtRandom():void {
			randomBoolean() ? repairPane(_pane1) : repairPane(_pane2);
		}
		
		private function randomBoolean():Boolean {
			return random.boolean()
		}
		
		private function repairSingleBrokenPane():void {
			_broken = false;
			if (paneBroken(_pane1))
				repairPane(_pane1)
			else if (paneBroken(_pane2))
				repairPane(_pane2)
		}
		
		private function repairPane(pane:WindowPane):void {
			pane.repair()
		}
		
		public function getBroken():Boolean {
			return _broken;
		}
		
		public function getTarget():MovieClip {
			return _target;
		}
		
		public function leftShutterActive():Boolean {
			return _left_shutter.active;
		}
		
		public function topShutterActive():Boolean {
			return _top_shutter.active;
		}
	
	}
}