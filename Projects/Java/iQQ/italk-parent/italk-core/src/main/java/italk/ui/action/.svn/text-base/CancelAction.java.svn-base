package italk.ui.action;

import italk.client.bean.State.ClientState;
import italk.ui.ClientFrame;
import italk.ui.vidw.panel.LoginProgressPanel;
import italk.ui.view.ViewFactory;
import italk.util.LanguageLoader;
import italk.util.Threads;

import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;

/**
 *
 *
 * @author chenzhihui @email chengnuo128@gmail.com
 */
public class CancelAction extends AbstractAction {

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -382879282585763919L;
    private Object data;

    public CancelAction() {
        super(LanguageLoader.getString("cancel"));
        putValue(SHORT_DESCRIPTION, LanguageLoader.getString("cancel"));
    }

    /*
     * (non-Javadoc) @see
     * java.awt.event.ActionListener#actionPerformed(java.awt.event.ActionEvent)
     */
    @Override
    public void actionPerformed(ActionEvent e) {
        // TODO Auto-generated method stub
        if (data instanceof LoginProgressPanel) {
            ClientState.setCurrentState(ClientState.CANCEL);
            ClientFrame clientFrame = ViewFactory.getClientFrame();
            clientFrame.setContentPane(ViewFactory.getLoginPanel());
            clientFrame.validate();
            clientFrame.repaint();
        }
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
