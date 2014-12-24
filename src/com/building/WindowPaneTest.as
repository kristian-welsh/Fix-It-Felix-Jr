package com.building {
	import com.test.SuiteProvidingTestCase;
	import kris.test.MovieClipSpy;
	
	public class WindowPaneTest extends SuiteProvidingTestCase {
		private var graphics:MovieClipSpy;
		private var pane:WindowPane;
		
		public function WindowPaneTest(testMethod:String = null) {
			super([
				foo
				], testMethod);
		}
		
		override protected function setUp():void {
			graphics = new MovieClipSpy()
			pane = new WindowPane(graphics)
		}
		
		public function foo():void {
			pane
		}
	}
}