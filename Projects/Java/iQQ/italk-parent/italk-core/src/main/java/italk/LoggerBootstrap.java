package italk;

/**
 * 
 * Bootstrap for Logger
 * 
 * @author steven0lisa
 * @create-time Jul 27, 2012 8:12:44 PM
 */
public class LoggerBootstrap implements Bootstrap {

	public void start() {
		// init Logger
		Logger.init();
	}

	public void stop() {

	}
}
