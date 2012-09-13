package italk.event;

import java.util.EventListener;

/**
 * 登录事件监听器，用于监听iQQ用户登录
 * @author 刘永伟(manlge)
 * @version 1.0
 */
public interface LoginListener extends EventListener {
  
  /**
   * 正在登录
   * @param e
   */
  public void logging(LoginEvent e);
  
  /**
   * 登录失败
   * @param e
   */
  public void loginFailure(LoginEvent e);
  
  /**
   * 已登录
   * @param e
   */
  public void logined(LoginEvent e);
  
  /**
   * 注销
   */
  public void logout(LoginEvent e);
}
