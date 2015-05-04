package com.game {
	import com.building.Building;
	import com.building.segment.BuildingSegment;
	import com.building.IBuilding;
	import com.building.window.factory.DoubleWindowFactoryImp;
	import com.enemies.Brick;
	import com.enemies.ralph.Ralph;
	import com.felix.Felix;
	import com.enemies.ralph.IRalph
	import com.felix.IFelix;
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class Game extends Sprite {
		// building_mc, felix_mc, ralph_mc, life_mc_0-4, and brick_mc_0-3 are movieclips defined on the stage in the flash environment.
		public var building_mc:MovieClip
		public var felix_mc:MovieClip
		public var ralph_mc:MovieClip

		public var life_mc_0:MovieClip
		public var life_mc_1:MovieClip
		public var life_mc_2:MovieClip
		public var life_mc_3:MovieClip
		public var life_mc_4:MovieClip

		public var brick_mc_0:MovieClip
		public var brick_mc_1:MovieClip
		public var brick_mc_2:MovieClip

		private var _building:IBuilding;
		private var _felix:IFelix;
		private var _ralph:IRalph;
		private var _bricks:Array;

		public function Game(passedBuilding:IBuilding = null, passedFelix:IFelix = null, passedRaplh:IRalph = null):void {
			// Building must be created first, or other classes can't grab a referance to segment.
			_building = passedBuilding || new Building(building_mc, new DoubleWindowFactoryImp());
			_felix = passedFelix || new Felix(felix_mc, this);
			_ralph = passedRaplh || new Ralph(ralph_mc, this);
			_bricks = new Array(3);
		}

		/**
		 * @param	XX Window column position (0 = leftmost, 5 = rightmost)
		 */
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
			if (_building.getSegment().checkSegmentCleared()) {
				resetSegment();
				_building.setSegment(new BuildingSegment(_building.getSegment()._target, 8, new DoubleWindowFactoryImp()));
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
			throw new Error("Not Yet Implemented")
		}

		public function get building():IBuilding {
			return _building;
		}

		public function get felix():IFelix {
			return _felix;
		}
	}
}