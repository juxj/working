package italk.ui.vidw.panel;

import italk.client.entity.Contact;
import italk.client.entity.Group;
import italk.ui.bean.ConversationType;
import italk.ui.view.ConversationFacetory;
import italk.util.ImageManager;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.io.File;

import javax.swing.Icon;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSeparator;
import javax.swing.JSplitPane;
import javax.swing.JTextPane;
import javax.swing.border.EmptyBorder;

/**
 * 
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class ConversationPanel extends JPanel {
	
	private long uinId = 0;
	private Object obj = null;
	private ConversationType type = null;
	private Contact contact = null;
	private Group group = null;
	
	private JTextPane conversationEditorPane = null;
	private JTextPane conversationTextPane = null;
	
	private JLabel lblFace = null;
	private JLabel lblName = null;
	private JLabel lblInfo = null;
	
	public ConversationPanel() {
		super();
		super.setLayout(new BorderLayout());
	}
	
	public ConversationPanel(Object obj) {
		this();
		this.obj = obj;
		this.init();
	}
	
	/* 
	 * (non-Javadoc)JTextPane
	 */
	public void init() {
		// TODO Auto-generated method stub
		this.initConversationEditorPane();
		this.initConversationTextPane();
		this.add(initConversationHeaderPanel(), BorderLayout.NORTH); //height 50
		this.add(initConversationContainerPanel(), BorderLayout.CENTER);
		this.checkType();
	}
	
	/**
	 * 初始化头部面板,头像/名字/个性签名
	 */
	private JPanel initConversationHeaderPanel() {
		JPanel conversationHeaderPanel  = new JPanel(new BorderLayout());
		Icon defIcon = ImageManager.getImageIconByShortName("icons" + File.separator + "6208317.jpg");
		lblFace = new JLabel(defIcon);
		lblName = new JLabel("承$诺");
		lblInfo = new JLabel("世界上最可怕的事是，比你聪明的人却比你还努力。");
		
		lblFace.setFocusable(false);
		lblName.setFocusable(false);
		lblInfo.setFocusable(false);
		
		lblFace.setBorder(new EmptyBorder(10,10,10,10));
		lblName.setBorder(new EmptyBorder(10,0,0,5));
		
		conversationHeaderPanel.add(lblFace, BorderLayout.WEST);
		JPanel p = new JPanel(new BorderLayout());
		p.add(lblName, BorderLayout.PAGE_START);
		p.add(lblInfo, BorderLayout.CENTER);
		conversationHeaderPanel.add(p, BorderLayout.CENTER);
		
		return conversationHeaderPanel;
	}

	/**
	 * 初始化主要内容面板
	 * 画分左右两边面板
	 * 左 右
	 */
	private JPanel initConversationContainerPanel() {
		JPanel conversationContainerPanel = new JPanel(new BorderLayout());
		
		JSplitPane sp = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT,
				initConversationLeftPanel(), initConversationRightPanel());
		sp.setFocusable(false);
		sp.setOneTouchExpandable(true);
		conversationContainerPanel.add(sp);
		
		return conversationContainerPanel;
	}
	
	/**
	 * 初始化左边内容面板
	 * 画分上下两个面板
	 * 上 下
	 */
	private JPanel initConversationLeftPanel(){
		JPanel conversationLeftPanel = new JPanel(new BorderLayout());
		JPanel bottomPanel = new JPanel(new BorderLayout());
		
		JSplitPane sp = new JSplitPane(JSplitPane.VERTICAL_SPLIT,
				ConversationFacetory.getConversationToolBar(), bottomPanel);
		sp.setOneTouchExpandable(true);
		
		conversationLeftPanel.add(sp);
		
		return conversationLeftPanel;
	}
	
	/**
	 * 初始化右边内容面板
	 * 画分上下两个面板
	 * 上:信息显示面板 下:输入编辑框，还有表情工具条
	 */
	private JPanel initConversationRightPanel() {
		JPanel conversationRightPanel = new JPanel(new BorderLayout());
		
		conversationRightPanel.add(new JSeparator(JSeparator.HORIZONTAL), BorderLayout.PAGE_START);
		conversationRightPanel.add(conversationTextPane, BorderLayout.CENTER);
		JPanel bottomPanel = new JPanel(new BorderLayout());
		bottomPanel.add(new JSeparator(JSeparator.HORIZONTAL), BorderLayout.PAGE_START);
		bottomPanel.add(new JScrollPane(conversationEditorPane), BorderLayout.CENTER);
		bottomPanel.add(ConversationFacetory.getConversationTextToolBar(), BorderLayout.PAGE_END);
		conversationRightPanel.add(bottomPanel, BorderLayout.PAGE_END);
		
		return conversationRightPanel;
	}
	
	/**
	 * 编辑框
	 */
	private void initConversationEditorPane() {
		conversationEditorPane = new JTextPane();
		conversationEditorPane.setBackground(java.awt.SystemColor.text);
		conversationEditorPane.setAutoscrolls(true);
		conversationEditorPane.setFocusable(true);
		conversationEditorPane.requestFocus(true);
		
		conversationEditorPane.addKeyListener(new KeyAdapter() {
			/* (non-Javadoc)
			 * @see java.awt.event.KeyAdapter#keyPressed(java.awt.event.KeyEvent)
			 */
			@Override
			public void keyPressed(KeyEvent e) {
				// TODO Auto-generated method stub
				super.keyPressed(e);
				if(e.getKeyCode() == KeyEvent.VK_ENTER && e.getModifiers() == KeyEvent.CTRL_MASK) {
					System.out.println("conversationEditorPane");
					conversationTextPane.insertIcon(lblFace.getIcon());
					JLabel text = new JLabel(conversationEditorPane.getText());
					text.setForeground(Color.red);
					text.setBackground(Color.pink);
					conversationTextPane.insertComponent(text);
					conversationEditorPane.setText("");
				}
			}
		});
	}
	
	/**
	 * 编辑框获得焦点
	 * @return conversationEditorPane
	 */
	public JTextPane requestFocusEditorPane(){
		conversationEditorPane.grabFocus();
		conversationEditorPane.requestFocus();
		conversationEditorPane.requestFocusInWindow();
		return conversationEditorPane;
	}
	
	/**
	 * 消息显示面板
	 */
	private void initConversationTextPane() {
		conversationTextPane = new JTextPane();
		conversationTextPane.setBackground(java.awt.SystemColor.text);
		conversationTextPane.setAutoscrolls(true);
		conversationTextPane.setEditable(false);
		conversationTextPane.setFocusable(false);
	}
	
	/**
	 * 检查对话类型
	 */
	private void checkType() {
		// TODO Auto-generated method stub
		if(obj instanceof Contact) {
			type = ConversationType.CONTACT;
			contact = (Contact) obj;
			uinId = contact.getUin();
			
			lblFace.setIcon(contact.getFace());
			lblName.setText(contact.getNickname());
			lblInfo.setText(contact.getLnick());
			
		} else if(obj instanceof Group) {
			type = ConversationType.GROUP;
			group = (Group) obj;
			uinId = group.getId();
			
			lblFace.setIcon(group.getFace());
			lblName.setText(group.getName());
			lblInfo.setText(group.getIntroduction());
		}
	}

	/**
	 * @return the obj
	 */
	public Object getObj() {
		return obj;
	}

	/**
	 * @param obj the obj to set
	 */
	public void setObj(Object obj) {
		this.obj = obj;
	}

	/**
	 * @return the type
	 */
	public ConversationType getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(ConversationType type) {
		this.type = type;
	}

	/**
	 * @return the contact
	 */
	public Contact getContact() {
		return contact;
	}

	/**
	 * @param contact the contact to set
	 */
	public void setContact(Contact contact) {
		this.contact = contact;
	}

	/**
	 * @return the group
	 */
	public Group getGroup() {
		return group;
	}

	/**
	 * @param group the group to set
	 */
	public void setGroup(Group group) {
		this.group = group;
	}

	/**
	 * @return the uinId
	 */
	public long getUinId() {
		return uinId;
	}

	/**
	 * @param uinId the uinId to set
	 */
	public void setUinId(long uinId) {
		this.uinId = uinId;
	}

}
