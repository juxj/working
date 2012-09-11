package com.zj198.action.admin.user;

import java.util.Calendar;
import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.DicCommon;
import com.zj198.model.UserModel;
import com.zj198.model.UsrContract;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;

public class UserContractAction extends BaseAction{
	
	private final static Integer PAGE_SIZE = 20;

	private List<DicCommon> contractList;

	private Pager userContractList;
	
	private Integer contractId;
	private UsrContract contract;
	
	private DictoryDataService dictoryDataService;
	private ProfileService profileService;
	private AccountService accountService;
	
	private Integer pageNo;
	private List<UserModel> userList;
	
	
	private String userName;
	private Short userType;
	
	public String showContractHome(){
		this.getContractHomeData();
		return "contractHome";
	}
	
	public String getUserListByName(){
//		HttpServletResponse response = ServletActionContext.getResponse();
		userList = this.profileService.getUserList(userType, userName);
//		Gson gson = new Gson();
//		String json = gson.toJson(list);
//		try {
//			response.setCharacterEncoding("UTF-8");
//			response.getWriter().write(json);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		return "json";
	}
	
	public String editContract(){
		this.contractList = this.dictoryDataService.findCommonDataByGroupId(Constants.CONTRACT_GROUP);
		this.contract = this.accountService.getUserContract(contractId);
		if (contract == null) {
			contract = new UsrContract();
		}
		return "editContract";
	}
	
	public String createContract(){
		this.contractList = this.dictoryDataService.findCommonDataByGroupId(Constants.CONTRACT_GROUP);
		this.contract = new UsrContract();
		contract.setSignedDate(Calendar.getInstance().getTime());
		return "editContract";
	}
	
	public String saveContract(){
		this.accountService.saveOrUpdateUsrContract(contract);
		this.getContractHomeData();
		return "contractHome";
	}
	
	
	private void getContractHomeData() {
		pageNo = null==pageNo ? 1: pageNo;
		userContractList = (Pager) this.accountService.findUserContracts(PAGE_SIZE, pageNo);
	}

	@Override
	public String execute() throws Exception {
		return null;
	}

	public List<DicCommon> getContractList() {
		return contractList;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}


	public Integer getContractId() {
		return contractId;
	}

	public void setContractId(Integer contractId) {
		this.contractId = contractId;
	}

	public UsrContract getContract() {
		return contract;
	}

	public void setContract(UsrContract contract) {
		this.contract = contract;
	}

	public Pager getUserContractList() {
		return userContractList;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Short getUserType() {
		return userType;
	}

	public void setUserType(Short userType) {
		this.userType = userType;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public List<UserModel> getUserList() {
		return userList;
	}

}
