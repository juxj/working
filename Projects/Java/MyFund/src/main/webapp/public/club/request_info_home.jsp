<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>投资俱乐部_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/load-club.js" > </script>
<script type="text/javascript">
	function toPage(pageNo, useless){
		var url= "/service/requestInfoAction!home.act?pageNo="+pageNo;
		$('#searchForm').attr('action',url);
		$('#searchForm').submit();
	}
	function edit(){
		var url = "/service/requestInfoAction4User!edit.act";
		var _user = "${session._user}";
		var user_type = '${session._user.userTypeGroup}';
		if (_user==null || _user=="") {
			window.location.href = url;
		} else {
		
			var user_status = "${session._user.auditstatus}";
			if (user_status != "2") {
				alert("您的注册资料尚未通过审核，暂不能发布此信息!");
				return;
			} 
			
			if (user_type != '1' && user_type !='5') {		
				alert("只有用户身份为企业或个人才可以发布项目信息！");
				return ;
			}
			
			var user_status = "${session._user.auditstatus}";
			if (user_status != "2") {
				alert("您的注册资料尚未通过审核，暂不能发布此信息!");
			} else {
				window.location.href = url;
			}
		}
		
	}
</script>
</head>
<body>
<!--头部开始-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
<div class="clear">&nbsp;</div>
<!--头部结束-->
<!--资金信息列表页-->
<div class="M_menu">
	<div style="float:left;"><a href="/club/clubAction.act">融资俱乐部rr</a>&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;找项目 </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--main1-->
<div class="center container_950"><a href="javascript:edit()"><img src="/images/img_club_pub_project.jpg" width="950" height="56"/></a>
	<div class="box_5" style="background:#edf0ff;">
	<form id="searchForm" action="/service/requestInfoAction!home.act" method="post">
		<div class="fl">
			<span>行业：&nbsp;&nbsp;</span>
			<span style="padding-right:20px;">
			    <select id="mainIndustry" name="query"  style="width:155px;">
		    	<option value="">不限</option>
		    	<s:iterator id="item" value="industryList">
					<s:if test="#item.parentid==0">
						<option value="${item.name }" <s:if test="query[0] == name">selected</s:if>>${item.name}</option>
					</s:if>
		    	</s:iterator>
		    	<option value="其他行业" <s:if test="query[1] == '其他行业'">selected</s:if>>其他行业</option>
		    	
		    </select>&nbsp;&nbsp;&nbsp;&nbsp;		
			</span>
			<span>投资方式：&nbsp;&nbsp;</span>
			<span style="padding-right:20px;">
				<s:select headerKey="" headerValue="不限" list="financingTypeList" listKey="name" listValue="name" name="query" style="width:155px;"></s:select>
			</span>
			<span>地区：&nbsp;&nbsp;</span>
			<span style="padding-right:20px;"><s:select headerKey="" headerValue="不限" list="provinceList" name="query" listKey="name" listValue="name" style="width:155px;"></s:select></span>
			<span>关键字：&nbsp;&nbsp;</span>
			<span class="input-text" style="padding-right:20px;"><input type="text" class="input-text"  style="width:100px;" name="query" value="${query[3]}" />&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
		<span class="fr"><input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="btnsub blue1" value="重新查询"  style="width:90px; margin-left: 10px;"/></span>
	</form>
	<div class="clear">&nbsp;</div>
	</div>
</div>
<!--main1-->
<div class="hr_10"> &nbsp; </div>
<!-- gaidong -->
<table class="container_950 center">
	<tr class="top_color box_4">
		<td style="padding-left:20px; border-bottom:3px solid #003961;">项目主题</td>
		<td style="border-bottom:3px solid #003961;">所属行业</td>
		<td style="border-bottom:3px solid #003961;">融资金额</td>
		<td style="border-bottom:3px solid #003961;">所属地域</td>
		<td style="border-bottom:3px solid #003961;">融资方式</td>
		<td style="border-bottom:3px solid #003961;">发布时间</td>
		<td style="border-bottom:3px solid #003961;width:90px"></td>
	</tr>	
	<s:set name="style" value="'border:1px solid #f0f0f0; background:#f9f9f7;'"></s:set>
	<s:if test="pager.data.size()>0">
				<s:iterator id="item" value="pager.data" status="st">		
	<tr <s:if test="#st.even"> style="${style}" </s:if>>
		<td style="padding-top:15px;padding-bottom:15px;padding-left:20px;">
					<a href="/service/requestInfoAction!detail.act?clbRequestInfoId=${item.id}" target="_blank" style="font-size: 14px; color:#003961; ">
					${item.title }</a><br/>${userInfoList[st.index][1]}</td>
		<td><div title="${item.industry }" class="ellipsis_text_60">${item.industry }</div></td>
		<td><s:text name="format.float"><s:param value="#item.totalMoney"></s:param></s:text>（万元）</td>
		<td>${item.area }</td>
		<td>
			<div title="${item.financeType }" class="ellipsis_text_60">${item.financeType }</div>
        	<s:if test="#item.financeType==null or #item.financeType==''">
	    		不限
	    	</s:if>
		</td>
		<td><s:date name="#item.lastPostDate" /> </td>
		<td style="padding-top:15px;padding-bottom:15px;">
			<s:if test="userInfoList[#st.index][0]==1">
				<span class="fl"><img src="/images/ico_cert_ca.gif" width="20" height="20" /></span>&nbsp;认证会员<br />
			</s:if>
			
			<s:if test="userInfoList[#st.index][0]==2">
				<span class="fl"><img src="/images/ico_cert_vip.gif" width="20" height="20" /></span>&nbsp;VIP会员<br />
			</s:if>
		
			<s:if test="userInfoList[#st.index][0]==0">
				<span class="fl"><img src="/images/ico_cert_ca.gif" width="20" height="20" /></span>&nbsp;普通会员<br />
			</s:if>
		</td>
	</tr>
	</s:iterator>
		<tr>
		   <td style="padding-left:20px; font-size:14px;" colspan="9">
			   <div class="pagination right">
					<s:include value="/public/pagination.jsp"/>
				</div>
			</td>
		</tr>
      </s:if><s:else>
	      <tr class="top_color">
		        <td style="padding-left:20px; font-size:14px;" colspan="7">
		       		抱歉！未查询到相符的结果
				</td>
		   </tr>
      </s:else>		  
</table>	

<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
  </body>
</html>
