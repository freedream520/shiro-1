<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4/themes/icon.css">
<script type="text/javascript" src="/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<title>用户管理</title>

<style type="text/css">
	.tree-folder {
		background: url('../images/edit_add.png') no-repeat -208px 0;
	}
	
	.tree-expanded {
		background: url('images/edit_add.png') no-repeat -0px 0px;
	}
	
	.tree-collapsed {
		background: url('images/edit_add.png') no-repeat 0px 0px;
	}
	
	.tree-title {
		font-size: 14px;
		font-family:微软雅黑;
		display: inline-block;
		text-decoration: none;
		vertical-align: top;
		white-space: nowrap;
		padding: 0 2px;
		height: 18px;
		line-height: 18px;
	}
	
	.tree-node {
		height: 24px;
		white-space: nowrap;
		cursor: pointer;
	}
</style>

</head>
<script type="text/javascript">
	$(function(){
		$("#myTree").tree({
			onClick : function(node){
				if($("#myTabs").tabs('exists',node.text)){
					$("#myTabs").tabs('select',node.text)
				}else{
					$("#myTabs").tabs('add',{
						
						title:node.text,
						href:node.link,
						closable:true,
						height:'auto'
					})
				}
			}
		});
		
		$("#logout").click(function(){

			$.post("${pageContext.request.contextPath}/user/logout");
		});
		
	});
</script>
<body class="easyui-layout">
        <div data-options="region:'north',split:true" style="height:50px">
        	<shiro:principal property="name"/>,您好
        	<a href = "#" id="logout">退出系统</a>
        </div>
        <div data-options="region:'west',split:true,title:'系统菜单'" style="width:130px;">
		        <ul id = "myTree" class="easyui-tree">
		            <li>
		                <span>用户管理</span>
		                <ul>
		                    <li data-options="link : '/user-add'">
		                        <span>新增用户</span>
		                    </li>
		                    <li data-options="link : '/user-search'">
		                    	<span>查询用户</span>
		                    </li>
		                    <li data-options="link : '/user-permission'">
		                    	<span>用户权限</span>
		                    </li>
		                </ul>
		            </li>
		        </ul>
        </div>
        <div data-options="region:'center'">
            <div id = "myTabs" class="easyui-tabs" style="width:700px;height:250px" data-options="fit:true">
		        <div title="首页" style="padding:10px">
		           	<ul id="tt" class="easyui-tree" data-options ="url:'${pageContext.request.contextPath }/admindiv/queryadmindiv'"> </ul>
		        </div>
		    </div>
        </div>
</body>
</html>