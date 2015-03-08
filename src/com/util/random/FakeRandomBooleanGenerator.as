package com.util.random {
	public class FakeRandomBooleanGenerator implements RandomBooleanGenerator {
		private var booleanReturnValue:Boolean = false;
		
		public function boolean():Boolean {
			return booleanReturnValue;
		}
		
		public function setBooleanReturnValue(value:Boolean):void {
			booleanReturnValue = value;
		}
	}
}