<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

.table {
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
	font: 14px/1.2 'Microsoft YaHei';
	color: #616161;
}

.table th {
	width: 25%;
	height: 40px;
	background-color: #FAFAFA;
	text-align: right;
	padding-right: 25px;
	border-right: 1px solid #ebebeb;
	font-weight: normal;
}

.table td {
	padding-left: 35px;
}
</style>

<table class="table">
	<tbody>
		<tr>
			<th>ip地址</th>
			<td id="hostIp">${systemInfo.hostIp}</td>
		</tr>
		<tr>
			<th>主机名</th>
			<td id="hostName">${systemInfo.hostName}</td>
		</tr>
		<tr>
			<th>操作系统的名称</th>
			<td id="osName">${systemInfo.osName}</td>
		</tr>
		<tr>
			<th>操作系统的构架</th>
			<td id="arch">${systemInfo.arch}</td>
		</tr>
		<tr>
			<th>操作系统的版本</th>
			<td id="osVersion">${systemInfo.osVersion}</td>
		</tr>
		<tr>
			<th>处理器个数</th>
			<td id="processors">${systemInfo.processors}</td>
		</tr>
		<tr>
			<th>Java的运行环境版本</th>
			<td id="javaVersion">${systemInfo.javaVersion}</td>
		</tr>
		<tr>
			<th>Java供应商的URL</th>
			<td id="javaUrl">${systemInfo.javaUrl}</td>
		</tr>
		<tr>
			<th>Java的安装路径</th>
			<td id="javaHome">${systemInfo.javaHome}</td>
		</tr>
		<tr>
			<th>临时文件路径</th>
			<td id="tmpdir">${systemInfo.tmpdir}</td>
		</tr>
	</tbody>
</table>