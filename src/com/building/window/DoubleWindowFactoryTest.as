package com.building.window {
	import com.building.window.pane.WindowPane;
	import com.building.window.shutter.Shutter;
	import com.util.FakeRandomValueGenerator;
	import com.util.RandomValueGenerator;
	import flash.display.MovieClip;
	import kris.test.SuiteProvidingTestCase;
	
	public class DoubleWindowFactoryTest extends SuiteProvidingTestCase {
		private var factory:DoubleWindowFactory;
		private var subject:DoubleWindow;
		private var view:MovieClip;
		private var random:FakeRandomValueGenerator
		
		public function DoubleWindowFactoryTest(testMethod:String = null) {
			super([no_nulls_passed_to_window], testMethod);
		}
		
		override protected function setUp():void {
			random = new FakeRandomValueGenerator()
			factory = new DoubleWindowFactory()
			createView()
		}
		
		private function createView():void {
			// view is named window_00 to so we can test shutter nulls with assertShuttersWithViewsReceived()
			view = new MovieClip()
		}
		
		public function no_nulls_passed_to_window():void {
			
			createWindow(new MovieClip())
			assertComponentsReceived()
		}
		
		private function createWindow(view:MovieClip, pane1_:WindowPane = null, pane2_:WindowPane = null, topShutter_:Shutter = null, leftShutter_:Shutter = null):void {
			subject = factory.create(view, pane1_, pane2_, topShutter_, leftShutter_, random)
		}
		
		private function assertComponentsReceived():void {
			// induce calls on shutters and panes in double window to force flashplayer to notice if they're null
			// movieClips are automaticaly checked from whithing shutter and pane's constructors
			assertShuttersWithViewsReceived()
			assertPanesWithViewsReceived()
		}
		
		private function assertPanesWithViewsReceived():void {
			/* subject.breakWindow() calls pane.break on both panes if it's RandomValueGenerator returns true twice in a row
			 * pane.break referances the pane's MovieClip.
			 * this forces flash to check for nulls on the panes and their MovieClips.
			 */
			random.setBooleanReturnValue(true)
			subject.breakWindow()
		}
		
		private function assertShuttersWithViewsReceived():void {
			/* subject.shutterWindow() calls shutter.active on both shutters if the main view is named window_00
			 * shutter.active referances the shutter's MovieClip.
			 * this forces flash to check for nulls on the shutters and their MovieClips.
			 */
			subject.leftShutterExists()
			subject.topShutterExists()
		}
	}
}