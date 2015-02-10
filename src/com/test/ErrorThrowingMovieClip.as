package com.test {
	import flash.display.MovieClip;
	
	public class ErrorThrowingMovieClip extends MovieClip {
		static public const ERROR_MESSAGE:String = "gotoAndStop called";
		
		public function ErrorThrowingMovieClip() {
			super();
		}
		
		override public function gotoAndStop(frame:Object, scene:String = null):void {
			throw new Error(ERROR_MESSAGE)
		}
	}
}