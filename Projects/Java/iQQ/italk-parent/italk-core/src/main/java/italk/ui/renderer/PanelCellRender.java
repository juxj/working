package italk.ui.renderer;

import java.awt.Component;

import javax.swing.JComponent;
import javax.swing.JList;
import javax.swing.ListCellRenderer;

/**
 * 
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class PanelCellRender implements ListCellRenderer {

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * javax.swing.ListCellRenderer#getListCellRendererComponent(javax.swing
	 * .JList, java.lang.Object, int, boolean, boolean)
	 */
	@Override
	public Component getListCellRendererComponent(JList list, Object value,
			int index, boolean isSelected, boolean cellHasFocus) {
		JComponent comp = (JComponent) value;
		if (comp == null) {
			return null;
		}
		comp = setProp(comp, list, value, index, isSelected, cellHasFocus);
		return comp;
	}

	private JComponent setProp(JComponent comp, JList list, Object value,
			int index, boolean isSelected, boolean cellHasFocus) {

		comp.setComponentOrientation(list.getComponentOrientation());
		JList.DropLocation dropLocation = list.getDropLocation();
		if (dropLocation != null && !dropLocation.isInsert()
				&& dropLocation.getIndex() == index) {
			isSelected = true;
		}

		if (isSelected) {
			comp.setBackground(list.getSelectionBackground());
			comp.setForeground(list.getSelectionForeground());
		} else {
			comp.setBackground(list.getBackground());
			comp.setForeground(list.getForeground());
		}

		comp.setEnabled(list.isEnabled());
		comp.setFont(list.getFont());

		return comp;
	}
}

// if (value instanceof List) {
// List valueList = (List) value;
//
// if (valueList != null) {
// for (Object obj : valueList) {
// if (obj instanceof JLabel) {
// JLabel lbl = (JLabel) obj;
// this.add(lbl);
// } else if (obj instanceof JButton) {
// JButton btn = (JButton) obj;
// this.add(btn);
// }
// }
// }
// } else if (value instanceof JLabel) {
// JLabel lbl = (JLabel) value;
// this.add(lbl);
// } else if (value instanceof JButton) {
// JButton btn = (JButton) value;
// this.add(btn);
// }
