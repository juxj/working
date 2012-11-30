<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>投资俱乐部_企业_用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript">
	function edit(){
		var url = "/service/requestInfoAction4User!edit.act";
		var user_status = "${session._user.auditstatus}";
		if (user_status != "2") {
			alert("您的注册资料尚未通过审核，暂不能发布此信息!");
		} else {
			window.location.href = url;
		}
	}
	
	function toPage(pageNo, useless) {
		document.getElementById("pageNo").value=pageNo;
		var frmQuery = document.getElementById("frmQueryRequestInfo");
		frmQuery.submit();
	}
</script>
</head>
<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<form id="frmQueryRequestInfo" action="/club/showRequestInfoHome.act"><input id="pageNo" type="hidden" name="pageNo"/> </form>

	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="M_menu">
		融资管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;融资俱乐部
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
<div class="container_950">
	<div class="box_4" style="height:90px;">	
		<div class="P_title">项目信息</div>
		<div class="line"  style="height:28px;"><input name="" type="button" value="发布信息"  onclick="edit();" class="but_gray" style="float: right; margin-right:20px;"/></div>
	</div>
	<div class="hr_10"> &nbsp; </div> 
	<!-- 表格 -->
	<table class="gold-table" >
	<th style="text-align:left;">资金标题</th>
	<th style="text-align:left;">发布时间</th>
	<th style="text-align:left;">项目分类</th>
	<th style="text-align:left;">所需资金</th>
	<th style="text-align:left;">融资方式</th>
	<th style="text-align:left;">状态</th>
	<th style="text-align:center;">操作</th>
	<s:if test="pager.data != null || pager.data.size>0">
		<s:iterator id="item" value="pager.data" status="st">
			<tr style="padding-left:8px;">
			<td title="${item.title}">
				<s:if test="#item.title.length()>10">
					<s:property value="#item.title.substring(0,10)"></s:property>...
				</s:if><s:else>
					${item.title}
				</s:else>
			</td>
			<td><s:date name="#item.lastPostDate" /></td>
			
			<td>
				<s:iterator id="projectTypeItem" value="projectTypeList">
		    		<s:if test="#projectTypeItem.code==#item.projectType">
		    			${projectTypeItem.name }
		    		</s:if>	
		    	</s:iterator>
			</td>
			<td>
				${item.needMoney }
			</td>
			<td title="${item.financeType }">
		    	<s:if test="#item.financeType==null or #item.financeType==''">
		    		不限
		    	</s:if>
				<s:elseif test="#item.financeType.length()>15">
					<s:property value="#item.financeType.substring(0,15)"></s:property>...
				</s:elseif><s:else>
					${item.financeType}
				</s:else>
			</td>
			<td>
				<s:if test="#item.rank==0 || #item.rank==9">
					未审核
				</s:if>
				
				<s:if test="#item.rank==1">
					已通过
				</s:if>
				
				<s:if test="#item.rank==-1">
					已阻止
				</s:if>
			</td>
			<td class="view_detail01" style="text-align:right;padding-right:20px"> 
				<a href="/service/requestInfoAction!detail.act?clbRequestInfoId=${item.id }">查看</a>
				<s:if test="#item.rank==0 || #item.rank==9">
					<a href="/service/requestInfoAction4User!edit.act?clbRequestInfoId=${item.id }">编辑</a>
				</s:if>
				<s:if test="#item.rank==-1">
					<a href="/service/requestInfoAction!delete.act?clbRequestInfoId=${item.id }">删除</a>
				</s:if>
			</td>
			</tr>
		</s:iterator>
	</s:if>
	</table>
	<jsp:include page="/public/pagination.jsp"></jsp:include>
</div>
<div class="clear"> &nbsp; </div>
<s:if test="pager.data == null || pager.data.size<=0">
       <div class="container_950 ">
			<div class="txt_content box_4">
			<s:if test="#session._user.userTypeGroup==5 || #session._user.userTypeGroup==1">
				<h5>您还未发布任何项目信息!</h5>
				<h6> 
				您可以<a href="javascript:edit();" class="red">点此免费发布项目信息</a>让资金方来找您，您也可以去<a href="/service/supplyInfoAction!home.act" class="red">融资俱乐部</a>寻找适合您的资金信息
				</h6>
			</s:if>
			</div>
       </div> 
</s:if> 
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>