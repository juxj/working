package italk.ui.view;


import italk.ui.ClientFrame;
import italk.ui.InfoDialog;
import italk.ui.vidw.panel.LoginPanel;
import italk.ui.vidw.panel.LoginProgressPanel;
import italk.ui.vidw.panel.MainPanel;

import javax.swing.JFrame;

/**
 * 窗口工厂
 *
 * @author chenzhihui @email chengnuo128@gmail.com
 */
public class ViewFactory {

    private static ClientFrame clientFrame = null;
    private static LoginPanel loginPanel = null;
    private static LoginProgressPanel loginProgressPanel = null;
    private static MainPanel mainPanel = null;
    private static InfoDialog infoDialog = null;

    /**
     * 主窗口使用单例
     *
     * @return clientFrame
     */
    public static ClientFrame getClientFrame() {
        if (clientFrame == null) {
            clientFrame = new ClientFrame();
        }

        return clientFrame;
    }

    /**
     * 登录面板
     *
     * @return loginPanel
     */
    public static LoginPanel getLoginPanel() {
        if (loginPanel == null) {
            loginPanel = new LoginPanel();
        }
        return loginPanel;
    }

    /**
     * 登录过程面板
     *
     * @return loginPanel
     */
    public static LoginProgressPanel getLoginProgressPanel() {
        if (loginProgressPanel == null) {
            loginProgressPanel = new LoginProgressPanel();
        }
        return loginProgressPanel;
    }

    /**
     * 登录后主面板
     *
     * @return loginPanel
     */
    public static MainPanel getMainPanel() {
        if (mainPanel == null) {
            mainPanel = new MainPanel();
            //释放登录面板
            removeView(LoginPanel.class);
            removeView(LoginProgressPanel.class);
        }
        return mainPanel;
    }
    
    public static void removeView(Object comp) {
    	if(comp.equals(LoginPanel.class)) { 
    		loginPanel = null;
    	} else if(comp.equals(LoginProgressPanel.class)) {
    		loginProgressPanel = null;
    	}
    }

	/**
	 * @return the infoDialog
	 */
	public static InfoDialog getInfoDialog() {
		if(infoDialog == null) {
			infoDialog = new InfoDialog(null, false);
		}
		return infoDialog;
	}

}
