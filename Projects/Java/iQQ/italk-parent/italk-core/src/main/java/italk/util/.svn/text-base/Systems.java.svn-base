package italk.util;

import italk.Logger;

import java.net.URI;

/**
 * 
  * System Util
  * 
  * @author steven0lisa
  * @create-time Jul 27, 2012 11:08:57 PM
 */
public abstract class Systems {

	/**
	 * Open URL
	 * @param urlStr
	 */
    public static void openURL(String urlStr) {
        try {
            URI url = new URI(urlStr);
            java.awt.Desktop.getDesktop().browse(url);
        } catch (Exception ex) {
        	Logger.error(ex, "Failed to open url[%s]!", urlStr);
        } 
    }
}
