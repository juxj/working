package italk.client.service;

import italk.client.bean.State.ContactState;
import italk.client.entity.Contact;
import italk.util.ImageManager;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.swing.Icon;

/**
 * 
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class ContactService {
	private static List<Contact> recentList = null;

	/**
	 * @return the recentList
	 */
	public static List<Contact> getRecentList() {
		recentList = new ArrayList<Contact>();
		
		Icon faceIcon = ImageManager.getImageIconByShortName("icons" + File.separator + "6208317.jpg");
		for(int i=0; i<10; i++) {
			Contact c = new Contact();
			c.setNickname("承$诺-index-" + "-" + i);
			c.setLnick("这是个性签名...." + "-" + i);
			c.setFace(faceIcon);
			c.setUin(i);
			c.setState(ContactState.AWAY);
			
			recentList.add(c);
		}
		return recentList;
	}

	/**
	 * @param recentList the recentList to set
	 */
	public static void setRecentList(List<Contact> recentList) {
		ContactService.recentList = recentList;
	}

}
