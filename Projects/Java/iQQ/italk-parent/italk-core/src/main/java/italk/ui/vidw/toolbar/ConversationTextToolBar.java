package italk.ui.vidw.toolbar;

import italk.util.ImageManager;

import java.io.File;

import javax.swing.Icon;
import javax.swing.JButton;
import javax.swing.JToolBar;

/**
 * 
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class ConversationTextToolBar extends JToolBar {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 8540909782313490557L;

	public ConversationTextToolBar() {
		super();
		init();
		addButton();
	}
	
	/**
	 * 初始化
	 */
	private void init() {
		// TODO Auto-generated method stub
		this.setFloatable(false);
	}

	/**
	 * 添加图标按钮
	 */
	private void addButton() {
		// TODO Auto-generated method stub
		JButton btnFont = new JButton(getIconByShortName("font.png"));
		this.add(btnFont);
		
		JButton btnFace = new JButton(getIconByShortName("face.png"));
		this.add(btnFace);
		
		JButton btnImage = new JButton(getIconByShortName("image.png"));
		this.add(btnImage);
		
		JButton btnSreenshot = new JButton(getIconByShortName("sreenshot.png"));
		this.add(btnSreenshot);
		
		JButton btnShake = new JButton(getIconByShortName("shake.png"));
		this.add(btnShake);
		
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
