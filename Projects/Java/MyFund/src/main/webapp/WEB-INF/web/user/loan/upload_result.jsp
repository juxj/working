<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
		<span>
			<s:if test="msg == 1">
				上传成功!
			</s:if>
			<s:else>
				上传失败，只支持上传小于3M的png、jpg、jpeg、bmp、word、excel、pdf文件！
			</s:else>
		</span>
