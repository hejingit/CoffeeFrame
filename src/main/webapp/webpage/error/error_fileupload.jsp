<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>文件上传错误</title>
<script src="${ctxStatic}/jquery/jquery-2.1.1.min.js"
	type="text/javascript"></script>
<link href="${ctxStatic}/bootstrap/3.3.4/css_default/bootstrap.min.css"
	rel="stylesheet">
<link href="${ctxStatic}/common/css/coffee.css" type="text/css"
	rel="stylesheet" />
</head>
<body class="gray-bg">
	<div class="error-warp">
		<div class="container-fluid">
			<div class="page-header">
				<h1>文件上传错误</h1>
			</div>
			<div class="errorMessage">
				上传文件超过最大限制，请重新选择上传文件！ <a href="javascript:"
					onclick="history.back(-1);">返回上一级</a>
			</div>
		</div>
	</div>

</body>
</html>