package italk.ui.action;

import italk.client.bean.State.ClientState;
import italk.ui.ClientFrame;
import italk.ui.vidw.panel.LoginProgressPanel;
import italk.ui.view.ViewFactory;
import italk.util.LanguageLoader;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;

/**
 * 
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class LoginAction extends AbstractAction {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -382879282585763919L;

	private Object data;
	
	public LoginAction() {
		super(LanguageLoader.getString("login"));
		putValue(SHORT_DESCRIPTION, LanguageLoader.getString("login"));
	}
	
	/* (non-Javadoc)
	 * @see java.awt.event.ActionListener#actionPerformed(java.awt.event.ActionEvent)
	 */
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		ClientState.setCurrentState(ClientState.NEW);
		ClientFrame clientFrame = ViewFactory.getClientFrame();
		LoginProgressPanel loginPanel = ViewFactory.getLoginProgressPanel();
		loginPanel.init();
		clientFrame.setContentPane(loginPanel);
		clientFrame.validate();
		clientFrame.repaint();
	}

	/**
	 * @return the data
	 */
	public Object getData() {
		return data;
	}

	/**
	 * @param data the data to set
	 */
	public void setData(Object data) {
		this.data = data;
	}

}
