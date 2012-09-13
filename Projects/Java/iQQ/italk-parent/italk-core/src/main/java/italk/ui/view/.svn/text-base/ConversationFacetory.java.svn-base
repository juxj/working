package italk.ui.view;

import italk.ui.ConversationFrame;
import italk.ui.vidw.panel.ConversationPanel;
import italk.ui.vidw.toolbar.ConversationTextToolBar;
import italk.ui.vidw.toolbar.ConversationToolBar;

/**
 * 
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class ConversationFacetory {
	private static ConversationFrame conversationFrame = null;

	/**
	 * 创建对话
	 */
	public static void createConversation(Object obj) {
		ConversationFrame cFrame = getConversationFrame();
		cFrame.addConversation(newConversationPanel(obj));
		cFrame.setVisible(true);
	}

	/**
	 * @return the conversationFrame
	 */
	public static ConversationFrame getConversationFrame() {
		if (conversationFrame == null) {
			conversationFrame = new ConversationFrame();
		}
		return conversationFrame;
	}

	/**
	 * @return the conversationPanel
	 */
	public static ConversationPanel newConversationPanel(Object obj) {
		return new ConversationPanel(obj);
	}

	/**
	 * @return the conversationToolBar
	 */
	public static ConversationToolBar getConversationToolBar() {
		return new ConversationToolBar();
	}

	/**
	 * @return the conversationTextToolBar
	 */
	public static ConversationTextToolBar getConversationTextToolBar() {
		return new ConversationTextToolBar();
	}

}
