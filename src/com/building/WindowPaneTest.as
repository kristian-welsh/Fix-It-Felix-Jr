package com.building {
	import com.test.SuiteProvidingTestCase;
	import com.util.FakeRandomValueGenerator;
	import kris.test.MovieClipSpy;
	
	public class WindowPaneTest extends SuiteProvidingTestCase {
		private var graphics:MovieClipSpy;
		private var pane:WindowPane;
		
		public function WindowPaneTest(testMethod:String = null) {
			super([
				initialized_correctly
				], testMethod);
		}
		
		override protected function setUp():void {
			graphics = new MovieClipSpy()
			pane = new WindowPane(graphics, new FakeRandomValueGenerator())
		}
		
		public function initialized_correctly():void {
			graphics.spy.assertLogged(graphics.gotoAndStop, [1])
		}
	}
}