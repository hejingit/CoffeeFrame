]<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>角色管理</title>
	<meta name="decorator" content="default"/>
</head>
<body class="skin-coffee gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
  <div class="ibox-content coffee-content">
	<sys:message content="${message}"/>
			<h2 class="coffee-title">角色管理</h2>
		<!-- 查询条件 -->
	<div class="row">
	<div class="col-sm-12">
	<form:form id="searchForm" modelAttribute="role" action="${ctx}/sys/role/" method="post" class="coffee-form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/><!-- 支持排序 -->
		<div class="coffee-form">
				<span class="label-title">角色名称：</span>
				<form:input path="name" value="${role.name}"  htmlEscape="false" maxlength="64"  class="input-text"/>
		 </div>	
	</form:form>
	<div class="coffee-form-button">
			<button class="btn-primary" onclick="search()" ><i class="fa fa-search"></i> 查询</button>
			<button onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
	</div>
	</div>
	</div>
	
		<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left coffee-table-buttom">
			<shiro:hasPermission name="sys:role:add">
				<table:addRow url="${ctx}/sys/role/form" title="角色"></table:addRow><!-- 增加按钮 -->
			</shiro:hasPermission>
			<shiro:hasPermission name="sys:role:edit">
			    <table:editRow url="${ctx}/sys/role/form" id="contentTable"  title="角色"></table:editRow><!-- 编辑按钮 -->
			</shiro:hasPermission>
			<shiro:hasPermission name="sys:role:del">
				<table:delRow url="${ctx}/sys/role/deleteAll" id="contentTable"></table:delRow><!-- 删除按钮 -->
			</shiro:hasPermission>
		
			</div>
		<div class="pull-right coffee-table-buttom">
	       <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
		</div>
	</div>
	</div>
	
	<div class="table-responsive coffee-table">
	<table id="contentTable" class="table table-hover">
		<thead>
			<tr>
				<th class="th-checkbox text-center"><input type="checkbox" class="i-checks"></th>
				<th>角色名称</th>
				<th>英文名称</th>
				<th>归属机构</th>
				<th>数据范围</th>
				<shiro:hasPermission name="sys:role:edit"><th class="text-center">操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="role">
				<tr>
					<td class="text-center"> <input type="checkbox" id="${role.id}" class="i-checks"></td>
					<td><a  href="#" onclick="openDialogView('查看角色', '${ctx}/sys/role/form?id=${role.id}','830px', '500px')">${role.name}</a></td>
					<td><a  href="#" onclick="openDialogView('查看角色', '${ctx}/sys/role/form?id=${role.id}','830px', '500px')">${role.enname}</a></td>
					<td>${role.office.name}</td>
					<td hidden="true">${role.office.id}</td>
					<td>${fns:getDictLabel(role.dataScope, 'sys_data_scope', '无')}</td>
					<td class="text-center">
						<shiro:hasPermission name="sys:role:view">
						<a href="#" onclick="openDialogView('查看角色', '${ctx}/sys/role/form?id=${role.id}','830px', '500px')" class="table-link" ><i class="fa fa-search-plus"></i> 查看</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="sys:role:edit"> 
						<c:if test="${(role.sysData eq fns:getDictValue('是', 'yes_no', '1') && fns:getUser().admin)||!(role.sysData eq fns:getDictValue('是', 'yes_no', '1'))}">
							<a href="#" onclick="openDialog('修改角色', '${ctx}/sys/role/form?id=${role.id}','830px', '500px')" class="table-link" ><i class="fa fa-edit"></i> 修改</a>
						</c:if>
						</shiro:hasPermission>
						<shiro:hasPermission name="sys:role:del"> 
						<a href="${ctx}/sys/role/delete?id=${role.id}" onclick="return confirmx('确认要删除该角色吗？', this.href)" class="table-link"><i class="fa fa-trash"></i> 删除</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="sys:role:assign"> 
						<a href="#" onclick="openDialog('权限设置', '${ctx}/sys/role/auth?id=${role.id}','350px', '700px')" class="table-link" ><i class="fa fa-edit"></i> 权限设置</a> 
						</shiro:hasPermission>
						<shiro:hasPermission name="sys:role:assign"> 
						<a href="#" onclick="openDialogView('分配用户', '${ctx}/sys/role/assign?id=${role.id}','830px', '600px')"  class="table-link" ><i class="glyphicon glyphicon-plus"></i> 分配用户</a>
						</shiro:hasPermission>
						</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	</div>
	</div>
</body>
</html>