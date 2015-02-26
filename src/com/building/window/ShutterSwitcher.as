package com.building.window {
	import com.building.window.shutter.Shutter;
	import com.util.RandomValueGenerator;
	
	public class ShutterSwitcher {
		private var topShutter:Shutter;
		private var leftShutter:Shutter;
		private var random:RandomValueGenerator;
		
		private var nameFunctionMap:Object = {
			"default":shutterRandomly,
			"window_00":shutterBoth,
			"window_01":shutterLeft,
			"window_02":shutterLeft,
			"window_03":shutterLeft,
			"window_04":shutterLeft,
			"window_05":shutterTop,
			"window_10":shutterTop,
			"window_15":function():void { }
		}
		
		// TODO: extract ShutterPair class to contain shutter opperations
		public function ShutterSwitcher(topShutter:Shutter, leftShutter:Shutter, random:RandomValueGenerator) {
			this.topShutter = topShutter;
			this.leftShutter = leftShutter;
			this.random = random;
		}
		
		public function execute(windowName:String):void {
			findFunction(windowName).call()
		}
		
		private function findFunction(windowName:String):Function {
			return nameFunctionMap[windowName] || nameFunctionMap["default"];
		}
		
		private function shutterRandomly():void {
			random.boolean() ? shutterTop() : shutterLeft();
		}
		
		private function shutterBoth():void {
			shutterTop();
			shutterLeft();
		}
		
		private function shutterLeft():void {
			leftShutter.active = true;
		}
		
		private function shutterTop():void {
			topShutter.active = true;
		}
	}
}