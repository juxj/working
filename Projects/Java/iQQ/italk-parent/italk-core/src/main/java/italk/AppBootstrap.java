package italk;

import italk.util.LanguageLoader;
import italk.util.Strings;

import java.util.Locale;

/**
 * 
 * Bootstrap for App
 * 
 * @author steven0lisa
 * @create-time Jul 27, 2012 8:11:45 PM
 */
public class AppBootstrap implements Bootstrap {
  
    private App app = App.shareInstance(); 

	public void start() {
		// read configuration
	    app.readConfiguration();
		// read app.mode
		String mode = app.getConfiguration().getProperty("app.mode", "dev");
		if (Strings.isEmpty(mode)) {
			App.setMode(App.Mode.DEV);
		} else if ("dev".equalsIgnoreCase(mode)) {
			App.setMode(App.Mode.DEV);
		} else if ("prod".equalsIgnoreCase(mode)) {
			App.setMode(App.Mode.PROD);
		} else {
			App.setMode(App.Mode.DEV);
		}
		// init app info
		app.setName(app.getConfiguration().getProperty("app.name", "iQQ"));
		app.setVersion(app.getConfiguration().getProperty("app.version",
				"unknown version"));
		//设置语言环境
		LanguageLoader.setLanguage(Locale.getDefault());
		System.out.println(app.getName() + " " + app.getVersion() + " Locale:" + Locale.getDefault());
	}

	public void stop() {

	}
}
