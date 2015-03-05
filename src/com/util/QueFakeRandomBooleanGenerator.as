package com.util {
	import org.flashdevelop.utils.FlashConnect;
	
	// TODO: Extract concept of Que to own class.
	// possibly use annother class to combine fakes by type checking a generaic argument
	public class QueFakeRandomBooleanGenerator implements RandomBooleanGenerator {
		private var returnValueIndex:int;
		private var returnValues:Array;
		
		public function QueFakeRandomBooleanGenerator() {
			setBooleanQue([false])
		}
		
		public function boolean():Boolean {
			if (returnValueIndex + 1 < returnValues.length) {
				returnValueIndex++;
				return returnValues[returnValueIndex];
			} else
				throw new RangeError("return value not found at index " + returnValueIndex);
		}
		
		public function setBooleanQue(que:Array):void {
			returnValueIndex = -1 // incremention makes first accessed value [0]
			returnValues = que;
		}
	}
}