<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>投资俱乐部_银行_用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript">
	function edit(){
		var url = "/service/supplyInfoAction4User!editFirstStep.act";
		var user_status = "${session._user.auditstatus}";
		if (user_status != "2") {
			alert("您的注册资料尚未通过审核，暂不能发布此信息!");
		} else {
			window.location.href = url;
		}
	}
	
	function toPage(pageNo, useless) {
		document.getElementById("pageNo").value= pageNo;
		var frmQuery = document.getElementById("frmQuerySupplyInfo");
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
<form id="frmQuerySupplyInfo" action="/club/showSupplyInfoHome.act"><input id="pageNo" type="hidden" name="pageNo"/> </form>
<div class="hr_10"> &nbsp; </div>
<div class="clear"> &nbsp;</div>
<div class="container_950">
<div class="M_menu">
		融资管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;融资俱乐部
</div>
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div> 
<div class="box_4">
	<div class="P_title">资金信息</div>
	<div class="line" style="height:30px;"><input name="" type="button" value="发布信息"  onclick="edit();" class="but_gray" style="float: right; margin-right:20px;"/></div>
	</div>
	<div class="hr_10"> &nbsp; </div> 
	<!-- 表格 -->	
	<table class="container_950 box_4">
		<tr class="top_color">
		<td width="35%" style="padding-left:20px;">资金标题</td>
		<td>发布时间</td>
		<td width="8%">项目分类</td>
		<td>资金数额</td>
		<td width="12%">投资方式</td>
		<td >状态</td>
		<td align="center">操作</td> 
		</tr>
		<s:if test="pager.data != null || pager.data.size>0">
			<s:iterator id="item" value="pager.data" status="st">
				<tr class="top_color01" >
				<td style="padding-left:20px;" title="${item.title}">
					<s:if test="#item.title.length()>10">
   						<s:property value="#item.title.substring(0,10)"></s:property>...
   					</s:if><s:else>
   						${item.title}
   					</s:else>
				</td>
				<td><s:date name="#item.lastPostDate" /></td>
				<td>
					<s:iterator id="investTypeItem" value="investStyleList">
			    		<s:if test="#investTypeItem.code==#item.investType">
			    			${investTypeItem.name }
			    		</s:if>	
			    	</s:iterator>
				</td>
				<td>
					<s:set name="hasValue" value="0" />
					<s:iterator id="amt_item" value="amountRangeList">
			    		<s:if test="#amt_item.code==#item.workTranche">
			    			${amt_item.name }
			    			<s:set name="hasValue" value="1" />
			    		</s:if>	
			    	</s:iterator>
			    	<s:if test="#hasValue==0">
	    				${item.workTranche }
	    			</s:if>    
				</td>
				<td title="${item.workTrade}">
					<div class="ellipsis_text_80" title="${item.workRange}">${item.workRange}</div>
			    	<s:if test="#item.workRange==null or #item.workRange==''">
			    		不限
			    	</s:if>
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
				<td align="right" class="view_detail01" style="padding-right:20px;">
					<span><a class="view_detail" href="/service/supplyInfoAction!detail.act?clbSupplyInfoId=${item.id }">查看</a></span>
					<s:if test="#item.rank==0 || #item.rank==9">
						<span><a href="/service/supplyInfoAction4User!edit.act?clbSupplyInfoId=${item.id }">编辑</a></span>
						<span><a href="/service/supplyInfoAction4User!delete.act?clbSupplyInfoId=${item.id }">删除</a></span>
					</s:if>
				
					<s:if test="#item.rank==-1">
						<span><a href="/service/supplyInfoAction4User!delete.act?clbSupplyInfoId=${item.id }">删除</a></span>
					</s:if>								
				</td>
				</tr>
			</s:iterator>
		  </s:if>
	</table>
	<div class="hr_10"> &nbsp; </div>
	<jsp:include page="/public/pagination.jsp"></jsp:include>
</div>
<s:if test="pager.data == null || pager.data.size<=0">
      <div class="container_950 box_4">
		<div class="l_out">
		<s:if test="#session._user.userTypeGroup==2 || #session._user.userTypeGroup==3">
			<h1 class="l_title">您还未发布任何资金信息</h1>
			<p> 
			您可以<a href="javascript:edit();">点此免费发布资金信息</a>让好项目来找您<br/>
			你也可以去<a href="/service/requestInfoAction!home.act">融资俱乐部</a>寻找适合您的项目信息
			</p>
		</s:if>
		</div>
      </div>  
 </s:if>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>