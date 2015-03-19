package com.test {
	import asunit.textui.TestRunner;
	import com.test.TestCases;
	import flash.display.Sprite;
	
	// TODO: improve the display of test results, might have to fork ASUnit.
	public class Tests extends Sprite {
		public function Tests() {
			super();
			var testRunner:TestRunner = new TestRunner();
			addChild(testRunner);
			testRunner.start(TestCases);
		}
	}
}