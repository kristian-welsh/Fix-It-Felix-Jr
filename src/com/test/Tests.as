package com.test {
	import asunit.textui.TestRunner;
	import com.test.TestCases;
	import flash.display.Sprite;
	
	public class Tests extends Sprite {
		public function Tests() {
			super();
			var testRunner:TestRunner = new TestRunner();
			addChild(testRunner);
			testRunner.start(TestCases);
		}
	}
}