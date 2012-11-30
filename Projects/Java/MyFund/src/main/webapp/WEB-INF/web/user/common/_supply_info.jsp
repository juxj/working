<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
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

<table class="gold-table" border="0" cellspacing="0" cellpadding="0">
  <caption>
  <span class="fr view_all"><a href="/service/club!home.act?mparamid=17&checkstate=1">查看全部»</a></span>
  <h6>资金信息</h6>
  <span class="leftdetail"><a href="javascript:edit();">立即发布</a></span>
  </caption>
  <s:if test="supplyInfoList == null || supplyInfoList.size<=0">
  	<tr>
  		<td colspan="7" align="center">暂无资金信息</td>
  	</tr>
  </s:if><s:else>
  <tr>
  	 <th>资金标题</th>
     <th>发布时间</th>
     <th>项目分类</th>
     <th>资金数额</th>
     <th>投资方式</th>
     <th>状态</th>
     <th style="text-align:right; padding-right:60px;">操作</th>
  </tr>
  </s:else>
  <s:iterator value="supplyInfoList" id="item">
	  <tr>
	    <td title="${title}">
		    <div class="ellipsis_text_80" title="${item.title}">${item.title}</div>
	    </td>
		<td><s:date name="lastPostDate" format="yyyy-MM-dd"/></td>
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
		<td title="${item.workRange }">
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
   		<td class="view_detail" style="text-align:right; padding-right:20px;">
   		<a href="/service/supplyInfoAction!detail.act?clbSupplyInfoId=${item.id }" style="width:30px;">查看</a>
   		</td>
	  </tr>
  </s:iterator>
</table>