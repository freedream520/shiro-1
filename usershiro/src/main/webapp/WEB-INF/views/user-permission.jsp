<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户权限</title>
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4/themes/icon.css">
<script type="text/javascript" src="/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">
	$(function(){
		alert("5");
	});
</script>
<body>
	<form action="">
		<table>
			<tr>
				<td>名称：</td>
				<td>
					<input type="text" name = "name" id = "name">
				</td>
			</tr>
			<tr>
				<td>类型：</td>
				<td>
					<select id = "type">
						<option value = "">---请选择类型---</option>
						<option value = "O">菜单</option>
						<option value = "F">功能</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>父节点名称：</td>
				<td>
					<input type = "text" id = "pid" name = "pid">
				</td>
			</tr>
			<tr>
				<td>功能关键字：</td>
				<td>
					<input type = "text" id = "permCode" name = "permCode">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>