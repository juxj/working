<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>初始化</title>
	<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
	<script type="text/javascript">
		$(document).ready(function(){
		 if('${reportYear}' == null || '${reportYear}' == ''){
		 
		 }else{
			if('${reportYear}' == 0){
				if(window.confirm("是否要录入让一年度的报表")){
					window.location.href="/user/report.act?reportYear=1";
				}else{
					window.location.href="/user/report.act?reportYear=2";
				}
			}
		 }
		});
	</script>
  </head>
  
<body>
  <!--头部-->

<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_960">

	<form action="/cfs/saveUsrRptConfig.act" method="post">
		<table>
			<tr>
				<td>年份</td>
				<s:iterator id="year" value="years">
					<td>
						<input type="checkbox" name="fiscalYears" value="${year}" checked/> ${year}
					</td>
				</s:iterator>
			</tr>
			<tr>
				<td>报表版本</td>
				<s:iterator id="year" value="years">
					<td>
						<s:iterator id="version" value="versions" status="st">
							<s:if test="#st.last">
								<input type="radio" name="version_${year}" value="${version}" checked/> ${version} <br/>
							</s:if> <s:else>
								<input type="radio" name="version_${year}" value="${version}"/> ${version} <br/>
							</s:else>
						</s:iterator>
					</td>
				</s:iterator>
			</tr>
			
			<tr>
				<td colspan="10"><input type="submit" value="submit"/></td>
			</tr>
		</table>
	</form>
  
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>