﻿package {
	import building.Building;
	import building.BuildingSegment;
	import building.IBuilding;
	import enemies.Brick;
	import enemies.Ralph;
	import felix.Felix;
	import felix.IFelix;
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class Game extends Sprite {
		public var building_mc:MovieClip
		public var felix_mc:MovieClip
		public var ralph_mc:MovieClip

		public var life_mc_0:MovieClip
		public var life_mc_1:MovieClip
		public var life_mc_2:MovieClip
		public var life_mc_3:MovieClip
		public var life_mc_4:MovieClip

		public var _building:IBuilding;
		public var _felix:IFelix;
		public var _ralph:Ralph;
		public var _bricks:Array;

		/**
		 * building_mc, felix_mc, and ralph_mc are movieclips defined on the stage in the flash environment.
		 */
		public function Game(passedBuilding:IBuilding = null, passedFelix:IFelix = null):void {
			_building = passedBuilding || new Building(building_mc);
			_felix = passedFelix || new Felix(felix_mc, this);
			_ralph = new Ralph(ralph_mc, this);
			_bricks = new Array(3);
		}

		public function spawnBricks(XX:uint):void {
			for (var i:int = -1; i < 2; ++i) {
				_bricks[i + 1] = new Brick(getChildByName("brick_mc_" + (i + 1)), randomBrickStartTime(), XX + i, this);
			}
		}

		private function randomBrickStartTime():uint {
			switch (uint(Math.random() * 3)) {
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
			if (_building.segments[0].checkSegmentCleared()) {
				resetSegment();
				var seg:BuildingSegment = _building.segments[0];
				seg = new BuildingSegment(seg._target, 8);
				_felix.resetFelix();
			}
		}

		public function resetSegment():void {
			for (var i:uint = 0; i < _bricks.length; ++i) {
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