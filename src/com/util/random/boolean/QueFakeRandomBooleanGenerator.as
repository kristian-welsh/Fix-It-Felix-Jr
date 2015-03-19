package com.util.random.boolean {
	import kris.collections.que.Que;
	
	// TODO: possibly use another class to combine fakes by type checking a generic argument
	public class QueFakeRandomBooleanGenerator implements RandomBooleanGenerator {
		private var que:Que = new Que(false)
		
		public function boolean():Boolean {
			return que.next()
		}
		
		public function setBooleanQue(newContents:Array):void {
			que.setContents.apply(que, newContents)
		}
	}
}