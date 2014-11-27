package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import felix.Felix;
	import enemies.Ralph;
	import enemies.Brick;
	import building.Building;
	import building.BuildingSegment;
	
	public class FixItFelixJr extends Sprite {
		
		public var _felix:Felix;
		public var _ralph:Ralph;
		public var _building:Building;
		public var _bricks:Array;
		
		public function FixItFelixJr():void {
			_building = new Building(building_mc);
			_felix = new Felix(felix_mc, this);
			_ralph = new Ralph(ralph_mc,this);
			_bricks = new Array(3);
		}
		
		public function spawnBricks(XX:uint){
			for ( var i:int = -1 ; i < 2 ; ++ i ) {
				_bricks[i+1] = new Brick(getChildByName("brick_mc_"+(i+1)),randomBrickStartTime(), XX+i, this);
			}
		}
		
		private function randomBrickStartTime():uint {
			switch(uint(Math.random()*3)){
				case 0:
					return 0;
				break;
				case 1:
					return 200;
				break;
				case 2:
					return 600;
				break;
			}
			return 1;
		}
		
		public function checkWindows():void {
			if(_building._segments[0].checkSegmentCleared()){
				resetSegment();
				var seg:BuildingSegment = _building._segments[0];
				seg = new BuildingSegment(seg._target, 8);
				_felix.resetFelix();
			}
		}
		
		public function resetSegment():void {
			for ( var i:uint = 0 ; i < _bricks.length ; ++ i ) {
				_bricks[i].destroy();
			}
			_bricks = new Array(3);
			_ralph.resetObject();
		}
		
		public function resetGame():void {
			trace(3);
		}
	}
}