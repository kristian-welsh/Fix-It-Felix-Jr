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
				break_glass_randomizes_broken_graphic_1,
				break_glass_randomizes_broken_graphic_2,
				], testMethod);
		}
		
		override protected function setUp():void {
			graphics = new MovieClipSpy()
			randomValueGenerator = new FakeRandomValueGenerator()
			pane = new WindowPane(graphics, randomValueGenerator)
		}
		
		public function initialized_correctly():void {
			assertGraphicChange(1)
		}
		
		public function break_glass_randomizes_broken_graphic_1():void {
			setRandomValue(true)
			pane.breakGlass();
			assertGraphicChange(2, 1)
		}
		
		public function break_glass_randomizes_broken_graphic_2():void {
			setRandomValue(false)
			pane.breakGlass();
			assertGraphicChange(3, 1)
		}
		
		private function setRandomValue(newValue:Boolean):void {
			randomValueGenerator.setBooleanReturnValue(newValue)
		}
		
		private function assertGraphicChange(newFrameNumber:uint, functionLogPosition:int = -1):void {
			assert(functionLogPosition >= -1);
			if (functionLogPosition == -1)
				graphics.spy.assertLogged(graphics.gotoAndStop, [newFrameNumber])
			else
				graphics.spy.assertLoggedAtPosition(functionLogPosition, graphics.gotoAndStop, [newFrameNumber])
		}
	}
}