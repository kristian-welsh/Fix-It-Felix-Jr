package kris.test {
	import asunit.framework.TestSuite;

	// For test cases that supply their own test suite.
	public interface SuiteProvider{
		function getSuite():TestSuite
	}
}