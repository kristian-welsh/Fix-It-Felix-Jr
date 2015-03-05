package com.util {
	import flash.display.MovieClip;
	import kris.test.SuiteProvidingTestCase;
	
	public class QueTest extends SuiteProvidingTestCase {
		private var que:Que;
		
		public function QueTest(testMethod:String = null) {
			super([
				can_set_contents_to_nothing,
				can_set_contents_to_single_object,
				can_set_contents_to_argritrary_large_number_of_objects
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
			que.setContents("")
			que.setContents(1)
			que.setContents([])
			que.setContents(new MovieClip())
		}
		
		public function can_set_contents_to_argritrary_large_number_of_objects():void {
			que.setContents(1, 1, 1)
			que.setContents(1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
		}
	}
}