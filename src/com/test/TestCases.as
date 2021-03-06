package com.test {
	import com.building.BuildingTest;
	import com.building.segment.BuildingSegmentTest;
	import com.building.window.DoubleWindowTest;
	import com.building.window.factory.DoubleWindowFactoryTest;
	import com.building.window.pane.WindowPaneImpTest;
	import com.building.window.shutter.ShutterImpTest;
	import com.building.window.shutter.switcher.ShutterSwitcherImpTest;
	import com.game.GameTest;
	import com.util.collections.TwoDimentionalArrayTest;
	import com.util.random.int.RandomIntGeneratorTest;
	import kris.test.TestSuiteCollector;
	
	// possibility for future API: super(GameTest, ShutterTest, etc...)
	// maybe apply strategy pattern for test methods, so each method has it's own class.
	public class TestCases extends TestSuiteCollector {
		public function TestCases() {
			super()
			includeTestsFrom(GameTest)
			includeTestsFrom(ShutterImpTest)
			includeTestsFrom(WindowPaneImpTest)
			includeTestsFrom(DoubleWindowTest)
			includeTestsFrom(DoubleWindowFactoryTest)
			includeTestsFrom(ShutterSwitcherImpTest)
			includeTestsFrom(BuildingSegmentTest)
			includeTestsFrom(RandomIntGeneratorTest)
			includeTestsFrom(BuildingTest)
			includeTestsFrom(TwoDimentionalArrayTest)
		}
	}
}