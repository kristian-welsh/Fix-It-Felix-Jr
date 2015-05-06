package com.building {
	import com.building.window.factory.DoubleWindowFactorySpy;
	import flash.display.MovieClip;
	import kris.test.SuiteProvidingTestCase;
	
	public class BuildingTest extends SuiteProvidingTestCase {
		private var target:MovieClip;
		private var segmentTarget:MovieClip;
		private var factory:DoubleWindowFactorySpy;
		private var building:Building;
		
		public function BuildingTest(testMethod:String = null) {
			super([
				constructor_sets_target,
				constructor_creates_segments_correctly
				], testMethod);
		}
		
		override protected function setUp():void {
			target = new MovieClip()
			addSegmentToTarget()
			factory = new DoubleWindowFactorySpy(true)
			building = new Building(target, factory)
		}
		
		private function addSegmentToTarget():void {
			segmentTarget = new MovieClip()
			segmentTarget.name = "segment_mc_0"
			target.addChild(segmentTarget)
		}
		
		public function constructor_sets_target():void {
			assertEquals(target, building.target)
		}
		
		public function constructor_creates_segments_correctly():void {
			assertTargetFound()
			assertTenWindowsBroken()
			assertfactoryPassed()
		}
		
		private function assertTargetFound():void {
			assertEquals(segmentTarget, building.getSegment().target)
		}
		
		private function assertTenWindowsBroken():void {
			assertEquals(8, building.getSegment().num_broken)
		}
		
		private function assertfactoryPassed():void {
			factory.spy.assertLogged(factory.create)
		}
	}
}