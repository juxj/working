package com.zj198.action.admin.user;
import java.io.IOException;
import java.io.InputStream;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.AdmUser;
import com.zj198.model.UsrOrgAttach;
import com.zj198.service.user.ProfileService;
import com.zj198.util.UploadUtil;

public class AdminDownloadImgAction extends BaseAction{
	private String imgName;
	private Integer attachId;
	private ProfileService profileService;
	
	public InputStream getAttachStream(){
		String downloadFileName="";
		if(attachId != 0){			
			UsrOrgAttach usrOrgAttach = profileService.getById(attachId);
			try {				
				imgName = java.net.URLEncoder.encode(usrOrgAttach.getOldFileName(), "UTF-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
			downloadFileName = usrOrgAttach.getFilePath();
		}
		InputStream is = UploadUtil.getFileStream(downloadFileName);
		if(is == null){
			is = new InputStream() {
				
				@Override
				public int read() throws IOException {
					return 0;
				}
			};
		}
		return is;
	}
	
	@Override
	public String execute() throws Exception {
		// TODO DownloadImgAction
		ActionContext context = ActionContext.getContext();
		AdmUser admin = (AdmUser)context.getSession().get("_admin");
		if(admin == null){
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	//--------get----set-----
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public void setAttachId(Integer attachId) {
		this.attachId = attachId;
	}
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
	
}
