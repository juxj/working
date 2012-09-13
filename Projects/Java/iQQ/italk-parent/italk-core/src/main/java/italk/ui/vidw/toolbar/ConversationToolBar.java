package italk.ui.vidw.toolbar;

import italk.util.ImageManager;

import java.io.File;

import javax.swing.Icon;
import javax.swing.JButton;
import javax.swing.JToolBar;

/**
 * 对话工具条
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class ConversationToolBar extends JToolBar {
	public ConversationToolBar() {
		init();
		addButton();
	}

	/**
	 * 初始化
	 */
	private void init() {
		// TODO Auto-generated method stub
		this.setOrientation(JToolBar.VERTICAL);
		this.setFloatable(false);
	}

	/**
	 * 添加图标按钮
	 */
	private void addButton() {
		// TODO Auto-generated method stub
		JButton btnVideo = new JButton(getIconByShortName("video.png"));
		this.add(btnVideo);
		
		JButton btnFileTranfer = new JButton(getIconByShortName("file_tranfer.png"));
		this.add(btnFileTranfer);
		
		JButton btnDisussAdd = new JButton(getIconByShortName("disuss_add.png"));
		this.add(btnDisussAdd);
	}
	
	/**
	 * 获得icons目录下的图片
	 * 
	 * @param imageName
	 * @return
	 */
	private Icon getIconByShortName(String imageName) {
		return ImageManager.getImageIconByShortName("icons"
				+ File.separator + imageName);
	}
}
