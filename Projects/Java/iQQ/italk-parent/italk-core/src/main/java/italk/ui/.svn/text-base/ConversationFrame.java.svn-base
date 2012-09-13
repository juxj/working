package italk.ui;

import italk.ui.bean.CloseTabIcon;
import italk.ui.bean.ConversationType;
import italk.ui.vidw.panel.ConversationPanel;
import italk.ui.widget.StandardFrame;
import italk.util.ImageManager;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Rectangle;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.swing.Icon;
import javax.swing.JFrame;
import javax.swing.JTabbedPane;
import javax.swing.WindowConstants;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

/**
 * 对话窗口
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class ConversationFrame extends StandardFrame {
	private JTabbedPane tabConversation = null;
	private Map<String, Integer> uinMap = null;

	public ConversationFrame() {
		super();
		super.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		super.setPreferredSize(new Dimension(580, 460));
		super.setSize(new Dimension(580, 460));
		super.setLocationRelativeTo(null);
		super.setLayout(new BorderLayout());
		
		this.init();
		this.initAction();
	}

	/**
	 * 初始化
	 */
	private void init() {
		// TODO Auto-generated method stub

		tabConversation = new JTabbedPane(JTabbedPane.BOTTOM);
		tabConversation.setFocusable(false);
		this.setContentPane(tabConversation);

		uinMap = new HashMap<String, Integer>();
		
		this.addWindowListener(new WindowAdapter() {
			/* (non-Javadoc)
			 * @see java.awt.event.WindowAdapter#windowClosing(java.awt.event.WindowEvent)
			 */
			@Override
			public void windowClosing(WindowEvent e) {
				// TODO Auto-generated method stub
				setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
				ConversationFrame.this.dispose();
			}
		});
		
		/**
		 * 当状态改变编辑框架获得焦点
		 */
		tabConversation.addChangeListener(new ChangeListener() {
			
			@Override
			public void stateChanged(ChangeEvent e) {
				// TODO Auto-generated method stub
				tabSelectedRequestFocusEditorPane();
			}
		});
	}
	
	public synchronized void addConversation(ConversationPanel cpanel) {
		String key = String.valueOf(cpanel.getUinId());
		//如果对话已经创建，直接选择该对话
		if (uinMap.containsKey(key)) {
			tabConversation.setSelectedIndex(uinMap.get(key));
			return;
		}
		String title = null;
		if (cpanel.getType() == ConversationType.CONTACT) {
			title = cpanel.getContact().getNickname();
		} else if (cpanel.getType() == ConversationType.GROUP) {
			title = cpanel.getGroup().getName();
		}
		//关闭图标
		Icon icon = ImageManager.getImageIconByShortName("icons"
				+ File.separator + "close.png");
		tabConversation.addTab(title, new CloseTabIcon(icon), cpanel);
		
		uinMap.put(key, new Integer(tabConversation.getTabCount() - 1));
		tabConversation.setSelectedIndex(uinMap.get(key));
		//编辑框架获得焦点
		super.pack();
		tabSelectedRequestFocusEditorPane();
	}

	/**
	 * 初始化操作
	 */
	private void initAction() {
		// TODO Auto-generated method stub
		//关闭对话事件
		tabConversation.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				int tabNumber = tabConversation.getUI().tabForCoordinate(
						tabConversation, e.getX(), e.getY());
				if (tabNumber < 0) {
					return;
				}
				// Log.println("tabNumber: " + tabNumber);
				Rectangle rect = ((CloseTabIcon) tabConversation
						.getIconAt(tabNumber)).getBounds();
				if (rect.contains(e.getX(), e.getY())) {
					// the tab is being closed
					removeTabAt(tabNumber);
					if (tabConversation.getTabCount() == 0) {
						dispose();
					}
				}
			}
		});
	}

	/**
	 * 编辑框架获得焦点
	 */
	private void tabSelectedRequestFocusEditorPane() {
		ConversationPanel cp = (ConversationPanel)tabConversation.getSelectedComponent();
		if(cp != null) {
			cp.requestFocusEditorPane();
		}
	}
	
	/**
	 * 删除map中的对话id，并且从tab面板中删除
	 * @param index
	 */
	public void removeTabAt(int index) {

		ConversationPanel cpanel = (ConversationPanel) tabConversation
				.getComponentAt(index);
		String key = String.valueOf(cpanel.getUinId());
		uinMap.remove(key);
		tabConversation.removeTabAt(index);
		
		this.validate();
		this.setVisible(true);
		tabSelectedRequestFocusEditorPane();
	}

	/**
	 * 销毁窗口
	 */
	public void dispose() {
		if (uinMap != null) {
			uinMap.clear();
		}
		if (tabConversation != null) {
			tabConversation.removeAll();
		}
		super.dispose();
	}
	
}
