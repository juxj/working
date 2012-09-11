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
			<s:include value="head.jsp"></s:include>
			<input type="button" value="此页面有基本排序(页面 排序)表格、弹出式对话框、Tab、日期选择器、在线文本编辑器，按钮"/>
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
				<!-- .block_head ends -->
				<div class="block_content">
					<form action="" method="post">
						<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
							<thead>
								<tr>
									<th width="10"><input type="checkbox" class="check_all" /></th>
									<th class="header" style="cursor: pointer; ">Page title</th>
									<th class="header" style="cursor: pointer; ">Status</th>
									<th class="header" style="cursor: pointer; ">Date created</th>
									<th class="header" style="cursor: pointer; ">Author</th>
									<td>&nbsp;</td>
								</tr>
							</thead>
							<tbody>
								<tr class="even">
									<td><input type="checkbox" /></td>
									<td><a href="#">Aorem ipsum dolor</a></td>
									<td>Published</td>
									<td>20.03.2010</td>
									<td><a href="#">John Doe</a></td>
									<td class="delete"><a href="#">Delete</a></td>
								</tr>
								<tr class="odd">
									<td><input type="checkbox" /></td>
									<td><a href="#">Zn ac libero nunc, vel congue neque</a></td>
									<td>Published</td>
									<td>18.03.2010</td>
									<td><a href="#">John Doe</a></td>
									<td class="delete"><a href="#">Delete</a></td>
								</tr>
								<tr class="even">
									<td><input type="checkbox" /></td>
									<td><a href="#">Borem ipsum dolor</a></td>
									<td>Published</td>
									<td>20.03.2010</td>
									<td><a href="#">John Doe</a></td>
									<td class="delete"><a href="#">Delete</a></td>
								</tr>
								<tr class="odd">
									<td><input type="checkbox" /></td>
									<td><a href="#">Aaa In ac libero nunc, vel congue neque</a></td>
									<td>Published</td>
									<td>18.03.2010</td>
									<td><a href="#">John Doe</a></td>
									<td class="delete"><a href="#">Delete</a></td>
								</tr>
								<tr class="even">
									<td><input type="checkbox" /></td>
									<td><a href="#">Lorem ipsum dolor</a></td>
									<td>Published</td>
									<td>20.03.2010</td>
									<td><a href="#">John Doe</a></td>
									<td class="delete"><a href="#">Delete</a></td>
								</tr>
								<tr class="odd">
									<td><input type="checkbox" /></td>
									<td><a href="#">In ac libero nunc, vel congue neque</a></td>
									<td>Published</td>
									<td>18.03.2010</td>
									<td><a href="#">John Doe</a></td>
									<td class="delete"><a href="#">Delete</a></td>
								</tr>
								<tr class="even">
									<td><input type="checkbox" /></td>
									<td><a href="#">Lorem ipsum dolor</a></td>
									<td>Published</td>
									<td>20.03.2010</td>
									<td><a href="#">John Doe</a></td>
									<td class="delete"><a href="#">Delete</a></td>
								</tr>
								<tr class="odd">
									<td><input type="checkbox" />
									</td>
									<td><a href="#">In ac libero nunc, vel congue neque</a></td>
									<td>Published</td>
									<td>08.03.2010</td>
									<td><a href="#">John Doe</a></td>
									<td class="delete"><a href="#">Delete</a></td>
								</tr>
							</tbody>
						</table>
						<!-- .tableactions ends -->
						<div class="pagination right">
							<a href="#">«</a> 
							<a href="#" class="active">1</a> 
							<a href="#">2</a> 
							<a href="#">3</a> 
							<a href="#">4</a> 
							<a href="#">5</a> 
							<a href="#">6</a> 
							<a href="#">»</a>
						</div>
						<!-- .pagination ends -->
					</form>
				</div>
				<!-- .block_content ends -->
				<div class="bendl"></div>
				<div class="bendr"></div>
			</div>
			<!-- .block ends -->
			<div class="block">
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>Forms</h2>
					<form action="" method="post">
						<input type="text" class="text" value="Search" />
					</form>
				</div>
				<!-- .block_head ends -->
				<div class="block_content">
					<p class="breadcrumb">
						<a href="#">Parent page</a> « 
						<a href="#">Subpage</a> « <strong>Form page</strong> (breadcrumb)
					</p>
					<div class="message errormsg" style="display: block; ">
						<p>An error message goes here</p>
					</div>
					<div class="message success" style="display: block; ">
						<p>A success message goes here</p>
					</div>
					<div class="message info" style="display: block; ">
						<p>An informative message goes here</p>
					</div>
					<div class="message warning" style="display: block; ">
						<p>A warning message goes here</p>
					</div>
					<form action="" method="post">
						<p>
							<label>Small input label:</label><br /> <input type="text" class="text small" /> <span class="note">*A note</span>
						</p>
						<p>
							<label>Medium input label:</label><br/> <input type="text" class="text medium error" /> <span class="note error">Error!</span>
						</p>
						<p>
							<label>Big input label:</label><br/> <input type="text" class="text big"/>
						</p>
						<p>
							<label>Textarea label:</label><br/>
							<textarea class="xheditor">aaa</textarea>
						</p>
						<p>
							<label>Starting date:</label> <input type="text" class="text date_picker" />
							<label>Ending date:</label> <input type="text" class="text date_picker"/>
						</p>
						<p>
							<label>Select label:</label>
									<select class="styled" style="opacity: 0; position: relative; z-index: 100; ">
										<optgroup label="Group 1">
											<option>Option one</option>
											<option>Option two</option>
											<option>Option three</option>
										</optgroup>
										<optgroup label="Group 2">
											<option>Option one</option>
											<option>Option two</option>
											<option>Option three</option>
										</optgroup>
										<optgroup label="Group 3">
											<option>Option one</option>
											<option>Option two</option>
											<option>Option three</option>
										</optgroup>
									</select>
						</p>
						<p>
							<input type="checkbox" class="checkbox" checked="checked" id="cbdemo1"/> <label for="cbdemo1">Checkbox label</label> 
							<input type="checkbox" class="checkbox" id="cbdemo2"/><label for="cbdemo2">Checkbox label</label>
						</p>
						<p>
							<input type="radio" checked="checked" class="radio"/> <label>Radio button label</label>
						</p>
						<hr/>
							<p>
								<input type="submit" value="Even longer submit"/>
								<input type="button" value="通用按钮 "/>
								<input type="button" value="打开对话框 " onclick="openDialog();"/>
							</p>
					</form>
				</div>
				<!-- .block_content ends -->
				<div class="bendl"></div>
				<div class="bendr"></div>
			</div>
			<!-- .block ends -->
			<div class="block small left">
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>Left column</h2>
				</div>
				<!-- .block_head ends -->
				<div class="block_content">
					<form action="" method="post">
						<p>
							<label>Small input label:</label><br/> <input type="text" class="text"/>
						</p>
						<p>
							<label>Text area label:</label><br/> <textarea rows="5" cols="50"></textarea>
						</p>
						<p>Praesent justo risus, suscipit eget volutpat ac, fermentumac.</p>
						<p> <input type="submit" value="Submit"/></p>
					</form>
				</div>
				<!-- .block_content ends -->
				<div class="bendl"></div>
				<div class="bendr"></div>
			</div>
			<!-- .block.small.left ends -->
			<div class="block small right">
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>Right column</h2>
				</div>
				<!-- .block_head ends -->
				<div class="block_content">
					<h2>Headline</h2>
					<p> Quisque felis nunc, <a href="http://enstyled.com/adminus/original/demo" rel="facebox">open modal</a> 
						lacinia at, viverra sit amet ligula. Praesent justo risus, suscipit eget volutpat ac, fermentum ac massa. Sed at justo velit. Maecenas dapibus sem nec quam cursus.
					</p>
					<h3>Headline</h3>
					<ul>
						<li>Proin volutpat</li>
						<li>Praesent justo risus, suscipit eget</li>
						<li>Morbi facilisis felis ac sapien</li>
					</ul>
					<h4>Headline</h4>
					<ol>
						<li>Proin volutpat</li>
						<li>Praesent justo risus, suscipit eget</li>
						<li>Morbi facilisis felis ac sapien</li>
					</ol>
				</div>
				<!-- .block_content ends -->
				<div class="bendl"></div>
				<div class="bendr"></div>
			</div>
			<!-- .block.small.right ends -->
			<div class="block tabs">
				<ul>
					<li><a href="#tabs-1">Tab 1</a></li>
					<li><a href="#tabs-2">Tab 2</a></li>
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