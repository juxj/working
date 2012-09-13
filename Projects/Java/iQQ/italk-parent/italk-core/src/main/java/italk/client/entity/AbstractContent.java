package italk.client.entity;

/**
 * 
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class AbstractContent {
	
	/**
	 * 内容类型
	 */
	private Type type;
	
	/**
	 * @return the type
	 */
	public Type getType() {
		return type;
	}



	/**
	 * @param type the type to set
	 */
	public void setType(Type type) {
		this.type = type;
	}



	public enum Type {
		TEXT, FONT, IMAGE, FACE
	}
}
