<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表</title>

<%
//拿到本项目路径
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<!-- 不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出事故
	以/开始的相对路径，找资源，以服务器的路径为标准
 -->
<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<!-- 引入bootStrap-->
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 使用bootstrap搭建项目 -->	
	<div class="container">
	<!-- 标题  -->	
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮  -->
		<div class="row">
		</div>
		<!--  显示表格数据 -->
		<div class="row">
		</div>
		<!-- 显示分页信息  -->
		<div class="row">
		</div>
	</div>
	
</body>
</html>








































