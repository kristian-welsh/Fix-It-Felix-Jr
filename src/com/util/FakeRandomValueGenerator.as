package com.util {
	public class FakeRandomValueGenerator implements RandomValueGenerator {
		private var booleanReturnValue:Boolean = false;
		
		public function boolean():Boolean {
			return booleanReturnValue;
		}
		
		public function setBooleanReturnValue(value:Boolean):void {
			booleanReturnValue = value;
		}
	}
}