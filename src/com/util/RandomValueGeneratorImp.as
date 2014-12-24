package com.util {
	public class RandomValueGeneratorImp implements RandomValueGenerator {
		public function boolean():Boolean {
			return Math.round(Math.random()) == 1;
		}
	}
}