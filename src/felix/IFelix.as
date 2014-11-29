package felix {
	import flash.display.MovieClip;

	public interface IFelix {
		function updateLives(update:int):void;
		function loseLife():void;
		function resetFelix():void;
		function get XX():uint;
		function get target():MovieClip;
	}
}