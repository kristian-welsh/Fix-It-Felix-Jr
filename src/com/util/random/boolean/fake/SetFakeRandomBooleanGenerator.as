package com.util.random.boolean.fake {
	import com.util.random.boolean.RandomBooleanGenerator;
	
	public class SetFakeRandomBooleanGenerator implements RandomBooleanGenerator {
		private var booleanReturnValue:Boolean = false;
		
		public function generate():Boolean {
			return booleanReturnValue;
		}
		
		public function setBooleanReturnValue(value:Boolean):void {
			booleanReturnValue = value;
		}
	}
}