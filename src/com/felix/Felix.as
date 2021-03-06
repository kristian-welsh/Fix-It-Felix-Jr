﻿package com.felix {
	import com.building.*;
	import com.building.segment.BuildingSegment;
	import com.building.window.DoubleWindow;
	import com.game.Game;
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.utils.Timer;

	public class Felix implements IFelix {
		private var _target:MovieClip = null;
		private var _life_symbol_vector:Vector.<MovieClip> = new Vector.<MovieClip>;
		private var _building:IBuilding;
		private var _par:Game = null;
		private var _building_segment:BuildingSegment;
		private var _XX:uint = 2;
		private var _YY:uint = 2;
		private var _cur_window:DoubleWindow;
		private var _timer:Timer = new Timer(350);
		private var _can_fix:Boolean = true;
		private var _lives:uint;

		public function Felix(target:MovieClip, caller:Game):void {
			_par = caller;
			_target = target;
			_building = _par.building;
			initialize();
		}

		private function initialize():void {
			aquireSegmentReferance();
			moveToWindow(2, 2);
			_target.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			_life_symbol_vector.push(_par.life_mc_0, _par.life_mc_1, _par.life_mc_2, _par.life_mc_3, _par.life_mc_4);
			updateLives(5);
		}
		
		private function aquireSegmentReferance():void {
			_building_segment = _building.getSegment();
		}

		private function moveToWindow(XX:uint, YY:uint):void {
			setCurWindow(XX, YY);
			_target.x = _building.target.x + _building_segment.target.x + _cur_window.getTarget().x + 35;
			_target.y = _building.target.y + _building_segment.target.y + _cur_window.getTarget().y + 100;
		}

		private function setCurWindow(XX:uint, YY:uint):void {
			_cur_window = _building_segment.getWindowAt(XX, YY);
		}

		private function onKeyPress(ke:KeyboardEvent):void {
			if (_can_fix) {
				switch (ke.keyCode) {
					case 32: //SPACE
						fixWindow();
						break;
					case 37:
						moveLeft();
						break;
					case 38:
						moveUp();
						break;
					case 39:
						moveRight();
						break;
					case 40:
						moveDown();
						break;
				}
			}
		}

		private function fixWindow():void {
			if (_cur_window.getBroken()) {
				_can_fix = false;
				_timer.addEventListener(TimerEvent.TIMER, stopWaiting);
				_timer.start();
			}
		}

		private function stopWaiting(te:TimerEvent):void {
			_can_fix = true;
			_timer.removeEventListener(TimerEvent.TIMER, stopWaiting);
			_timer.stop();
			_cur_window.repair();
			_par.checkWindows();
		}

		private function moveUp():void {
			if (_YY > 0) {
				if (!_building_segment.windows[_XX + _YY * 5].topShutterActive()) {
					moveToWindow(_XX, --_YY)
				}
			}
		}

		private function moveDown():void {
			if (_YY < 2) {
				if (!_building_segment.windows[_XX + (_YY + 1) * 5].topShutterActive()) {
					moveToWindow(_XX, ++_YY)
				}
			}
		}

		private function moveLeft():void {
			if (_XX > 0) {
				if (!_building_segment.windows[_XX + _YY * 5].leftShutterActive()) {
					moveToWindow(--_XX, _YY)
				}
			}
		}

		private function moveRight():void {
			if (_XX < 4) {
				if (!_building_segment.windows[(_XX + 1) + _YY * 5].leftShutterActive()) {
					moveToWindow(++_XX, _YY)
				}
			}
		}

		public function updateLives(update:int):void {
			_lives += update;
			for (var i:uint = 0; i < _lives; ++i) {
				_life_symbol_vector[i].visible = true;
			}
			for (i; i < _life_symbol_vector.length; ++i) {
				_life_symbol_vector[i].visible = false;
			}
		}

		public function loseLife():void {
			_timer.stop();
			_timer.removeEventListener(TimerEvent.TIMER, stopWaiting);
			_timer = null;
			if (_lives > 0) {
				_par.resetSegment();
				updateLives(-1);
				resetFelix();
			} else {
				_par.resetGame();
			}
		}

		public function resetFelix():void {
			aquireSegmentReferance();
			_XX = 2;
			_YY = 2;
			moveToWindow(2, 2);
			_timer = new Timer(350);
			_timer.addEventListener(TimerEvent.TIMER, stopWaiting);
			_can_fix = true;
		}

		public function get XX():uint {
			return _XX;
		}

		public function get target():MovieClip {
			return _target;
		}
	}
}