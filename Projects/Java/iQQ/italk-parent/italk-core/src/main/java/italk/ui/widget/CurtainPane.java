package italk.ui.widget;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.LayoutManager;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.Icon;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JLayeredPane;
import javax.swing.SwingConstants;
import javax.swing.Timer;

/**
 * 抽屉式面板切换
 * SwitchPane代替
 * 
 * @author chenzhihui
 */
public class CurtainPane extends JLayeredPane {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 6396374810497164992L;

	/**
	 * 切换速度调整 0.0 -- 1.0
	 */
	private static double DELTA = 0.3;
	private static int ANIMATION_INTERVAL = 15;
	/**
	 * 按钮高度
	 */
	private static int PREFERED_HEIGHT = 22;

	private ArrayList<CurtainDrawer> drawers = new ArrayList<CurtainDrawer>();
	private int selectedPane;
	private int currentLayer = 0;
	private CurtainPaneLayout curtain_layout;
	private boolean animated;

	/** Creates a new instance of CurtainPane */
	public CurtainPane() {
		curtain_layout = new CurtainPaneLayout();
		setLayout(curtain_layout);
	}

	/**
	 * 添加面板显示
	 * 
	 * @param title
	 * @param comp
	 */
	public void addPane(String title, Component comp) {
		addPane(title, null, comp);
	}

	/**
	 * 添加面板显示
	 * 
	 * @param title
	 * @param icon
	 * @param comp
	 */
	public void addPane(String title, Icon icon, Component comp) {
		animated = true;
		JButton btn = new JButton(title, icon);
		btn.setHorizontalAlignment(SwingConstants.LEFT);
		btn.setFocusable(false);
		CurtainDrawer drawer = new CurtainDrawer(btn, comp);
		btn.addActionListener(new ExtendingAction(drawer));
		add(drawer, new Integer(currentLayer++));
		drawers.add(drawer);
		selectedPane++;
	}

	public void setSelectedPane(int selectedIndex) {
		selectedPane = selectedIndex;
		doLayout();
	}

	private void resetLayer(int n) {
		setLayout(curtain_layout);
		setSelectedPane(n);
	}

	public boolean isAnimated() {
		return animated;
	}

	public void setAnimated(boolean animated) {
		this.animated = animated;
	}

	class ExtendingAction implements ActionListener {
		private CurtainDrawer drawer;
		private Timer timer;
		private AnimationAction action;

		public ExtendingAction(CurtainDrawer cd) {
			drawer = cd;
		}

		public void actionPerformed(ActionEvent e) {
			int layer = drawers.indexOf(drawer);
			if (layer != selectedPane) {
				setSelect(layer);
			} else {
				setSelect(currentLayer);
			}
		}

		public void setSelect(int layer) {
			if (isAnimated()) {
				if (timer != null && timer.isRunning())
					timer.stop();
				timer = new Timer(ANIMATION_INTERVAL, null);
				if(action == null) {
					action = new AnimationAction(timer, layer);
				} else {
					action.setTimer(timer);
					action.setExpandingPane(layer);
				}
				timer.addActionListener(action);
				timer.start();
			} else {
				setSelectedPane(layer);
			}
		}
	}

	class CurtainDrawer extends JComponent {
		/**
		 * serialVersionUID
		 */
		private static final long serialVersionUID = -3916583951168171365L;

		public CurtainDrawer(JButton cpb, Component comp) {
			setLayout(new BorderLayout());
			add(cpb, BorderLayout.NORTH);
			add(comp, BorderLayout.CENTER);
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
			int size = drawers.size();
			int h = parent.getHeight() - (size - 1) * PREFERED_HEIGHT;
			int w = parent.getWidth();
			int y = 0;
			for (int i = 0; i < size; i++) {
				CurtainDrawer drawer = drawers.get(i);
				y = layoutDrawer(drawer, i, y, w, h);
			}
		}

		protected abstract int layoutDrawer(CurtainDrawer drawer, int i, int y,
				int w, int h);
	}

	class AnimationLayout extends Layout {
		private double ratio;
		private int expandingPane;

		public AnimationLayout(double ratio, int expandingPaneIndex) {
			this.ratio = ratio;
			this.expandingPane = expandingPaneIndex;
		}

		public void setRatio(double ratio) {
			this.ratio = ratio;
		}

		protected int layoutDrawer(CurtainDrawer drawer, int i, int y, int w,
				int h) {
			if (selectedPane == i) {
				int delta = (int) (h - (h - PREFERED_HEIGHT) * ratio);
				drawer.setBounds(0, y, w, h);
				return y + delta;
			} else if (expandingPane == i) {
				int delta = (int) ((h - PREFERED_HEIGHT) * ratio)
						+ PREFERED_HEIGHT;
				drawer.setBounds(0, y, w, h);
				return y + delta;
			} else {
				drawer.setBounds(0, y, w, h);
				return y + PREFERED_HEIGHT;
			}
		}
		
		public void setExpandingPane(int expandingPane){
			this.expandingPane = expandingPane;
		}
	}

	class CurtainPaneLayout extends Layout {
		protected int layoutDrawer(CurtainPane.CurtainDrawer drawer, int i,
				int y, int w, int h) {
			drawer.setBounds(0, y, w, h);
			if (selectedPane == i)
				return y + h;
			else
				return y + PREFERED_HEIGHT;
		}
	}

	class AnimationAction implements ActionListener {
		private AnimationLayout layout;
		private Timer timer;
		private int expandingPane;
		private double ratio = 0;

		public AnimationAction(Timer timer, int expandingPaneIndex) {
			this.timer = timer;
			expandingPane = expandingPaneIndex;
			layout = new AnimationLayout(ratio, expandingPane);
			CurtainPane.this.setLayout(layout);
		}

		public void actionPerformed(ActionEvent e) {
			ratio += DELTA;
			if (ratio > 1.0) {
				resetLayer(expandingPane);
				if (timer != null) {
					timer.stop();
					timer = null;
				}
			} else {
				layout.setRatio(ratio);
				CurtainPane.this.doLayout();
			}
		}

		public void setTimer(Timer timer) {
			this.timer = timer;
		}
		
		public void setExpandingPane(int expandingPane){
			this.expandingPane = expandingPane;
			layout.setExpandingPane(expandingPane);
			CurtainPane.this.setLayout(layout);
		}
	}
}