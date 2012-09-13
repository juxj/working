package italk.client.bean;

import italk.util.ImageManager;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.swing.Icon;

/**
 * 状态
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class State {
	/**
	 * 
	 * 客户端状态
	 *
	 * @author solosky <solosky772@qq.com>
	 */
	public enum ClientState {
		/**
		 * 刚刚建立没有执行过登录过程
		 */
		NEW,
		
		/**
		 * 正在登录
		 */
		LOGGING,
		
		/**
		 * 用户取消
		 */
		CANCEL,
		
		/**
		 * 登录失败
		 */
		LOGIN_FAIL,	
		
		/**
		 * 网络出错，或者服务器连接不上
		 */
		NET_ERROR,
		
		/**
		 * 从其他客户端登录
		 */
		OTHER_LOGIN,
		
		/**
		 * 已经成功退出
		 */
		LOGOUT;
		
		private static ClientState currentState = ClientState.NEW;

		/**
		 * @return the currentState
		 */
		public static ClientState getCurrentState() {
			return currentState;
		}

		/**
		 * @param currentState the currentState to set
		 */
		public static void setCurrentState(ClientState currentState) {
			ClientState.currentState = currentState;
		}
	}
	
	/**
	 * 
	 * 好友状态
	 *
	 * @author solosky <solosky772@qq.com>
	 */
	public enum ContactState {
		
		/**
		 * 在线
		 */
		ONLINE,
		
		/**
		 * 离线
		 */
		OFFLINE,
		
		/**
		 * 空闲
		 */
		IDLE,
		
		/**
		 * 忙碌
		 */
		BUSY,
		
		/**
		 * 离开
		 */
		AWAY,
		
		/**
		 * 静音,请勿打扰
		 */
		SILENT,
		
		/**
		 * 隐身
		 */
		HIDDEN;
		
		public static ContactState valueOf(int state) {
			switch (state) {
			case 10:
				return ContactState.ONLINE;
			case 20:
				return ContactState.OFFLINE;
			case 30:
				return ContactState.AWAY;
			case 40:
				return ContactState.HIDDEN;
			case 50:
				return ContactState.BUSY;
			case 60:
				return ContactState.IDLE;
			case 70:
				return ContactState.SILENT;
			default:
				return OFFLINE;
			}
		}
		
		public static String toLowerCase(ContactState state) {
			return state.toString().toLowerCase();
		}
		
		public static List<ContactState> getBuddyList() {
			List<ContactState> status = new ArrayList<ContactState>();
	        status.add(ContactState.ONLINE);
	        status.add(ContactState.HIDDEN);
	        status.add(ContactState.IDLE);
	        status.add(ContactState.BUSY);
	        status.add(ContactState.AWAY);
	        status.add(ContactState.SILENT);
	        status.add(ContactState.OFFLINE);
			return status;
		}
		
		public static Icon getIconByState(ContactState state) {
			StringBuffer sb = new StringBuffer("status" + File.separator);
			String extension = ".png";
			sb.append(toLowerCase(state));
			sb.append(extension);
			return ImageManager.getImageIconByShortName(sb.toString());
		}
		
	}
}
