package italk;

import italk.ui.ClientFrame;
import italk.ui.GuiUtils;
import italk.ui.view.ViewFactory;
import italk.util.OrderSafeProperties;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import org.apache.commons.io.IOUtils;

import com.seaglasslookandfeel.SeaGlassLookAndFeel;

/**
 * main program 主程序
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class App {
  
    private static App instance = new App();
    
    public static App shareInstance() {
      return instance;
    }

	/**
	 * name of app
	 */
	private String name;

	/**
	 * version of app
	 */
	private String version;

	/**
	 * The app configuration
	 */
	private Properties configuration;

	/**
	 * configuration file for app
	 */
	public static final String CONFIG_FILE = "app.conf";

	public void readConfiguration() {
		InputStream configInputStream = null;
		try {
			try {
				configInputStream = new FileInputStream(CONFIG_FILE);
			} catch (Exception e) {
				configInputStream = App.class.getClassLoader()
						.getResourceAsStream(CONFIG_FILE);
			}
			setConfiguration(new OrderSafeProperties());
			getConfiguration().load(configInputStream);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (configInputStream != null) {
				IOUtils.closeQuietly(configInputStream);
			}
		}
	}

	public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getVersion() {
    return version;
  }

  public void setVersion(String version) {
    this.version = version;
  }

  public Properties getConfiguration() {
    return configuration;
  }

  public void setConfiguration(Properties configuration) {
    this.configuration = configuration;
  }

  public static Mode getMode() {
    return mode;
  }

  public static void setMode(Mode mode) {
    App.mode = mode;
  }

  /**
	 * App mode
	 */
	private static Mode mode;

	public static enum Mode {

		/**
		 * Enable development-specific features.
		 */
		DEV,
		/**
		 * Disable development-specific features.
		 */
		PROD;

		public boolean isDev() {
			return this == DEV;
		}

		public boolean isProd() {
			return this == PROD;
		}
	}

	public static List<Bootstrap> bootstraps = new ArrayList<Bootstrap>();
	static {
		bootstraps.add(new AppBootstrap());
		bootstraps.add(new LoggerBootstrap());
		bootstraps.add(new ThreadsBootstrap());
	}

	public static void main(String[] args) {
	    App app = App.shareInstance();
		// 加载配置文件
		app.loading();

		// 设置Swing样式
		app.setLookAndFeel();

		// 运行主程序
		app.launch();
	}

	/**
	 * 加载配置文件
	 */
	public void loading() {
		for (Bootstrap b : bootstraps) {
			try {
				b.start();
			} catch (Exception e) {
				System.err.println("Error in bootstrap!" + e.toString());
				System.exit(-1);
			}
		}

		Runtime.getRuntime().addShutdownHook(new Thread() {
			@Override
			public void run() {
				for (Bootstrap b : bootstraps) {
					try {
						b.stop();
					} catch (Exception e) {
					}
				}
			}
		});
	}

	/**
	 * 运行主方法
	 */
	private void launch() {
		try {
			/** Launch the application */
			SwingUtilities.invokeAndWait(new Runnable() {
				@Override
				public void run() {
					ClientFrame clientFrame = ViewFactory.getClientFrame();
					
					// 加载登录面板
					clientFrame.setContentPane(ViewFactory.getLoginPanel());

					// 设置窗口透明度
					GuiUtils.setWindowOpacity(clientFrame, Float
							.valueOf(getConfiguration().getProperty(
									"windowOpacity", "1")));
					//显示窗口
					clientFrame.setVisible(true);
				}

			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 设置Swing SeaGlassLookAndFeel 样式
	 * 
	 * @throws Exception
	 */
	private void setLookAndFeel() {
		try {
			// UIManager.setLookAndFeel("com.seaglasslookandfeel.SeaGlassLookAndFeel");
			// UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
			UIManager.installLookAndFeel("SeaGlass",
					"com.seaglasslookandfeel.SeaGlassLookAndFeel");
			UIManager.setLookAndFeel(new SeaGlassLookAndFeel());
		} catch (UnsupportedLookAndFeelException e) {
			try {
				UIManager.setLookAndFeel(UIManager
						.getSystemLookAndFeelClassName());
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
}
