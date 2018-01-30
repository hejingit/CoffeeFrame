<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<title>个人信息</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
		$(document).ready(function() {

			$("#userPassWordBtn").click(function(){
				top.layer.open({
				    type: 2, 
				    area: ['640px', '420px'],
				    title:"修改密码",
				    content: "${ctx}/sys/user/modifyPwd" ,
				    btn: ['确定', '关闭'],
				    yes: function(index, layero){
				    	 var body = top.layer.getChildFrame('body', index);
				         var inputForm = $(body).find('#inputForm');
				         var btn = body.find('#btnSubmit');
				         var top_iframe = top.getActiveTab().attr("name");//获取当前active的tab的iframe 
				         inputForm.attr("target",top_iframe);//表单提交成功后，从服务器返回的url在当前tab中展示
				         inputForm.validate({
								rules: {
								},
								messages: {
									confirmNewPassword: {equalTo: "两次密码输入不一致"}
								},
								submitHandler: function(form){
									loading('正在提交，请稍等...');
									form.submit();
									
								},
								errorContainer: "#messageBox",
								errorPlacement: function(error, element) {
									$("#messageBox").text("输入有误，请先更正。");
									if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
										error.appendTo(element.parent().parent());
									} else {
										error.insertAfter(element);
									}
								}
							});
					     if(inputForm.valid()){
				        	  loading("正在提交，请稍等...");
				        	  inputForm.submit();
				        	  top.layer.close(index);//关闭对话框。
				          }else{
					          return;
				          }
						
						
					  },
					  cancel: function(index){ 
		    	       }
				}); 
			});
			
			$("#userInfoBtn").click(function(){
				top.layer.open({
				    type: 2,  
				    area: ['640px', '600px'],
				    title:"个人信息编辑",
				    content: "${ctx}/sys/user/infoEdit" ,
				    btn: ['确定', '关闭'],
				    yes: function(index, layero){
				    	 var body = top.layer.getChildFrame('body', index);
				         var inputForm =  $(body).find('#inputForm');
				         var top_iframe = top.getActiveTab().attr("name");//获取当前active的tab的iframe 
				         inputForm.attr("target",top_iframe);//表单提交成功后，从服务器返回的url在当前tab中展示
				         inputForm.validate();
				         if(inputForm.valid()){
				        	  loading("正在提交，请稍等...");
				        	  inputForm.submit();
				          }else{
					          return;
				          }
				        
						 top.layer.close(index);//关闭对话框。
						
					  },
					  cancel: function(index){ 
		    	       }
				}); 
			});

			$("#userImageBtn").click(function(){
				top.layer.open({
				    type: 2,  
				    area: [width, height],
				    title:"上传头像",
				    content: "${ctx}/sys/user/imageEdit" ,
				  //  btn: ['确定', '关闭'],
				    yes: function(index, layero){
				    	 var body = top.layer.getChildFrame('body', index);
				         var inputForm = body.find('#inputForm');
				         var top_iframe = top.getActiveTab().attr("name");//获取当前active的tab的iframe 
				         inputForm.attr("target",top_iframe);//表单提交成功后，从服务器返回的url在当前tab中展示
				         inputForm.validate();
				         if(inputForm.valid()){
				        	  loading("正在提交，请稍等...");
				        	  inputForm.submit();
				          }else{
					          return;
				          }
				        
						 top.layer.close(index);//关闭对话框。
						
					  },
					  cancel: function(index){ 
		    	       }
				}); 
			});
			
		});
	</script>
</head>
<body>
<body class="skin-coffee gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-content coffee-content">
				<h2 class="coffee-title">注册信息</h2>
				<sys:message hideType="1" content="${message}" />
				<div class="row">
					<%--
						<div class="col-sm-4">
							<img width="100%" style="max-width:100px;" src="${user.qrCode}">
						</div>
					--%>
					<div class="col-sm-12">
						<div class="table-responsive coffee-info-table">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>登陆账号</th>
										<td>${user.loginName}</td>
									</tr>
									<tr>
										<th>邮箱</th>
										<td>${user.email}</td>
									</tr>
									<tr>
										<th>姓名</th>
										<td>${user.name}</td>
									</tr>
									<tr>
										<th>手机号码</th>
										<td>${user.mobile}</td>
									</tr>
									<tr>
										<th>用户角色</th>
										<td>${user.roleNames}</td>
									</tr>
						<%-- 			<tr>
										<th>用户类型</th>
										<td>${fns:getDictLabel(user.userType, 'sys_user_type', '无')}</td>
									</tr> --%>
								</tbody>
							</table>
						</div>
						<%--
						<div class="coffee-info-table-bottom">
							<span>上次登录IP: ${user.oldLoginIp}</span>
							<span>时间：<fmt:formatDate value="${user.oldLoginDate}" type="both" dateStyle="full"/></span>
						</div>
						<button id="userInfoBtn" class="btn-primary coffee-info-button">修改注册信息</button>
						--%>
						<button id="userPassWordBtn" class="btn-primary coffee-info-button">修改密码</button>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>