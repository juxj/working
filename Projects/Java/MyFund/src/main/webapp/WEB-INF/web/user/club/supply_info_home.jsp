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
</script>
</head>
<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="container_950">
	<div class="clear"> &nbsp;</div>
	<div class="M_menu">
		融资管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;融资俱乐部
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="container_950 box_4" style="height:90px;">
		<div class="P_title">资金信息</div>
		<div class="line"><input name="" type="button" value="发布信息"  onclick="edit();" class="but_gray" style="float: right; margin-right:10px;"/></div>
	</div>		
	<div class="hr_10"> &nbsp; </div> 
	<!-- 表格 -->	
	<table class="gold-table">
		<th>资金标题</th>
		<th>发布时间</th>
		<th>项目分类</th>
		<th>资金数额</th>
		<th>投资方式</th>
		<th>状态</th>
		<th width="12%">操作</th>
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
					<s:if test="#item.workTrade.length()>15">
   						<s:property value="#item.workTrade.substring(0,15)"></s:property>...
   					</s:if><s:else>
   						${item.workTrade}
   					</s:else>
			    	<s:if test="#item.workTrade==null or #item.workTrade==''">
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
				<td>
					<a class="view_detail" href="/service/supplyInfoAction!detail.act?clbSupplyInfoId=${item.id }">查看</a>
					<s:if test="#item.rank==0 || #item.rank==9">
						<a href="/service/supplyInfoAction4User!edit.act?clbSupplyInfoId=${item.id }">编辑</a>
						<a href="/service/supplyInfoAction4User!delete.act?clbSupplyInfoId=${item.id }">删除</a>
					</s:if>
				
					<s:if test="#item.rank==-1">
						<a href="/service/supplyInfoAction4User!delete.act?clbSupplyInfoId=${item.id }">删除</a>
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