<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/xheditor-1.1.14-zh-cn.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script>
$(function(){
	$(":button,:submit,:reset").button();
	$(".date_picker").datepicker();
	$(".tabs").tabs();
	$(".tablesorter").tablesorter();
});
function openDialog(){
	$("#dialog1").dialog({
		modal:true,
		buttons: {
			'确定': function() {
				$(this).dialog("close");
			},
			'取消':function(){
				$(this).dialog("close");
			}
		}
	});
}
</script>
</head>
<body>
	<div id="hld">
		<div class="wrapper">
			<s:include value="../head.jsp"></s:include>
			<div class="block">
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>Pages</h2>
					<ul>
						<li class="nobg"><a href="#">Edit pages</a></li>
						<li><a href="#">Add page</a></li>
					</ul>
				</div>
				<!-- .block.small.right ends -->
				<div class="block tabs">
				<ul>
					<li><a href="#tabs-1">找资金</a></li>
					<li><a href="#tabs-2">找项目</a></li>
				</ul>
				<div id="tabs-1">
				<h3>This is the first tab</h3>
				<p>Maecenas facilisis interdum rhoncus. Sed laoreet vulputate
					lacus sit amet aliquam. Praesent vitae sapien orci. Mauris nec
					purus in mi accumsan convallis non et lorem. Nunc tincidunt
					consequat risus, ac tincidunt nibh hendrerit at. Nullam sit amet
					nisi eget magna lacinia ullamcorper non sed sem. Ut ornare
					consequat commodo. Donec vitae justo risus. Nulla ornare posuere
					egestas. Nulla varius purus quis lacus placerat tincidunt.</p>
				</div>
				<!-- .block_content ends -->
				<div id="tabs-2">
					<h3>This is the second tab</h3>
					<p>Praesent vitae sapien orci. Mauris nec purus in mi accumsan
						convallis non et lorem. Nunc tincidunt consequat risus, ac
						tincidunt nibh hendrerit at. Nullam sit amet nisi eget magna
						lacinia ullamcorper non sed sem. Ut ornare consequat commodo.
						Donec vitae justo risus. Nulla ornare posuere egestas. Nulla
						varius purus quis lacus placerat tincidunt. Maecenas facilisis
						interdum rhoncus. Sed laoreet vulputate lacus sit amet aliquam.
			        </p>
				</div>
			</div>
			<!-- .block_head ends -->
				
				<!-- .block_content ends -->
				<div class="bendl"></div>
				<div class="bendr"></div>
			</div>
			
			

			

			<!-- .block ends -->
			<div id="footer">
				<p class="left">
					<a href="#">YourWebsite.com</a>
				</p>
				<p class="right">
					powered by <a
						href="http://themeforest.net/item/adminus-beautiful-admin-panel-interface/94668?ref=enstyled">Adminus</a>
					v1.4
				</p>
			</div>
		</div>
		<!-- wrapper ends -->
	</div>
	<!-- #hld ends -->
	<div id="dialog1" title="对话框标题" style="display:none">对话框内容，可以ajax方式取，具体方式可以和我探讨。</div>
</body>
</html>