package com.util.random.boolean.fake {
	import com.util.random.boolean.RandomBooleanGenerator;
	import kris.collections.que.Que;
	
	// TODO: use annother class to choose between fakes
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