package italk.ui.bean;

import italk.client.bean.State.ContactState;
import italk.client.entity.Contact;
import italk.client.entity.Group;
import italk.util.ImageManager;

import java.awt.FlowLayout;
import java.io.File;

import javax.swing.Icon;
import javax.swing.JLabel;
import javax.swing.JPanel;

/**
 * 
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class CellPanel extends JPanel {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -1640989345981195127L;

	private Object obj = null;

	public CellPanel() {
		this.setLayout(new FlowLayout(FlowLayout.LEFT));
	}

	public void addText(String text) {
		this.add(new JLabel(text));
	}

	public void addIcon(Icon icon) {
		this.add(new JLabel(icon));
	}

	public void addJLabel(String text, Icon icon, int horizontalAlignment) {
		this.add(new JLabel(text, icon, horizontalAlignment));
	}

	public void addText(Icon stateIcon, Icon faceIcon, String text) {
		addIcon(stateIcon);
		JLabel label = new JLabel(text, faceIcon, JLabel.LEFT);
		this.add(label);
	}
	
	public void addText(Icon icon, String text) {
		this.add(new JLabel(text, icon, JLabel.LEFT));
	}

	/**
	 * @return the obj
	 */
	public Object getObj() {
		return obj;
	}

	/**
	 * @param obj
	 *            the obj to set
	 */
	public CellPanel setObj(Object obj) {
		this.obj = obj;
		
		if(obj instanceof Contact) {
			Contact contact = (Contact)obj;
			this.addText(ContactState.getIconByState(contact.getState()), contact.getFace(), contact.toString());
		} else if(obj instanceof Group) {
			Group group = (Group) obj;
			Icon groupIcon = ImageManager.getImageIconByShortName("icons" + File.separator + "group.png");
			this.addText(groupIcon, group.getFace(), group.getName());
		}
		
		return this;
	}
}
