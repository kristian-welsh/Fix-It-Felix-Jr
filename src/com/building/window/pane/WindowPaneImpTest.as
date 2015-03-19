package com.building.window.pane {
	import com.util.random.boolean.fake.SetFakeRandomBooleanGenerator;
	import kris.test.MovieClipSpy;
	import kris.test.SuiteProvidingTestCase;
	
	// TODO: make spy more flexible, add more assertions, add the ability to string log properties together eg: view.spy.logged(function).times(2).withArgs([false, true])
	public class WindowPaneImpTest extends SuiteProvidingTestCase {
		private var graphics:MovieClipSpy;
		private var randomValueGenerator:SetFakeRandomBooleanGenerator;
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
			randomValueGenerator = new SetFakeRandomBooleanGenerator()
			pane = new WindowPaneImp(graphics, randomValueGenerator)
		}
		
		public function initialized_correctly():void {
			assertFalse(pane.broken)
			assertGraphicChange(1, 0)
		}
		
		public function break_glass_breaks_glass():void {
			assert(!pane.broken)
			pane.smash()
			assertTrue(pane.broken)
		}
		
		public function break_glass_could_show_frame_2():void {
			setRandomValue(true)
			pane.smash();
			assertGraphicChange(2, 1)
		}
		
		public function break_glass_could_show_frame_3():void {
			setRandomValue(false)
			pane.smash();
			assertGraphicChange(3, 1)
		}
		
		public function fix_glass_fixes_glass():void {
			pane.smash()
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