package com.building {
	import com.building.window.factory.DoubleWindowFactoryImp;
	import com.building.window.FakeDoubleWindowMovieClip;
	import flash.display.MovieClip;
	import kris.test.SuiteProvidingTestCase;
	
	public class BuildingSegmentTest extends SuiteProvidingTestCase {
		private const REQUIRED_WINDOW_NAMES:Array = ["window_00", "window_01", "window_02", "window_03", "window_04", "window_05", "window_06",
			"window_07", "window_08", "window_09", "window_10", "window_11", "window_12", "window_13", "window_14", "window_15"];
		
		private var target:MovieClip;
		private var difficulty:uint;
		private var segment:BuildingSegment;
		
		public function BuildingSegmentTest(testMethod:String = null) {
			super([foo], testMethod);
		}
		
		override protected function setUp():void {
			target = createTarget()
			difficulty = 8; // Found i'm using this value in Game.as, so test this first.
			segment = new BuildingSegment(target, difficulty, new DoubleWindowFactoryImp())
		}
		
		private function createTarget():MovieClip {
			var target:MovieClip = new MovieClip()
			addNamedWindowsTo(target)
			return target
		}
		
		private function addNamedWindowsTo(view:MovieClip):void {
			for each (var name:String in REQUIRED_WINDOW_NAMES)
				view.addChild(createNamedWindowView(name))
		}
		
		private function createNamedWindowView(name:String):MovieClip {
			var returnMe:FakeDoubleWindowMovieClip = new FakeDoubleWindowMovieClip()
			returnMe.name = name
			return returnMe
		}
		
		public function foo():void {
		
		}
	}
}