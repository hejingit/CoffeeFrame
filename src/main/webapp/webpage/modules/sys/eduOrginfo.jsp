<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache"); 
%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>咖啡易融商户通</title>

<link href="${ctxStatic}/bootstrap/3.3.4/css_default/bootstrap.min.css"
	rel="stylesheet">
<link href="${ctxStatic}/awesome/4.4/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${ctxStatic}/common/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<link href="${ctxStatic}/common/css/animate.css" rel="stylesheet">
<link href="${ctxStatic}/common/css/style.css" rel="stylesheet">
<link href="${ctxStatic}/common/css/coffee.css" rel="stylesheet">

</head>
<body class="skin-coffee gray-bg">
	<div class="other-main">
		<h1 class="other-logo" >
			<img src="${ctxStatic}/common/img/other-logo.png" alt="咖啡易融商户通"
				title="咖啡易融商户通" />
		</h1>
		<form:form id="inputForm" modelAttribute="orgRegisterInfo"
			action="${fctx}/register/submitOrgRegister" method="post"
			enctype="multipart/form-data">
			<form:hidden path="id" />
			<sys:message content="${message}" />
			<input type="hidden" value="${uid}" name="userid">
			<form:hidden path="emlBind" htmlEscape="false" class="input-text " readonly="readonly"
					 value="${email}" />
			<h2 class="coffee-title">机构信息</h2>
			<div class="other-form">
				<div class="coffee-form-group">
					<span class="label-title">企业名称</span>
					<form:input path="nameUnit" htmlEscape="false" class="input-text required" />
				</div>
				<div class="coffee-form-group">
					<span class="label-title">机构简称</span>
					<form:input path="nameUnitBrief" htmlEscape="false"
						class="input-text required" />
				</div>
				<div class="coffee-form-group">
					<span class="label-title">教育机构代码</span>
					<form:input path="eduOrgCode" id="eduOrgCode" htmlEscape="false" maxlength="6"
						class="input-text required" />

				</div>
				<div class="coffee-form-group">
					<span class="label-title">营业执照所在地</span>
					<div id="bizprov" class="select-warp">
						<select id="addrPro" name="addrPro"
							class="input-text required prov"></select> <select id="addrCity"
							name="addrCity" class="input-text required addrCity"
							disabled="disabled"></select> <select id="addrDist"
							name="addrDist" class="input-text required addrDist"
							disabled="disabled"></select>
						<p>
							<label id="addrPro-error" class="error" for="addrPro"></label> <label
								id="addrCity-error" class="error" for="addrCity"></label> <label
								id="addrDist-error" class="error" for="addrDist"></label>
						</p>
					</div>
				</div>

				<div class="coffee-form-group">
					<span class="label-title">详细地址</span>
					<form:input path="addrUnit" htmlEscape="false" class="input-text required" />
				</div>
					<div class="coffee-form-group">
					<span class="label-title">营业执照号码</span>
					<form:input path="numLicense" htmlEscape="false"
						class="input-text " />

				</div>
				<div class="coffee-form-group">
					<span class="label-title">营业执照有效期</span>
					<form:input path="expLicense" id="expLicense" htmlEscape="false"
						readonly="readonly" class="input-text " />
				</div>
				
				<div class="coffee-form-group">
					<span class="label-title">经营范围</span>
					<form:textarea path="busiUser" htmlEscape="false"  cssStyle="height:80px;" class="input-text " 
					onkeydown="checkMaxInput(this,155)"  onkeyup="checkMaxInput(this,155)" onfocus="checkMaxInput(this,155)"
					 onblur="checkMaxInput(this,155);" />
					 
				</div>
				<div class="tabs-warp">
					<div class="tabs-title">
						<!-- 营业执照类型 -->
						<div class="radio">
							<input type="radio" id="haslicenseunion2" name="typeLicense"
								class="threetoone" value="2" checked="checked"> <label
								for="haslicenseunion2">三证合一</label>
						</div>
						<div class="radio">
							<input type="radio" id="haslicenseunion0" name="typeLicense"
								class="threetoone" value="0"> <label
								for="haslicenseunion0">旧版证件</label>
						</div>
					</div>
					<div class="tabs-content">
						<div class="tab-pane active">
							<div class="coffee-form-group">
								<span class="label-title">统一社会信用代码</span>
								<form:input path="creditcode" htmlEscape="false"
									class="input-text " />
							</div>							
							<div class="coffee-form-group">
								<span class="label-title">营业执照照片</span>
								<div class="input-group coffee-file-warp">
									<input type="text" class="input-text" /> <span
										class="input-group-btn">
										<button type="button" class="btn btn-primary">上传文件</button>
									</span> <input type="file" accept="image/jpg,image/png,image/jpeg,image/bmp"
										class="input-file required" id="ubizlicense"
										name="ubizlicense" />
								</div>
								<label id="ubizlicense-error" class="error" for="ubizlicense"></label>
							</div>

			  				<div class="coffee-form-group">
                                <span class="label-title">开户许可证</span>
                                <div class="input-group coffee-file-warp">
                                    <input type="text" class="input-text" />
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-primary">上传文件</button> 
                                    </span>
                                    <input type="file" accept="image/jpg,image/png,image/jpeg,image/bmp" class="input-file required" id="ubizopenpermit" name="ubizopenpermit"/>
                                </div>
                                <label id="ubizopenpermit-error" class="error" for="ubizopenpermit"></label>
                            </div>
							<div class="coffee-form-group">
								<span class="label-title">信用代码证照片</span>
								<div class="input-group coffee-file-warp">
									<input type="text" class="input-text" /> <span
										class="input-group-btn">
										<button type="button" class="btn btn-primary">上传文件</button>
									</span> <input type="file" accept="image/jpg,image/png,image/jpeg,image/bmp"
										class="input-file " id="ubizcreditlicense"
										name="ubizcreditlicense" />
								</div>
								<label id="ubizcreditlicense-error" class="error"
									for="ubizcreditlicense"></label>
							</div>
						</div>
						<div class="tab-pane">		
							<div class="coffee-form-group">
								<span class="label-title">营业执照照片</span>
								<div class="input-group coffee-file-warp">
									<input type="text" class="input-text" /> <span
										class="input-group-btn">
										<button type="button" class="btn btn-primary">上传文件</button>
									</span> <input type="file" accept="image/jpg,image/png,image/jpeg,image/bmp"
										class="input-file required" id="fbizlicense"
										name="fbizlicense" />
								</div>
								<label id="fbizlicense-error" class="error" for="fbizlicense"></label>
							</div>
							<div class="coffee-form-group">
								<span class="label-title">注册号</span>
								<form:input path="registerno" htmlEscape="false"
									class="input-text " />
							</div>
							<div class="coffee-form-group">
								<span class="label-title">组织机构代码</span>

								<form:input path="orgCode" htmlEscape="false"
									class="input-text " />
							</div>
							<div class="coffee-form-group">
								<span class="label-title">组织机构代码有效期</span>
								<form:input path="expOrgcode" htmlEscape="false"
									class="input-text " />
							</div>							
							<div class="coffee-form-group">
								<span class="label-title">组织机构代码证</span>
								<div class="input-group coffee-file-warp">
									<input type="text" class="input-text" /> <span
										class="input-group-btn">
										<button type="button" class="btn btn-primary">上传文件</button>
									</span> <input type="file" accept="image/jpg,image/png,image/jpeg,image/bmp"
										class="input-file required" id="forgcodelicense"
										name="forgcodelicense" />
								</div>
								<label id="forgcodelicense-error" class="error"
									for="forgcodelicense"></label>
							</div>
							<div class="coffee-form-group">
								<span class="label-title">税务登记证</span>
								<div class="input-group coffee-file-warp">
									<input type="text" class="input-text" /> <span
										class="input-group-btn">
										<button type="button" class="btn btn-primary">上传文件</button>
									</span> <input type="file" accept="image/jpg,image/png,image/jpeg,image/bmp"
										class="input-file required" id="ftaxlicense"
										name="ftaxlicense" />
								</div>
								<label id="ftaxlicense-error" class="error" for="ftaxlicense"></label>
							</div>
							<div class="coffee-form-group">
								<span class="label-title">开户许可证</span>
								<div class="input-group coffee-file-warp">
									<input type="text" class="input-text" /> <span
										class="input-group-btn">
										<button type="button" class="btn btn-primary">上传文件</button>
									</span> <input type="file" accept="image/jpg,image/png,image/jpeg,image/bmp"
										class="input-file required" id="fbizopenpermit"
										name="fbizopenpermit" />
								</div>
								<label id="fbizopenpermit-error" class="error"
									for="fbizopenpermit"></label>
							</div>
							<div class="coffee-form-group">
								<span class="label-title">信用代码证</span>
								<div class="input-group coffee-file-warp">
									<input type="text" class="input-text" /> <span
										class="input-group-btn">
										<button type="button" class="btn btn-primary">上传文件</button>
									</span> <input type="file" accept="image/jpg,image/png,image/jpeg,image/bmp"
										class="input-file required" id="ubizcreditlicense"
										name="ubizcreditlicense" />
								</div>
								<label id="ubizcreditlicense-error" class="error"
									for="ubizcreditlicense"></label>
							</div>
						</div>
						<div class="panel-tips">
							<p>证件要求：</p>
							<p>1. 支持jpg/png/bmp格式图片，大小不超过5M</p>
							<p>2. 企业证件必须为中国大陆工商局颁发，在有效期内的正本或副本复印件（加盖公章）</p>
						</div>
					</div>
				</div>
			</div>
			<h2 class="coffee-title">法人信息</h2>
			<div class="other-form">
				<div class="coffee-form-group">
					<span class="label-title">绑定手机号码</span>
					<form:input path="mobBind" htmlEscape="false"
						class="input-text required" />
				</div>
				<div class="coffee-form-group">
					<span class="label-title">法人姓名</span>
					<form:input path="nameUser" htmlEscape="false" class="input-text required" />

				</div>
					<!-- 支持身份证0 -->
					<form:hidden path="typeIdcard" htmlEscape="false" class="input-text " value="0"/>
					<form:hidden path="typeExpidcard" htmlEscape="false" class="input-text " value="0" />
				<div class="coffee-form-group">
					<span class="label-title">法人身份证号</span>
					<form:input path="noIdcard" htmlEscape="false" class="input-text " />
				</div>
				<div class="coffee-form-group">
					<span class="label-title">身份证有效期</span>
					<form:input path="expIdcard" htmlEscape="false" class="input-text " />

				</div>
				<div class="coffee-form-group">
                    <span class="label-title">身份证正面照片</span>
                    <div class="input-group coffee-file-warp">
                        <input type="text" class="input-text" />
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-primary">上传文件</button> 
                        </span>
                        <input type="file" accept="image/jpg,image/png,image/jpeg,image/bmp" class="input-file required" id="fcertfrontpic" name="fcertfrontpic" />
                    </div>
                    <label id="fcertfrontpic-error" class="error" for="fcertfrontpic"></label>
                </div>
                <div class="coffee-form-group">
                    <span class="label-title">身份证背面照片</span>
                    <div class="input-group coffee-file-warp">
                        <input type="text" class="input-text" />
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-primary">上传文件</button> 
                        </span>
                        <input type="file" accept="image/jpg,image/png,image/jpeg,image/bmp" class="input-file required" id="fcertbackpic" name="fcertbackpic" />
                    </div>
                    <label id="fcertbackpic-error" class="error" for="fcertbackpic"></label>
                </div>
			</div>
			<h2 class="coffee-title">银行卡信息</h2>
			<div class="other-form">
              <div class="coffee-form-group">
                    <span class="label-title">开户银行</span>
                    <div class="select-warp">
                        <select class="input-text one required" id="bankCode" name="bankCode">
                             <option value="" selected="selected">请选择</option>
                            <c:forEach items="${fns:getDictList('bank_list')}" var="item">
                                <option value="${item.value}">${item.label}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
				<div class="coffee-form-group">
					<span class="label-title">银行账号</span>

					<form:input path="cardNo" htmlEscape="false" class="input-text " />
				</div>
                <div class="coffee-form-group">
                    <span class="label-title">开户行所在地</span>
                    <div id="bankprov" class="select-warp">
                    	
                        <select class="input-text required" id="bankProvinceCode" name="bankProvinceCode"></select>
                        <select class="input-text required" id="bankCityCode" name="bankCityCode" disabled="disabled"></select>
                        <select class="input-text required" id="bankCountryCode" name="bankCountryCode" disabled="disabled"></select>
                        <p>
                            <label id="bankProvinceCode-error" class="error" for="bankProvinceCode"></label>
                            <label id="bankCityCode-error" class="error" for="bankCityCode"></label>
                            <label id="bankCountryCode-error" class="error" for="bankCountryCode"></label>
                        </p>
                    </div>
                </div>
				<div class="coffee-form-group">
					<span class="label-title">开户支行名称</span>
					<form:input path="brabankName" htmlEscape="false"
						class="input-text " />
				</div>
		
			</div>
			<h2 class="coffee-title">教育产品分类</h2>
			<div class="other-form">
				<div class="coffee-form-group">
					<span class="label-title">请选择</span>
					<ul id="select-product" class="select-product">
						<c:forEach items="${productions}" var="item">
							<li id="${item.itemno}" finantial="${item.finantialno}">${item.itemname}</li>
						</c:forEach>
					</ul>
					<input type="hidden" class="input-text" id="productions"
						name="productions" data-rule-validProductions="true"
						aria-required="true" />
				</div>

			</div>
			<button type="submit" class="btn-primary other-form-button">提交材料</button>
		</form:form>
	</div>
	<br/>
	<br/>
	<!-- Mainly scripts -->
	<script src="${ctxStatic}/jquery/jquery-2.1.1.min.js"
		type="text/javascript"></script>
	<script src="${ctxStatic}/jquery/jquery-migrate-1.1.1.min.js"
		type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.14.0/jquery.validate.js"
		type="text/javascript"></script>
	<script
		src="${ctxStatic}/jquery-validation/1.14.0/additional-methods.min.js"
		type="text/javascript"></script>
	<script
		src="${ctxStatic}/jquery-validation/1.14.0/localization/messages_zh.min.js"
		type="text/javascript"></script>
	<script src="${ctxStatic}/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script src="${ctxStatic}/layer-v2.3/layer/layer.js"></script>
	<script src="${ctxStatic}/layer-v2.3/layer/laydate/laydate.js"></script>
	<script
		src="${ctxStatic}/jquery-plugin/cityselect/jquery.cityselect.js"></script>

	<script type="text/javascript">
	
    //多行文本输入框剩余字数计算  
    function checkMaxInput(obj, maxLen) {  
        if (obj == null || obj == undefined || obj == "") {  
            return;  
        }  
        if (maxLen == null || maxLen == undefined || maxLen == "") {  
            maxLen = 100;  
        }  

        var strResult;  
        var $obj = $(obj);  
        var newid = $obj.attr("id") + 'msg';  

        if (obj.value.length > maxLen) { //如果输入的字数超过了限制  
            obj.value = obj.value.substring(0, maxLen); //就去掉多余的字  
            strResult = '<span id="' + newid + '" class=\'Max_msg\' ><br/>剩(' + (maxLen - obj.value.length) + ')字</span>'; //计算并显示剩余字数  
        }  
        else {  
            strResult = '<span id="' + newid + '" class=\'Max_msg\' ><br/>剩(' + (maxLen - obj.value.length) + ')字</span>'; //计算并显示剩余字数  
        }  

        var $msg = $("#" + newid);  
        if ($msg.length == 0) {  
            $obj.after(strResult);  
        }  
        else {  
            $msg.html(strResult);  
        }  
    } 
		var validateForm;
		$(document).ready(function() {
			validateForm = $("#inputForm").validate(
					{
						submitHandler : function(form) {
							loading('正在提交，请稍等...');
							form.submit();
						},
						errorContainer : "#messageBox",
						errorPlacement : function(error, element) {
							$("#messageBox").text("输入有误，请先更正。");
							if (element.is(":checkbox")
									|| element.is(":radio")
									|| element.parent().is(
											".input-append")) {
								error.appendTo(element.parent()
										.parent());
							} else {
								error.insertAfter(element);
							}
						}
					});
			
			//校验教育机构代码是否存在
			$("#eduOrgCode").click(function(){
				$("#eduOrgCode-msg").remove();
			})
			
			$("#eduOrgCode").change(function(){
				var eduOrgCode = $("#eduOrgCode").val();
				$("#eduOrgCode-msg").remove();
				if(eduOrgCode=="") {
					return false;
				}
				$.get("${fctx}/register/validateEduOrgCode?eduOrgCode="+eduOrgCode, function(data){
					if(data.errorCode == "1") {
						$("#eduOrgCode").val("");
						$("#eduOrgCode").after('<label id="eduOrgCode-msg" class="error" for="nameUnit" style="display: inline-block;">'+data.msg+'</label>');	
					}
					if(data.errorCode == "2") {
						$("#eduOrgCode").after('<label id="eduOrgCode-msg" class="error" for="nameUnit" style="display: inline-block;">'+data.msg+'</label>');
					}
				});
			});
			
			laydate({
	            elem: '#expIdcard',
	            min: laydate.now(1),
	            event: 'focus',
	            format:'YYYY-MM-DD'
	        });
	        laydate({
	            elem: '#expLicense', 
	            min: laydate.now(1),
	            event: 'focus',
	            format:'YYYY-MM-DD'
	        });
	        laydate({
	            elem: '#expOrgcode',
	            min: laydate.now(1),
	            event: 'focus',
	            format:'YYYY-MM-DD'
	        });
	        
			
			if ($(".coffee-file-warp").length > 0) {
				$(".input-file").change(function() {
					$(this).prevAll(".input-text").val($(this).val());
				});
			}

			if ($('.tabs-warp').length > 0) {
				$('.tabs-title .radio').click(
						function() {
							$(".tabs-content > .tab-pane")
									.removeClass("active")
									.eq($('.tabs-title .radio').index(this))
									.addClass("active");
						});
			}

			$.validator.addMethod("validProductions", function(value,
					element) {
				return $('#productions').val().length > 0;
			}, "至少选择一个产品");

			$("#orgDetailForm").validate({
						ignore : [],
						rules : {

						},
						messages : {},
						submitHandler : function(form) {
							loading('正在提交，请稍等...');
							form.submit();
						},
						errorContainer : "#messageBox",
						errorPlacement : function(error, element) {
							$("#messageBox").text("输入有误，请先更正。");
							if (element.is(":checkbox")
									|| element.is(":radio")
									|| element.parent().is(
											".input-append")) {
								error.appendTo(element.parent().parent());
							} else {
								error.insertAfter(element);
							}
						}
					});

			$("#fbizlicense").removeClass("required");
			$("#forgcodelicense").removeClass("required");
			$("#ftaxlicense").removeClass("required");
			$("#fbizopenpermit").removeClass("required");
			$("#registerno").removeClass("required");

			$(".threetoone").on(
					"click",
					function() {
						var checkedVal = $(this).val() == null ? "0": $(this).val();
						if (checkedVal == 2) {
							$("#fbizlicense").removeClass("required");
							$("#forgcodelicense").removeClass(
									"required");
							$("#ftaxlicense").removeClass("required");
							$("#fbizopenpermit")
									.removeClass("required");
							$("#fbizcreditlicense").removeClass(
									"required");
							$("#registerno").removeClass("required");

							$("#ubizlicense").addClass("required");
							$("#ubizopenpermit").addClass("required");

						} else if (checkedVal == 0) {
							$("#ubizlicense").removeClass("required");
							$("#ubizopenpermit").removeClass("required");
							
							$("#registerno").addClass("required");
							$("#fbizlicense").addClass("required");
							$("#forgcodelicense").addClass("required");
							$("#ftaxlicense").addClass("required");
							$("#fbizopenpermit").addClass("required");
							
						}
					});

			$("#bizprov").citySelect({
				ids : [ "addrPro", "addrCity", "addrDist" ],
				nodata : "none",
				required : false
			});

			$("#bankprov").citySelect({
				ids : [ "bankProvinceCode", "bankCityCode", "bankCountryCode" ],
				nodata : "none",
				required : false
			});
			
			$(".select-product li").click(function() {
				$(this).toggleClass("active");
				var productions = "";
				$("#select-product li").each(function(index) {
					if ($(this).attr("class") == "active") {
						productions += $(this).attr("id")+"-"+$(this).text()+"-"+ $(this).attr("finantial") + ",";
					}
				});
				$("#productions").val(productions);

			});

		});
	</script>
</body>
</html>