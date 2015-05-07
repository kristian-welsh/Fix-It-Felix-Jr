package com.util.random.boolean {
	
	public class RandomBooleanGeneratorImp implements RandomBooleanGenerator {
		public function generate():Boolean {
			return Math.round(Math.random()) == 1;
		}
	}
}