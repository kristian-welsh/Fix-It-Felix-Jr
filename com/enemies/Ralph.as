package enemies {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import building.Building;
	import building.BuildingSegment;
	import building.DoubleWindow;
	import felix.Felix;
	
	public class Ralph{
		
		private var _par:FixItFelixJr = null;
		private var _building:Building = null;
		private var _building_segment:BuildingSegment = null;
		private var _cur_window:DoubleWindow = null;
		private var _felix:Felix = null;
		private var _XX:uint = 2;
		private var _attack_timer:Timer = new Timer(5000);
		private var _target:MovieClip = null;
		
		public function Ralph(target:MovieClip, par:FixItFelixJr):void {
			_target = target;
			_par = par;
			_building = _par._building;
			_felix = _par._felix;
			_target.y = 115;
			if(_building._is_built){
				initialize();
			}
			_attack_timer.addEventListener(TimerEvent.TIMER, onAttackTimer);
			_attack_timer.start();
		}
		
		private function onAttackTimer(te:TimerEvent){
			if(_XX<_felix._XX){
				moveRight()
			}
			if(_felix._XX<_XX){
				moveLeft()
			}
			_par.spawnBricks(_XX);
		}
		
		private function initialize():void {
			_building_segment = _building.segments[0];
			moveToWindow();
		}
		
		private function moveToWindow():void {
			setCurWindow();
			_target.x = _building.target.x+_building_segment.target.x+_cur_window.target.x+35;
		}
		
		private function setCurWindow():void {
			_cur_window = _building_segment.getWindowAt(_XX);
		}
		
		private function moveLeft():void {
			if(_XX>1){
				_XX--;
				moveToWindow();
			}
		}
		
		private function moveRight():void {
			if(_XX<3){
				_XX++;
				moveToWindow();
			}
		}
		
		public function resetObject():void {
			_XX=2;
			moveToWindow();
			_attack_timer.stop();
			_attack_timer.removeEventListener(TimerEvent.TIMER, onAttackTimer);
			_attack_timer = new Timer(5000);
			_attack_timer.addEventListener(TimerEvent.TIMER, onAttackTimer);
			_attack_timer.start();
		}
	}
}