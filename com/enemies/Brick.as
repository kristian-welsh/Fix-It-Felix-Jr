package enemies {
	import flash.display.DisplayObject;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import building.DoubleWindow;
	public class Brick{
		
		private const _SPEED:Number = 3;
		
		private var _par:FixItFelixJr;
		private var _target:DisplayObject;
		private var _XX:uint;
		private var _delayed:Timer;
		private var _fall_timer:Timer;
		private var _cur_window:DoubleWindow;
		private var _felix_target:DisplayObject;
		
		public function Brick(target:DisplayObject, delay:uint, XX:uint, caller:FixItFelixJr):void {
			_par = caller;
			_target = target;
			_XX = XX;
			_cur_window = _par._building.segments[0].getWindowAt(_XX);
			_felix_target = _par._felix._target;
			
			_delayed = new Timer(delay,1);
			_delayed.addEventListener(TimerEvent.TIMER_COMPLETE, onDelayComplete);
			_delayed.start();
		}
		
		private function onDelayComplete(te:TimerEvent):void {
			_delayed.stop();
			_delayed.removeEventListener(TimerEvent.TIMER_COMPLETE, onDelayComplete);
			_delayed=null;
			positionTarget();
			startFalling();
		}
		
		private function positionTarget():void {
			_target.x = _par._building.target.x+_par._building.segments[0].target.x+_cur_window.target.x+35;
			_target.y = _par._building.target.y+_par._building.segments[0].target.y+_cur_window.target.y-50;
		}
		
		private function startFalling():void {
			_fall_timer = new Timer(10);
			_fall_timer.addEventListener(TimerEvent.TIMER, onFallTick);
			_fall_timer.start();
		}
		
		private function onFallTick(te:TimerEvent):void {
			if(_target.y<_target.stage.stageHeight+20){
				_target.y+=_SPEED;
			} else {
				destroy()
			}
			if(_target.hitTestObject(_felix_target)){
				_par._felix.loseLife();
			}
		}
		
		public function destroy() {
			_target.x = -500;
			_target.y = -500;
			if(_fall_timer!=null){
				_fall_timer.stop();
				_fall_timer.removeEventListener(TimerEvent.TIMER, onFallTick);
				_fall_timer = null;
			}
			if(_delayed!=null){
				_delayed.stop();
				_delayed.removeEventListener(TimerEvent.TIMER_COMPLETE, onDelayComplete);
				_delayed=null;
			}
		}
	}
}