package com.building.window.pane {
	import com.util.FakeRandomBooleanGenerator;
	import kris.test.MovieClipSpy;
	import kris.test.SuiteProvidingTestCase;
	
	// TODO: improve spy
	public class WindowPaneImpTest extends SuiteProvidingTestCase {
		private var graphics:MovieClipSpy;
		private var randomValueGenerator:FakeRandomBooleanGenerator;
		private var pane:WindowPaneImp;
		
		public function WindowPaneImpTest(testMethod:String = null) {
			super([
				initialized_correctly,
				break_glass_breaks_glass,
				break_glass_could_show_frame_2,
				break_glass_could_show_frame_3,
				fix_glass_fixes_glass,
				fix_glass_shows_frame_1
				], testMethod);
		}
		
		override protected function setUp():void {
			graphics = new MovieClipSpy()
			randomValueGenerator = new FakeRandomBooleanGenerator()
			pane = new WindowPaneImp(graphics, randomValueGenerator)
		}
		
		public function initialized_correctly():void {
			assertFalse(pane.broken)
			assertGraphicChange(1, 0)
		}
		
		public function break_glass_breaks_glass():void {
			assert(!pane.broken)
			pane.shatter()
			assertTrue(pane.broken)
		}
		
		public function break_glass_could_show_frame_2():void {
			setRandomValue(true)
			pane.shatter();
			assertGraphicChange(2, 1)
		}
		
		public function break_glass_could_show_frame_3():void {
			setRandomValue(false)
			pane.shatter();
			assertGraphicChange(3, 1)
		}
		
		public function fix_glass_fixes_glass():void {
			pane.shatter()
			assert(pane.broken)
			pane.repair()
			assertFalse(pane.broken)
		}
		
		public function fix_glass_shows_frame_1():void {
			pane.repair()
			assertGraphicChange(1, 1)
		}
		
		private function setRandomValue(newValue:Boolean):void {
			randomValueGenerator.setBooleanReturnValue(newValue)
		}
		
		private function assertGraphicChange(newFrameNumber:uint, functionLogPosition:uint):void {
			graphics.spy.assertLoggedAtPosition(functionLogPosition, graphics.gotoAndStop, [newFrameNumber])
		}
	}
}