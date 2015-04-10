package com.util.random.int {
	
	public interface RandomIntGenerator {
		function nonRepeatedBoundedInts(num:uint, lowest:int, highest:int):Array;
	}
}