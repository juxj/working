package italk.client.service;

import italk.client.bean.State.ContactState;
import italk.client.entity.Category;
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
public class CategoryService {
	private static List<Category> categoryList = null;
	private static List<Contact> contactList = null;
	
	/**
	 * @return the categoryList
	 */
	public synchronized static List<Category> getCategoryList() {
		categoryList = new ArrayList<Category>();
		Category c = null;
		for(int i=0; i<10; i++) {
			c = new Category();
			c.setIndex(i);
			c.setSort(i);
			c.setName("好友分组-" + i);
			c.setOnlineCount(10);
			c.setContactList(getContactList(i));
			categoryList.add(c);
		}
		System.out.println("categoryList:" + categoryList.size());
		return categoryList;
	}

	/**
	 * @param categoryList the categoryList to set
	 */
	public static void setCategoryList(List<Category> categoryList) {
		CategoryService.categoryList = categoryList;
	}

	/**
	 * @return the contactList
	 */
	public static List<Contact> getContactList(int index) {
		contactList = new ArrayList<Contact>();
    	Icon faceIcon = ImageManager.getImageIconByShortName("icons" + File.separator + "6208317.jpg");
		for(int i=0; i<10; i++) {
			Contact c = new Contact();
			c.setNickname("承$诺-index-" + index + "-" + i);
			c.setLnick("这是个性签名...." + index + "-" + i);
			c.setFace(faceIcon);
			c.setUin(i);
			c.setState(ContactState.AWAY);
			
			contactList.add(c);
		}
		return contactList;
	}

	/**
	 * @param contactList the contactList to set
	 */
	public static void setContactList(List<Contact> contactList) {
		CategoryService.contactList = contactList;
	}
	
	
	
}
