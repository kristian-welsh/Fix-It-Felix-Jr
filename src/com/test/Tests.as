package com.test {
	import asunit.textui.TestRunner;
	import flash.display.Sprite;
	import com.test.TestCases;

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