package italk.util;

/**
 * 
  * String Util. <code>null</code> value could be accepted. 
  * 
  * @author steven0lisa
  * @create-time Jul 27, 2012 8:13:24 PM
 */
public abstract class Strings {
	
	public static boolean isEmpty(String str){
		return str == null ? true : str.isEmpty();
	}

}
