package com.building {
	import com.building.window.factory.DoubleWindowFactorySpy;
	import flash.display.MovieClip;
	import kris.test.SuiteProvidingTestCase;
	
	public class BuildingTest extends SuiteProvidingTestCase {
		private var target:MovieClip;
		private var building:Building;
		
		public function BuildingTest(testMethod:String = null) {
			super([
				constructor_sets_simple_variables
				], testMethod);
		}
		
		override protected function setUp():void {
			target = new MovieClip()
			addSegmentToTarget()
			building = new Building(target, new DoubleWindowFactorySpy(true))
		}
		
		private function addSegmentToTarget():void {
			var segmentChild:MovieClip = new MovieClip()
			segmentChild.name = "segment_mc_0"
			target.addChild(segmentChild)
		}
		
		public function constructor_sets_simple_variables():void {
			assertTrue(building.isBuilt)
			assertEquals(target, building.target)
		}
	}
}