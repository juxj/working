package italk.ui.renderer;

import italk.ui.bean.ComboBoxImageItem;

import java.awt.Component;

import javax.swing.BorderFactory;
import javax.swing.DefaultListCellRenderer;
import javax.swing.JList;

/**
 * IconListRenderer
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class IconListRenderer extends DefaultListCellRenderer {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8847590857438544531L;

	public Component getListCellRendererComponent(JList list, Object value,
			int index, boolean isSelected, boolean cellHasFocus) {
		super.getListCellRendererComponent(list, value, index, isSelected,
				cellHasFocus);
		if (value instanceof ComboBoxImageItem) {
			ComboBoxImageItem item = (ComboBoxImageItem) value;
			this.setText(item.getText());
			this.setIcon(item.getIcon());
			int offset = 10 * item.getIndent();
			this.setBorder(BorderFactory.createEmptyBorder(0, offset, 0, 0));
		}
		return this;
	}
}
