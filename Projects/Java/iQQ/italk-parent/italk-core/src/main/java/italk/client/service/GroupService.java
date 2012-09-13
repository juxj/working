package italk.client.service;

import italk.client.bean.State.ContactState;
import italk.client.entity.Contact;
import italk.client.entity.Group;
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
public class GroupService {
	private static List<Group> groupList = null;
	private static List<Group> disussList = null;

	/**
	 * @return the groupList
	 */
	public static List<Group> getGroupList() {
		groupList = new ArrayList<Group>();
		Icon faceIcon = ImageManager.getImageIconByShortName("icons" + File.separator + "group_face.jpg");
		for(int i=0; i<10; i++) {
			Group g = new Group();
			g.setName("群-" + i);
			g.setId(i);
			g.setFace(faceIcon);
			groupList.add(g);
		}
		
		return groupList;
	}

	/**
	 * @param groupList the groupList to set
	 */
	public static void setGroupList(List<Group> groupList) {
		GroupService.groupList = groupList;
	}

	/**
	 * @return the disussList
	 */
	public static List<Group> getDisussList() {
		disussList = new ArrayList<Group>();
		Icon faceIcon = ImageManager.getImageIconByShortName("icons" + File.separator + "group_face.jpg");
		for(int i=0; i<10; i++) {
			Group g = new Group();
			g.setName("讨论组-" + i);
			g.setId(i);
			g.setFace(faceIcon);
			g.setDiscuss(true);
			disussList.add(g);
		}
		
		return disussList;
	}

	/**
	 * @param disussList the disussList to set
	 */
	public static void setDisussList(List<Group> disussList) {
		GroupService.disussList = disussList;
	}
	
}
