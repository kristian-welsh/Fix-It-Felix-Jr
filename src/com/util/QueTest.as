package com.util {
	import flash.display.MovieClip;
	import kris.test.SuiteProvidingTestCase;
	
	// TODO: remember to test at the end of a uint's value range
	public class QueTest extends SuiteProvidingTestCase {
		private var que:Que;
		
		public function QueTest(testMethod:String = null) {
			super([
				can_set_contents_to_nothing,
				can_set_contents_to_single_object,
				can_set_contents_to_argritrary_large_number_of_objects,
				can_set_contents_from_constructor,
				can_retrieve_exact_contents_with_next,
				can_retrieve_contents_set_from_constructor_with_next,
				can_retrieve_multiple_contents_with_next
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
		
		public function can_set_contents_from_constructor():void {
			que = new Que(1, 1, 1)
		}
		
		public function can_retrieve_exact_contents_with_next():void {
			var contents:Object = {}
			que.setContents(contents)
			assertEquals(contents, que.next())
		}
		
		public function can_retrieve_contents_set_from_constructor_with_next():void {
			que = new Que(1)
			assertEquals(1, que.next())
		}
		
		public function can_retrieve_multiple_contents_with_next():void {
			que.setContents(1, 2)
			assertEquals(1, que.next())
			assertEquals(2, que.next())
		}
	}
}