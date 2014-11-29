package felix {
	import flash.display.MovieClip;

	public class FakeFelix implements IFelix {
		public function updateLives(update:int):void {

		}

		public function loseLife():void {

		}

		public function resetFelix():void {

		}

		public function get XX():uint {
			return 0;
		}

		public function get target():MovieClip {
			return new MovieClip;
		}
	}
}