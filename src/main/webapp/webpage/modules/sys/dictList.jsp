<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>字典管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body class="skin-coffee gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
    
    <div class="ibox-content coffee-content">
			<h2 class="coffee-title">用户管理</h2>
	<sys:message content="${message}"/>
	
	<!-- 查询条件 -->
	<div class="row">
	<div class="col-sm-12">
	<form:form id="searchForm" modelAttribute="dict" action="${ctx}/sys/dict/" method="post" class="coffee-form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/><!-- 支持排序 -->
		<div class="coffee-form">
			<span class="label-title">类型：</span>
				<form:select id="type" path="type" class="input-text"><form:option value="" label=""/><form:options items="${typeList}" htmlEscape="false"/></form:select>
		</div>	
		<div class="coffee-form">
			<span class="label-title">描述：</span>
				<form:input path="description" htmlEscape="false" maxlength="50" class="input-text"/>
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
			<shiro:hasPermission name="sys:dict:add">
				<table:addRow url="${ctx}/sys/dict/form" title="字典"></table:addRow><!-- 增加按钮 -->
			</shiro:hasPermission>
			<shiro:hasPermission name="sys:dict:edit">
			    <table:editRow url="${ctx}/sys/dict/form" id="contentTable"  title="字典"></table:editRow><!-- 编辑按钮 -->
			</shiro:hasPermission>
			<shiro:hasPermission name="sys:dict:del">
				<table:delRow url="${ctx}/sys/dict/deleteAll" id="contentTable"></table:delRow><!-- 删除按钮 -->
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
				<th class="th-checkbox text-center"> <input type="checkbox" class="i-checks"></th>
				<th  class="sort-column value">键值</th>
				<th >标签</th>
				<th  class="sort-column type">类型</th>
				<th  class="sort-column description">描述</th>
				<th  class="text-center sort-column sort">排序</th>
				<th class="text-center">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="dict">
			<tr>
				<td> <input type="checkbox" id="${dict.id}" class="i-checks"></td>
				<td>${dict.value}</td>
				<td><a  href="#" onclick="openDialogView('查看字典', '${ctx}/sys/dict/form?id=${dict.id}','830px', '500px')">${dict.label}</a></td>
				<td><a href="javascript:" onclick="$('#type').val('${dict.type}');$('#searchForm').submit();return false;">${dict.type}</a></td>
				<td>${dict.description}</td>
				<td class="text-center">${dict.sort}</td>
				<td class="text-center">
					<shiro:hasPermission name="sys:dict:view">
						<a href="#" onclick="openDialogView('查看字典', '${ctx}/sys/dict/form?id=${dict.id}','830px', '500px')" class="table-link" ><i class="fa fa-search-plus"></i> 查看</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="sys:dict:edit">
    					<a href="#" onclick="openDialog('修改字典', '${ctx}/sys/dict/form?id=${dict.id}','830px', '500px')" class="table-link" ><i class="fa fa-edit"></i> 修改</a>
    				</shiro:hasPermission>
    				<shiro:hasPermission name="sys:dict:del">
						<a href="${ctx}/sys/dict/delete?id=${dict.id}&type=${dict.type}" onclick="return confirmx('确认要删除该字典吗？', this.href)"   class="table-link"><i class="fa fa-trash"></i> 删除</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="sys:dict:add">
						<a href="#" onclick="openDialog('添加键值', '<c:url value='${fns:getAdminPath()}/sys/dict/form?type=${dict.type}&sort=${dict.sort+10}'><c:param name='description' value='${dict.description}'/></c:url>','830px', '500px')" class="table-link" ><i class="fa fa-plus"></i> 添加键值</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<!-- 分页代码 -->
	<table:page page="${page}"></table:page>
	</div>
	</div>
</div>
</body>
</html>