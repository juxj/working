package com.zj198.action.admin.ads;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.AdsItem;
import com.zj198.model.AdsPlace;
import com.zj198.model.AdsPost;
import com.zj198.service.ads.AdvertiseService;

public class PostAction extends BaseAction{
	private Integer placeId=0;
	private Integer itemId=0;
	private Integer postId;
	private AdsPost adsPost;
	private List<AdsPost> postList;
	private List<AdsItem> adsItemList;
	private List<AdsPlace> adsPlaceList;
	private AdvertiseService advertiseService;
	
	public String execute(){
		postList = advertiseService.findAllPost();
		return SUCCESS;
	}
	
	public String details(){
		adsPost = advertiseService.getPostById(postId);
		return "details";
	}
	
	public String bfAdd(){
		adsPlaceList = advertiseService.findAllPlace();
		adsItemList = advertiseService.findAllItem();
		return "add";
	}
	
	public String add(){
		if(advertiseService.addPost(adsPost)){
			msg = "增加成功";
		}else{
			msg = "增加失败, 不能重复在一个广告位添加同一个广告。";
		}
		adsPlaceList = advertiseService.findAllPlace();
		adsItemList = advertiseService.findAllItem();
		return "add";
	}

	public String edit(){
		adsPlaceList = advertiseService.findAllPlace();
		adsItemList = advertiseService.findAllItem();
		adsPost = advertiseService.getPostById(postId);
		return "edit";
	}
	
	public String update(){
		advertiseService.updatePost(adsPost);
		adsPlaceList = advertiseService.findAllPlace();
		adsItemList = advertiseService.findAllItem();
		msg = "修改成功";
		return "edit";
	}
	
	public String delete(){
		if(advertiseService.deletePost(postId)){
			msg = "删除成功";
		}else{
			msg = "删除失败，该发布已经不存在。";
		}
		return "ajax";
	}
	
	//setter and getter
	public AdsPost getAdsPost() {
		return adsPost;
	}

	public void setAdsPost(AdsPost adsPost) {
		this.adsPost = adsPost;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public void setPlaceId(Integer placeId) {
		this.placeId = placeId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public List<AdsPost> getPostList() {
		return postList;
	}

	public List<AdsItem> getAdsItemList() {
		return adsItemList;
	}

	public List<AdsPlace> getAdsPlaceList() {
		return adsPlaceList;
	}

	public void setAdvertiseService(AdvertiseService advertiseService) {
		this.advertiseService = advertiseService;
	}

	public Integer getPlaceId() {
		return placeId;
	}

	public Integer getItemId() {
		return itemId;
	}

	
//	private Integer relationId;
//	private RelationService relationService;
//	private ConfigService configService;
//	private static final String savePath="/s/";
//	
//	public String createJS(){
//		if(relationId!=null){
//			AdsRelation relation = relationService.getById(relationId);
//			Map<String,Object> params=new HashMap<String,Object>();
//			if(relation!=null){
//				params.put("url", configService.getByName("URL").getValue());
//				params.put("r", relationId);
//				try {
//					FreemarkerUtil.getContent("adsJS.htm", params, true, savePath, "at_"+relationId+".js");
//					msg=SUCCESS;
//					return AJAX;
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		}
//		msg=ERROR;
//		return AJAX;
//	}
//	
//	public String execute(){
//		ActionContext ctx = ActionContext.getContext();
//        ServletContext sctx = (ServletContext) ctx.get(ServletActionContext.SERVLET_CONTEXT);
//		File file=new File(sctx.getRealPath(savePath)+File.separator+"at_"+relationId+".js");
//		if (!file.exists()) {
//			createJS();
//			if(msg.trim().equals("error")){
//				msg = ERROR;
//				return AJAX;
//			}
//		}
//		msg = configService.getByName("URL").getValue()+savePath+"at_"+relationId+".js|"+configService.getByName("URL").getValue()+"/C.act?r="+relationId;
//		return AJAX;
//	}
//	
////	public String getJs(){
////		ActionContext ctx = ActionContext.getContext();
////        ServletContext sctx = (ServletContext) ctx.get(ServletActionContext.SERVLET_CONTEXT);
////		File file=new File(sctx.getRealPath(savePath)+File.separator+"at_"+relationId+".js");
////		if (!file.exists()) {
////			createJS();
////			if(msg.trim().equals("error")){
////				msg = ERROR;
////				return AJAX;
////			}
////		}
////		msg = configService.getByName("URL").getValue()+savePath+"at_"+relationId+".js|"+configService.getByName("URL").getValue()+"/C.act?r="+relationId;
////		return AJAX;
////	}
//	
//	//setter and getter
//	public void setRelationId(Integer relationId) {
//		this.relationId = relationId;
//	}
//
//	public void setRelationService(RelationService relationService) {
//		this.relationService = relationService;
//	}
//
//	public void setConfigService(ConfigService configService) {
//		this.configService = configService;
//	}
}
