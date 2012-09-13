package italk.client.entity;

import java.util.LinkedList;
import java.util.List;

/**
 * 聊天消息
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class Message {
	
	/**
	 * 消息发送者
	 */
	private Contact sender;
	
	/**
	 * 消息内容
	 * 列表：字体/表情/图片
	 */
	private List<AbstractContent> contentList;
	
	/**
	 * 构造方法
	 * 初始化
	 */
	public Message(){
		this.contentList = new LinkedList<AbstractContent>();
	}
	
	/**
	 * 构造方法
	 * 初始化
	 * @param sender
	 */
	public Message(Contact sender){
		this.contentList = new LinkedList<AbstractContent>();
		this.sender = sender;
	}
	
	/**
	 * 构造方法
	 * 初始化
	 * @param sender
	 * @param contentList
	 */
	public Message(Contact sender, List<AbstractContent> contentList){
		this.contentList = contentList;
		this.sender = sender;
	}

	/**
	 * @return the sender
	 */
	public Contact getSender() {
		return sender;
	}

	/**
	 * @param sender the sender to set
	 */
	public void setSender(Contact sender) {
		this.sender = sender;
	}

	/**
	 * @return the contentList
	 */
	public List<AbstractContent> getContentList() {
		return contentList;
	}

	/**
	 * @param contentList the contentList to set
	 */
	public void setContentList(List<AbstractContent> contentList) {
		this.contentList = contentList;
	}
	
	/**
	 * @param content the content to contentList
	 */
	public void addContent(AbstractContent content) {
		this.contentList.add(content);
	}
	
}
