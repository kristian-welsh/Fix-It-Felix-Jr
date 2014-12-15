package com {
	import asunit.textui.TestRunner;
	import flash.display.Sprite;
	import com.TestCases;

	public class Tests extends Sprite {
		public function Tests() {
			super();
			var testRunner:TestRunner = new TestRunner();
			addChild(testRunner);
			testRunner.start(TestCases);
		}
	}
}