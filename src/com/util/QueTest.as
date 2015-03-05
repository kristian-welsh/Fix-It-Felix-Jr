package com.util {
	import kris.test.SuiteProvidingTestCase;
	
	public class QueTest extends SuiteProvidingTestCase {
		private var que:Que;
		
		public function QueTest(testMethod:String = null) {
			super([
				can_set_contents_to_nothing,
				can_set_contents_to_single_object
				], testMethod);
		}
		
		override protected function setUp():void {
			que = new Que()
		}
		
		public function can_set_contents_to_nothing():void {
			que.setContents()
		}
		
		public function can_set_contents_to_single_object():void {
			que.setContents({})
		}
	}
}