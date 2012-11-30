<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script language="javascript" >
	function toPage(pageNo, pageCount) {
		document.getElementById("pageNo").value = pageNo;
		form = document.getElementById("frmfundInfo");
		form.submit();
	}
</script>
<form id="frmfundInfo" action="/finance/fund!fundNav.act" method="post"  >
	<input type="hidden" id="pageNo" name="pageNo" /> 	
</form>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
      <tr class="top_color">
        <td class="capital_table_0">日期</td>
        <td class="capital_table_0">单位净值</td>
        <td class="capital_table_0">累计净值</td>
      </tr>
		<s:if test="pager.data.size()<0">
		  <tr class="capital_table" >
	        <td class="capital_table_0">抱歉！未查询到相符的结果</td>
	      </tr>
		</s:if><s:else>
		<s:iterator value="pager.data">	
	      <tr class="capital_table" >
	        <td class="capital_table_0"><s:date name="navDate"/></td>
	        <td class="capital_table_0">${nav}</td>
	        <td class="capital_table_0">${accumulatedNav }</td>
	      </tr>
	      </s:iterator>
	      <tr class="top_color">
		        <td style="padding-left:20px; font-size:14px;" colspan="9">
		        <div class="pagination right">
				<s:include value="/public/pagination.jsp"/>
				</div>
				</td>
		   </tr>
		</s:else>
</table>
