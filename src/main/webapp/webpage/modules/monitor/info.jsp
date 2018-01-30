<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html lang="en"
	class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie10 no-ie11 no-ios no-ios7 ipad">
<head>
	<meta name="decorator" content="default"/>
	
	<link href="${ctxStatic}/common/css/coffee.css" rel="stylesheet">
	<script src="${ctxStatic}/echarts-2.2.7/build/dist/echarts-all.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxStatic}/common/systemInfo.js"></script>
	<script type="text/javascript">
		function modifySer(key){
			$.ajax({
						async: false,
						url: "${ctx}/monitor/modifySetting?"+key+"="+$("#"+key).val(),
						dataType: "json",
						success: function (data) {
							if(data.success){
								alert("更新成功！");
							}else{
								alert("更新失败！");
							}
						}
			});
		}
	</script>
</head>
<body class="skin-coffee gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-content coffee-content">
				<h2 class="coffee-title">系统监控</h2>
				<div class="row">
					<div class="col-sm-12">
						<div class="panel coofee-panel" style="margin-bottom: 10px;">
							<div class="panel-heading"><i class="fa fa-rss-square"></i> 实时监控</div>
							<div class="panel-body" style="padding: 15px 0;">
								<table width="100%">
									<tr>
										<td width="33.3%"><div id="main_one" style="height: 200px;"></div></td>
										<td width="33.3%"><div id="main_two" style="height: 200px;"></div></td>
										<td width="33.3%"><div id="main_three" style="height: 200px;"></div></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="panel coofee-panel" style="margin-bottom: 10px;">
							<div class="panel-heading"><i class="fa fa-fire"></i> 实时监控</div>
							<div class="panel-body" style="padding:15px;">
								<div id="main" style="height: 330px;"></div>
							</div>
						</div>
				</div>
			</div>				
				<div class="row">
				<div class="col-sm-6">
						<div class="panel coofee-panel">
							<div class="panel-heading"><i class="fa fa-th-list"></i> 服务器信息</div>
							<div class="panel-body">
								<iframe style="width:100%;height:400px;border:none;margin:0;vertical-align:top;" class="embed-responsive-item" src="${ctx}/monitor/systemInfo"></iframe>
							</div>
						</div>
					</div>				
					<div class="col-sm-6">
						<div class="panel coofee-panel" style="margin-bottom: 20px;">
							<div class="panel-heading"><i class="fa fa-briefcase"></i> 警告设置</div>
							<div class="table-responsive">
							<table class="table table-bordered"  style="with:100%;height:400px; text-align: center;white-space: nowrap;">
								<thead>
									<tr>
										<td class="active">名称</td>
										<td class="active">参数</td>
										<td class="active">预警设置</td>			
									</tr>
								</thead>
								<tbody id="tbody">
									<tr>
										<td>CPU</td>
										<td>当前使用率：<span id="td_cpuUsage" style="color: #f26755;">50</span> %</td>
										<td>
											使用率超出<input class='input-text' name='cpu' id='cpu' type='text' value='${cpu}' style="width:50px;text-align:center;margin:0 10px;" /> %，发送邮箱提示<a class='table-link' href='javascript:void(0)' onclick='modifySer("cpu");'><i class="fa fa-pencil"></i> 修改</a>
										</td>		
									</tr>
									<tr>
										<td>服务器内存</td>
										<td>当前使用率：<span id="td_serverUsage" style="color: #33acca;">50</span> % </td>
										<td>
											使用率超出<input class='input-text' name='ram' id='ram' type='text' value='${ram}' style="width:50px;text-align:center;margin:0 10px;" /> %，发送邮箱提示<a class='table-link' href='javascript:void(0)' onclick='modifySer("ram");'><i class="fa fa-pencil"></i> 修改</a>
										</td>
									</tr>
									<tr>
										<td>JVM内存</td>
										<td>当前使用率：<span id="td_jvmUsage" style="color:#33acca;">50</span> % </td>
										<td>
											使用率超出<input class='input-text' name='jvm' id='jvm' type='text' value='${jvm}' style="width:50px;text-align:center;margin:0 10px;" /> %，发送邮箱提示<a class='table-link' href='javascript:void(0)' onclick='modifySer("jvm");'><i class="fa fa-pencil"></i> 修改</a>
										</td>
									</tr>
									<tr>
										<td>告警邮箱设置</td>
										<td colspan="2" align="left">
										<input class='input-text' style='width: 260px;' name='toEmail' id='toEmail' type='text' value='${toEmail}' />
										<a class='table-link' href='javascript:void(0)' onclick='modifySer("toEmail");'><i class="fa fa-pencil"></i> 修改</a>
										
										</td>
								
									</tr>
								</tbody>
							</table>
							</div>
						</div>
					</div>
				</div>

		</div>
	</div>
	</div>
</body>
</html>
