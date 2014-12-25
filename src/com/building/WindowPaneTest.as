package com.building {
	import com.test.SuiteProvidingTestCase;
	import com.util.FakeRandomValueGenerator;
	import kris.test.MovieClipSpy;
	
	// TODO: improve spy
	public class WindowPaneTest extends SuiteProvidingTestCase {
		private var graphics:MovieClipSpy;
		private var randomValueGenerator:FakeRandomValueGenerator;
		private var pane:WindowPane;
		
		public function WindowPaneTest(testMethod:String = null) {
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
			randomValueGenerator = new FakeRandomValueGenerator()
			pane = new WindowPane(graphics, randomValueGenerator)
		}
		
		public function initialized_correctly():void {
			assertFalse(pane.broken)
			assertGraphicChange(1, 0)
		}
		
		public function break_glass_breaks_glass():void {
			assert(!pane.broken)
			pane.breakGlass()
			assertTrue(pane.broken)
		}
		
		public function break_glass_could_show_frame_2():void {
			setRandomValue(true)
			pane.breakGlass();
			assertGraphicChange(2, 1)
		}
		
		public function break_glass_could_show_frame_3():void {
			setRandomValue(false)
			pane.breakGlass();
			assertGraphicChange(3, 1)
		}
		
		public function fix_glass_fixes_glass():void {
			pane.breakGlass()
			assert(pane.broken)
			pane.fixGlass()
			assertFalse(pane.broken)
		}
		
		public function fix_glass_shows_frame_1():void {
			pane.fixGlass()
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