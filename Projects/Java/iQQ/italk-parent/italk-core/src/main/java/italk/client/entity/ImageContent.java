package italk.client.entity;

/**
 * 聊天消息
 * 表情/图片
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class ImageContent extends AbstractContent {
	/**
	 * 表情
	 */
	public final static String FACE = "face";
	
	/**
	 * 在线图片
	 */
	public final static String CFACE = "cface";
	
	/**
	 * 离线图片
	 */
	public final static String OFFPIC = "offpic";
	
	/**
	 * id,比如表情id
	 */
	private int id;
	
	/**
	 * 名称
	 */
	private String name;
	
	/**
	 * 路径
	 */
	private String src;

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
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
	 * @return the src
	 */
	public String getSrc() {
		return src;
	}

	/**
	 * @param src the src to set
	 */
	public void setSrc(String src) {
		this.src = src;
	}
	
}
