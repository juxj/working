package italk;

import italk.util.Strings;
import italk.util.Threads;

/**
 * 
  * Bootstrap for Threads
  * 
  * @author steven0lisa
  * @create-time Jul 28, 2012 12:23:08 AM
 */
public class ThreadsBootstrap implements Bootstrap {

	public void start() {
		String poolSize = App.shareInstance().getConfiguration().getProperty("threads.poolSize");
		if(!Strings.isEmpty(poolSize)){
			try{
				Threads.init(Integer.parseInt(poolSize));
			}catch(Exception e){
				Logger.warn("threads.poolSize=%s in app.conf is invalid!", poolSize);
			}
		}
		
	}

	public void stop() {
		Threads.shutdown();
	}

}
