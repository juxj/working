package italk.ui;

import italk.App;
import italk.ui.widget.StandardFrame;
import italk.util.ImageManager;

import java.io.File;

import javax.swing.JFrame;

/**
 * 主窗口
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class ClientFrame extends StandardFrame {

	private static final long serialVersionUID = 6632226619943591387L;

	public static final int WIDTH = 255;
	public static final int HEIGHT = 555;

	public ClientFrame() {
		super();
		init();
	}

	/**
	 * 初始化
	 */
	private void init() {
		// TODO Auto-generated method stub
		super.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		super.setTitle(App.shareInstance().getName());
		String icon = "client_icons" + File.separator + "icon.png";
		super.setIconImage(ImageManager.getImageByShortName(icon));

		// 设置窗口大小
		// 设置窗口位置
		int x = GuiUtils.getDeviceWidth() - WIDTH - WIDTH / 2;
		super.setBounds(x, WIDTH / 2, WIDTH, HEIGHT);
	}
}
