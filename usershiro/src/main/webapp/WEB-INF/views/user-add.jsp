<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增用户</title>
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4/themes/icon.css">
<script type="text/javascript" src="/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
</head>
<script type="text/javascript">
	$(function(){
		alert("5");
	});
</script>
<body>
	<form id="userForm">
        <table cellpadding="5">
            <tr>
                <td>姓名:</td>
                <td><input type="text" name="name"></input></td>
            </tr>
            <tr>
                <td>性别:</td>
                <td>
                	<input type="radio" name="sex" />男
                	<input type="radio" name="sex" />女
                </td>
            </tr>
            <tr>
                <td>电话:</td>
                <td><input type="text" name="telphone" ></input></td>
            </tr>
            <tr>
                <td>邮箱:</td>
                <td><input type="text" name="email" ></input></td>
            </tr>
            <tr>
                <td>生日:</td>
                <td><input class="easyui-datebox" type="text" name="birthday" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td>爱好:</td>
                <td>
                	<input type="checkbox" name="hoby"/>乒乓球  
                	<input type="checkbox" name="hoby"/>羽毛球
                	<input type="checkbox" name="hoby"/>网球
                	<input type="checkbox" name="hoby"/>篮球
                	<input type="checkbox" name="hoby"/>足球
                </td>
            </tr>
            <tr>
                <td><input id = "submit" type="button" value = "提交"/></td>
            </tr>
        </table>
    </form>
</body>
</html>