package  {
	import kris.AssertionFailedError;

	/**
	 * If condition evaluates to false, this function will throw an AssertionFailedError with the message passed.
	 */
	public function assert(condition:Boolean, message:String = ""):void {
		if (!condition)
			throw new AssertionFailedError(message);
	}
}