package italk.client.entity;

/**
 * QQ好友类别
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
import java.util.ArrayList;
import java.util.List;

public class Category {
    private int index;			//列表索引
    private int sort;			//排序
    private String name;		//名称
    private int onlineCount;	//在线总数
    
    private List<Contact> contactList = new ArrayList<Contact>();

	/**
	 * @return the index
	 */
	public int getIndex() {
		return index;
	}

	/**
	 * @param index the index to set
	 */
	public void setIndex(int index) {
		this.index = index;
	}

	/**
	 * @return the sort
	 */
	public int getSort() {
		return sort;
	}

	/**
	 * @param sort the sort to set
	 */
	public void setSort(int sort) {
		this.sort = sort;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the onlineCount
	 */
	public int getOnlineCount() {
		return onlineCount;
	}

	/**
	 * @param onlineCount the onlineCount to set
	 */
	public void setOnlineCount(int onlineCount) {
		this.onlineCount = onlineCount;
	}

	/**
	 * @return the contactList
	 */
	public List<Contact> getContactList() {
		return contactList;
	}

	/**
	 * @param contactList the contactList to set
	 */
	public void setContactList(List<Contact> contactList) {
		this.contactList = contactList;
	}

}
