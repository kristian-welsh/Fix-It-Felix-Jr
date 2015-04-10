package com.util.random.int {
	
	public class RandomIntGeneratorImp implements RandomIntGenerator {
		public function nonRepeatedBoundedInts(num:uint, lowest:int, highest:int):Array {
			// returns an array with length=[num] filled with integers which are randomly dispursed between the [lowest] and [highest]
			var return_me:Array = [];
			var temp_rand:int;
			while (return_me.length < num) {
				temp_rand = boundedInt(lowest, highest);
				if (return_me.indexOf(temp_rand) == -1) {
					return_me.push(temp_rand);
				}
			}
			return return_me;
		}
		
		private function boundedInt(lowest:int, highest:int):int {
			return Math.round((Math.random() * (highest - lowest)) + lowest);
		}
	}
}