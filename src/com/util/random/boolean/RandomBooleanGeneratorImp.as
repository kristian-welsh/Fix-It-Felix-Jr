package com.util.random.boolean {
	
	public class RandomBooleanGeneratorImp implements RandomBooleanGenerator {
		public function boolean():Boolean {
			return Math.round(Math.random()) == 1;
		}
	}
}