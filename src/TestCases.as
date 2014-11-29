package {
	import asunit.framework.TestSuite;

	public class TestCases extends TestSuite {
		public function TestCases() {
			super()
			addTest(new GameTest("it_should_construct_properly"))
		}
	}
}