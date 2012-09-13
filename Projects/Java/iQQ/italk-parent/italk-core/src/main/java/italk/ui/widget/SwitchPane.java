package italk.ui.widget;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.LayoutManager;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

import javax.swing.Icon;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JLayeredPane;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

/**
 * 抽屉式面板切换 重写了CurtainPane类 此类也会对内存有点消耗
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class SwitchPane extends JLayeredPane {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 6116051552346164935L;

	/**
	 * 当前层数，也相当于总数 switchPanelList.size()
	 */
	private int currentLayered = 0;
	private int selectedPane = -1;
	private static final int BUTTON_HEIGHT = 22;
	private List<SwitchPanel> switchPanelList;

	public SwitchPane() {
		switchPanelList = new ArrayList<SwitchPanel>();
		setLayout(new SwitchPanelLayout());
	}

	/**
	 * 添加带标题的切换面板
	 * 
	 * @param title
	 * @param comp
	 */
	public void addPane(String title, Component comp) {
		addPane(title, null, comp);
	}

	/**
	 * 添加带标题和图标的切换面板
	 * 
	 * @param title
	 * @param icon
	 * @param comp
	 */
	public void addPane(String title, Icon icon, Component comp) {
		JButton btn = new JButton(title, icon);
		SwitchPanel switchPanel = new SwitchPanel(btn, comp);
		this.add(switchPanel, new Integer(currentLayered++));
		switchPanelList.add(switchPanel);
		//selectedPane++;
		// 防止列表超过面板，而滚动不起作用
		setPreferredSize(new Dimension(this.getWidth(), currentLayered * BUTTON_HEIGHT));
	}

	public void setSelectedPane(int selectedIndex) {
		selectedPane = selectedIndex;
		doLayout();
	}

	class SwitchPanel extends JComponent {
		/**
		 * serialVersionUID
		 */
		private static final long serialVersionUID = -2966934519572054017L;

		public SwitchPanel(JButton btn, Component comp) {
			setLayout(new BorderLayout());
			btn.setHorizontalAlignment(SwingConstants.LEFT);
			btn.setFocusable(false);
			btn.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {
					//判断如果为空，将不执行展开
					Object obj = SwitchPanel.this.getComponent(1);
					if(obj instanceof JPanel ) {
						JPanel p = (JPanel)obj;
						if(p.getComponentCount() == 0) {
							return ;
						}
					}
					int layer = switchPanelList.indexOf(SwitchPanel.this);
					if (layer != selectedPane) {
						// 展开当前点击的面板
						SwitchPane.this.setSelectedPane(layer);
					} else if (layer != currentLayered) {
						// 收缩面板
						SwitchPane.this.setSelectedPane(currentLayered);
					}
				}
			});

			add(btn, BorderLayout.NORTH);
			add(comp, BorderLayout.CENTER);
		}
	}

	class SwitchPanelLayout extends Layout {
		protected int layoutDrawer(SwitchPanel switchPanel, int i, int y,
				int w, int h) {
			if (selectedPane == i) {
				switchPanel.getComponent(1).setVisible(true);
				switchPanel.validate();
				switchPanel.setBounds(0, 0, w, h);
				return y + h;
			} else {
				switchPanel.getComponent(1).setVisible(false);
				switchPanel.setBounds(0, y, w, h);
				return y + BUTTON_HEIGHT;
			}
		}
	}

	abstract class Layout implements LayoutManager {
		public void addLayoutComponent(String name, Component comp) {
		}

		public void removeLayoutComponent(Component comp) {
		}

		public Dimension preferredLayoutSize(Container parent) {
			return new Dimension(0, 0);
		}

		public Dimension minimumLayoutSize(Container parent) {
			return new Dimension(0, 0);
		}

		public void layoutContainer(Container parent) {
			//int h = parent.getHeight() - (currentLayered - 1) * BUTTON_HEIGHT;
			int h = parent.getHeight();
			int w = parent.getWidth();
			int y = 0;
			for (int i = 0; i < currentLayered; i++) {
				SwitchPanel switchPanel = switchPanelList.get(i);
				y = layoutDrawer(switchPanel, i, y, w, h);
			}
		}

		protected abstract int layoutDrawer(SwitchPanel switchPanel, int i,
				int y, int w, int h);
	}

	public static void main(String[] args) {
		JFrame f = new JFrame("JLayeredPane");
		f.setSize(255, 555);
		f.setLocationRelativeTo(null);
		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		f.setVisible(true);

		SwitchPane sp = new SwitchPane();
		JPanel p = new JPanel();
		p.add(new JLabel(":aaaa"));
		sp.addPane("Hello", p);

		JPanel p2 = new JPanel();
		p2.add(new JLabel(":aaa222a"));
		sp.addPane("Hello222", p2);

		f.setContentPane(sp);
		
		System.out.println("aaa\naaa");

	}
}
