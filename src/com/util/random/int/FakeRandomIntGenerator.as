package com.util.random.int {
	
	// Outputs are read in chronological order.
	public class FakeRandomIntGenerator implements RandomIntGenerator {
		private var outputs:Array;
		
		public function setOutputs(... outputs):void {
			this.outputs = outputs;
			this.outputs.reverse();
		}
		
		public function nonRepeatedBoundedInts(num:uint, lowest:int, highest:int):Array {
			return outputs.pop();
		}
	}
}