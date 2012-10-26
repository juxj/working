package com.zj198.action.club;

import com.zj198.action.BaseAction;
import com.zj198.model.UsrBank;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrFinanceorg;
import com.zj198.model.UsrServiceorg;
import com.zj198.model.UsrUser;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;

public class BaseClubAction extends BaseAction {

	protected ProfileService profileService;
	protected AccountService accountService;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	protected int getUserGroup(UsrUser user) {
		return this.profileService.getGroupidByUserType(user.getType());
	}
	
	protected String[] getUserInfo(UsrUser user) {
		String userInfo[] = new String[2];
		userInfo[0] = String.valueOf(user.getViptype());
		int group = this.getUserGroup(user);
		
		Object obj = this.profileService.getProfiles(user.getId());
		if (obj != null) {
			if (group == Constants.USERTYPE_GROUP_BANK) {
				UsrBank bank = (UsrBank) obj;
				userInfo[1] = bank.getDetailname();
			}
			
			if (group == Constants.USERTYPE_GROUP_COMPANY) {
				UsrCompany company = (UsrCompany)obj;
				userInfo[1] = company.getCompanyname();
			}
			
			if (group == Constants.USERTYPE_GROUP_FINANCEORG) {
				UsrFinanceorg org = (UsrFinanceorg) obj;
				userInfo[1] = org.getOrgname();
			}
			
			if (group == Constants.USERTYPE_GROUP_PERSONAL) {
				userInfo[1] = user.getRealname();
			}
			
			if (group == Constants.USERTYPE_GROUP_SERVICEORG){
				UsrServiceorg org = (UsrServiceorg) obj;
				userInfo[1] = org.getOrgname();
			}
		}
		return userInfo;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

}
