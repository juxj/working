
package com.zj198.action.club;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.UsrUser;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;


public class ClubAction extends BaseAction {
	
	private ProfileService profileService;

	@Override
	public String execute() throws Exception {
		
		String result = null;
		
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		
		int group = profileService.getGroupidByUserType(user.getType().shortValue());
		
		if (group == Constants.USERTYPE_GROUP_COMPANY || group == Constants.USERTYPE_GROUP_PERSONAL) {
			result = "requestHome";
		}
		
		if (group == Constants.USERTYPE_GROUP_BANK || group == Constants.USERTYPE_GROUP_FINANCEORG) {
			result = "supplyHome";
		}
		
		return result;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
	
	
}
