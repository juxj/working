<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>投资俱乐部_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/load-loan.js"></script>
<script type="text/javascript">
	function toPage(pageNo, useless){
		var url= "/service/supplyInfoAction!home.act?pageNo="+pageNo;
		$('#searchForm').attr('action', url);
		$('#searchForm').submit();
	}
	
	function showDetail(clbSupplyInfoId){
		var url = "/service/supplyInfoAction!detail.act?clbSupplyInfoId="+clbSupplyInfoId;
		window.location.href=url;
	}
	function edit(){
		var url = "/service/requestInfoAction4User!edit.act";
		var _user = "${session._user}";
		if (_user==null || _user=="") {
			alert("您还未的登录，暂不能发布信息!");
			return false;
		}
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
<!--头部开始-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
<div class="clear">&nbsp;</div>
<!--资金信息列表页-->
<div class="M_menu">
	<div style="float:left;"><a href="/loan/LoanService.act">融资服务</a>&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;找资金</div>
	<input type="button" class="but_gray" value="发布信息" onclick="edit();" style="float: right; margin-top:2px; margin-right: 20px;"/>
</div>
<div class="hr_10"> &nbsp; </div>
<!--main1-->
<div class="center box_6_gray" style="height:auto; width:908px; padding-left:20px; padding-bottom:10px;">
	<form id="searchForm" action="/service/supplyInfoAction!home.act" method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td width="108" height="40" valign="middle">地区：</td>
		    <td width="206" height="40" valign="middle"><s:select headerKey="" headerValue="不限" list="provinceList" name="query" listKey="name" listValue="name"  style="width:155px;"></s:select></td>
		    <td width="69" height="40" valign="middle">行业：</td>
		    <td width="225" height="40" valign="middle">
		    	<select id="mainIndustry" name="query"  style="width:155px;">
		    	<option value="">不限</option>
		    	<s:iterator id="item" value="industryList">
					<s:if test="#item.parentid==0">
						<option value="${item.name }" <s:if test="query[1] == name">selected</s:if>>${item.name}</option>
					</s:if>
		    	</s:iterator>
		    	<option value="其他行业" <s:if test="query[1] == '其他行业'">selected</s:if>>其他行业</option>
		   		</select>
		    </td>
		    <td width="111" height="40" valign="middle">融资方式：</td>
		    <td width="194" height="40" valign="middle"><select name="query"  style="width:155px;">
					<option value="">不限</option>
					<s:iterator id="item" value="investStyleList">
						<s:if test="#item.parentId==0" >
							<option value="${item.name }" <s:if test="query[2] == name">selected</s:if>> ${item.name }</option>
						</s:if>
					</s:iterator>
				</select></td>
		    <td width="160" height="40" align="right" valign="middle">
		    	<input type="button" onfocus="this.blur()" onclick="this.form.submit()" 
		    		class="but_gray" value="搜索"  style="margin-left: 10px;"/></td>
		  </tr>
		  <tr>
		    <td width="108" height="40" valign="middle">输入关键词：</td>
		    <td height="40" colspan="5" valign="middle">
		    	<input type="text" class="input-text" name="query" value="${query[3] }"/></td>
		    <td height="40" valign="middle">&nbsp;</td>
		  </tr>
		</table>		
	</form>
	<div class="clear">&nbsp;</div>
</div>
<!--main1-->
<div class="hr_10"> &nbsp;</div>
	<div class="M_box">
		<!--投资俱乐部资金列表开始-->
		<s:if test="pager.data.size()>0">
			<s:iterator id="item" value="pager.data">			
			<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
			      <tr class="top_color">
			        <td style="padding-left:20px;">${item.title }</td>
			      </tr>
			</table >	
			<table >
			  <tr >
			    <td  class="capital_table_1" style="padding-left:20px;">投资行业：</td>
			    <td  class="capital_table_2">${item.workRange }</td>
			    <td  class="capital_table_1">投资金额：</td>
			    <td  class="capital_table_3"><s:iterator id="amt_item" value="amountRangeList">
	    		<s:if test="#amt_item.code==#item.workTranche">
	    			${amt_item.name }
	    		</s:if>	
	    	</s:iterator></td>
			    <td class="capital_table_1">发布时间：</td>
			    <td class="capital_table_2"><s:date name="#item.lastPostDate" /> </td>
				<td class="view_detail"  style="padding-right:20px;"><a href="/service/supplyInfoAction!detail.act?clbSupplyInfoId=${item.id }" target="_blank">详情</a></td>
			  </tr>
			  <tr class="capital_table">
			    <td class="capital_table_1" style="padding-left:20px;">投资地域：</td>
			    <td class="capital_table_2">${item.workArea }</td>
			    <td class="capital_table_1">投资方式：</td>
			    <td class="capital_table_3">${item.workTrade }
	    	<s:if test="#item.workTrade==null or #item.workTrade==''">
	    		不限
	    	</s:if></td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			  </tr>
			</s:iterator>
		      <tr class="top_color">
			        <td style="padding-left:20px; font-size:14px;" colspan="9">
			        <div class="pagination right">
					<s:include value="/public/pagination.jsp"/>
					</div>
					</td>
			   </tr>
		      </s:if>	<s:else>
		      <tr class="top_color">
			        <td style="padding-left:20px; font-size:14px;" colspan="9">
			       		抱歉！未查询到相符的结果
					</td>
			   </tr>
		      </s:else>				  	  
		</table>	
		<!--投资俱乐部资金列表结束-->		
	</div>
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
  </body>
</html>