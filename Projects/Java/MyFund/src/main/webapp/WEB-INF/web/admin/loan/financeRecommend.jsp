<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript">
$(function(){
	$(":button,:submit").button();
});

function recommendsub(){
	var url = "/admin/loan/recommendprd.act";
	if($('#rec_seq').val() == ''){
		alert('序号不能为空！');
		return ;
	}
	var recStatus = $('input[name="prdRecommendation.status"]:checked').val();
   	var param = {'prdRecommendation.id':$('#rec_id').val(),'prdRecommendation.typeId':$('#rec_typeId').val(),'prdRecommendation.prodId':$('#rec_prodId').val(),'prdRecommendation.status':recStatus,'prdRecommendation.title':$('#rec_title').val(),'prdRecommendation.sequence':$('#rec_seq').val()};
   	$.post(url,param, function(data){
   		$('#recommendid').html(data);
   	}, 'html');
}
</script>
</head>
<body>
<div class="block block_content" id="recommendid">
	<form action="/admin/loan/recommendprd.act" method="post" id="recommendprdForm">
	<s:hidden name="prdRecommendation.id" id="rec_id"></s:hidden>
	<s:hidden name="prdRecommendation.typeId" id="rec_typeId"></s:hidden>
	<s:hidden name="prdRecommendation.prodId" id="rec_prodId"></s:hidden>
		<p>
			<label>是否推荐:</label><br /><common:radio name="prdRecommendation.status" valueSetMap="ZJ102" cssClass="checkbox"></common:radio>
		</p>
		<p>
			<label>推荐标题:</label><br/><s:textfield name="prdRecommendation.title" cssClass="text medium" id="rec_title"></s:textfield>
		</p>
		<p>
			<label>序号:</label><br/><s:textfield name="prdRecommendation.sequence" cssClass="text small required" id="rec_seq"></s:textfield>
		</p>
		<p>
			<input type="button" value="确定" onclick="recommendsub();"/>
		</p>
	</form>
</div>
</body>
</html>
