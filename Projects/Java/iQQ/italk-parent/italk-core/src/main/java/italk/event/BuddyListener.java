package italk.event;

import java.util.EventListener;

public interface BuddyListener extends EventListener {
  
  /**
   * 好友已经登录
   * @param e
   */
  public void buddyLogined(BuddyEvent e);
  
  /**
   * 好友已经注销
   * @param e
   */
  public void buddyLogout(BuddyEvent e);
  

}
