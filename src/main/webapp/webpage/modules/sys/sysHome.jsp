<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>咖啡易融商户通</title>

<link href="${ctxStatic}/bootstrap/3.3.4/css_default/bootstrap.min.css"
	rel="stylesheet">
<link href="${ctxStatic}/awesome/4.4/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${ctxStatic}/common/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<!-- Toastr style -->
<link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">

<!-- Gritter -->
<link href="${ctxStatic}/gritter/jquery.gritter.css" rel="stylesheet">

<link href="${ctxStatic}/common/css/animate.css" rel="stylesheet">
<link href="${ctxStatic}/common/css/style.css" rel="stylesheet">

<link href="${ctxStatic}/common/css/coffee.css" rel="stylesheet">

</head>

<body class="skin-coffee gray-bg">
	
		<div class="wrapper wrapper-content animated fadeIn">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox">
						<div class="ibox-content coffee-content">
							<div class="data-overview">
									<div class="pull-left overview-left">
										<strong>帐户余额</strong>
										<p><span>&yen;</span>${ repObject.balance == null ?'0.00':repObject.balance}</p>
									</div>
									<div class="pull-right overview-right">
											<button id="walletRecharge"><i class="coffee-icon icon01"></i><span>充值</span></button>
											<button id="walletCashout"><i class="coffee-icon icon02"></i><span>提现</span></button>
											<!-- <button id="walletDetail"><i class="coffee-icon icon03"></i><span>帐户明细</span></button> -->
									</div>
							</div>
							<h2 class="coffee-title">统计概览</h2>
							<ul class="index-data">
								<li>
									<strong class="red"><i>&yen;</i>${loanStat.loanAmount}</strong>
									<span>总放款额</span>
								</li>
								<li>
									<strong>${loanStat.loanCnt}</strong>
									<span>总放款笔数</span>
								</li>
								<li>
									<strong class="red"><i>&yen;</i>${loanStat.applyAmount}</strong>
									<span>总申请额</span>
								</li>
								<li>
									<strong>${loanStat.applyCnt}</strong>
									<span>总申请笔数</span>
								</li>
							</ul>
							<div class="chart-warp">
								<div class="coffee-form">
									<input id="stime" name="stime" type="text" maxlength="20"
										class="input-text input-text-date layer-date"
										value="${loanStat.stime}"/>
									<em class="coffee-date-line"></em>
									<input id="etime" name="etime"
										type="text" maxlength="20"
										class="input-text input-text-date layer-date"
										value="${loanStat.etime}" />
										<button class="btn-primary" id="query"><i class="fa fa-search"></i> 查询</button>
								</div>
								<div class="chart-content" id="chart"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	

	<!-- Mainly scripts -->

	<!-- Mainly scripts -->
	<script src="${ctxStatic}/jquery/jquery-2.1.1.min.js"
		type="text/javascript"></script>
	<script src="${ctxStatic}/jquery/jquery-migrate-1.1.1.min.js"
		type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.14.0/jquery.validate.js"
		type="text/javascript"></script>
	<script
		src="${ctxStatic}/jquery-validation/1.14.0/localization/messages_zh.min.js"
		type="text/javascript"></script>
	<script src="${ctxStatic}/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<!-- 引入layer插件 -->
	<script src="${ctxStatic}/layer-v2.3/layer/layer.js"></script>
	<script src="${ctxStatic}/layer-v2.3/layer/laydate/laydate.js"></script>

	<script src="${ctxStatic}/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctxStatic}/slimscroll/jquery.slimscroll.min.js"></script>


	<script src="${ctxStatic}/common/inspinia.js"></script>
	<script src="${ctxStatic}/pace/pace.min.js"></script>

	<script src="${ctxStatic}/echarts/echarts.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/coffee/common.js"></script>
	<script type="text/javascript">
   
		var linebar = echarts.init(document.getElementById('chart'));
		linebar.option = {
			tooltip : {
				trigger: 'axis'
			},
			legend : {
				x : 'center',
				y : 'bottom',
				itemGap : 40,
				data : ['申请单量',"申请金额(元)"]
			},
			grid : {
				top : '8%',
				left : '0',
				right : '0',
				bottom : '25%',
				containLabel : true
			},
			xAxis : [ {
				type : 'category',
				data : [],
				axisLabel : {
					textStyle : {
						color : '#575757'
					}
				},
				axisLine : {
					lineStyle : {
						color : '#C9C9C9'
					}
				}
			} ],
			
			yAxis : [ {
				type : 'value',
				name: '单量',
				min : 0,
				scale : true,
				axisLabel : {
					formatter : '{value}',
					textStyle : {
						color : '#575757'
					}
				},
				axisLine : {
					show : false
				},
				axisTick : {
					show : false
				},
				splitArea : {
					show : true,
					areaStyle : {
						color : '#FFF'
					}
				},
				splitLine : {
					show : false
				}
			}, 
			{
				type : 'value',
				name : '金额(元)',
				min : 0,
				axisLabel : {
					formatter : '{value}',
					textStyle : {
						color : '#575757'
					}
				},
				axisLine : {
					show : false
				},
				axisTick : {
					show : false
				},
				splitLine : {
					show : false
				}
			} ],
			series : [{
						type : 'bar',
						name : '申请单量',
						data : [],
						barMaxWidth : 30,
						itemStyle : {
							normal : {
								color : '#33acca'
							}
						}
					},
					{
						type : 'line',
						name : '申请金额(元)',
						yAxisIndex : 1,
						areaStyle : {
							normal : {
								opacity : "0.2"
							}
						},
						data : [],
						symbol : 'circle',
						itemStyle : {
							normal : {
								color : '#DF6650'
							}
						}
					} ]
		};
		linebar.showLoading({"text":"加载中..."});    //loading
		

		function loadOption(st,et){ 
		    $.ajax({  
		        url: '${ctx}/statOverview?stime='+st+'&etime='+et,  
		        type: 'post',  
		        dataType: 'json',  
		        async: true,  
		        success: function (data) {  
		            if (data){  
	            	      linebar.hideLoading();
						  linebar.setOption({
							xAxis : {
								data : data.dayTime
							},
							series : [ {
								data : data.loanCnt
							}, {
								data : data.loanAmount
							} ]
						});
					}
				},
				error : function() {
					alert("请求失败!");
				}
			})
		}
		
$(document).ready(function() {
			linebar.setOption(linebar.option);
			$(window).resize(function() {
				linebar.resize();
			});

	        laydate({
	            elem: '#stime', 
	            event: 'focus',
	            format:'YYYY/MM/DD'
	        });
	        laydate({
	            elem: '#etime', 
	            event: 'focus',
	            format:'YYYY/MM/DD'
	        });
	       //init loading data
	       
			var stime = $("#stime").val();
			var etime = $("#etime").val();
			loadOption(stime, etime);  
			
			//
			$("#query").click(function(){
				var stime=$("#stime").val();
				var etime=$("#etime").val();
				if(stime=="" || etime==""){
					top.layer.alert("请输入有效的时间范围！", {icon: 0});
					return;
				}else if(compare2Days(stime,etime)<0){
					top.layer.alert("结束日期不能小于开始日期,请重新选择！", {icon: 0});
					$("#etime").val("");
					return;
				}
				linebar.showLoading({"text":"加载中..."}); 
				loadOption(stime, etime);
			});
			
			//
			$("#walletDetail").click(function(){
				var stime=$("#stime").val();
				var etime=$("#etime").val();
				if(stime=="" || etime==""){
					top.layer.alert("请输入有效的时间范围！", {icon: 0});
					return;
				}else if(compare2Days(stime,etime)<0){
					top.layer.alert("结束日期不能小于开始日期,请重新选择！", {icon: 0});
					$("#etime").val("");
					return;
				}
				var offset="0";
				var maxRecordes="10";
				
			    $.ajax({  
			        url: '${ctx}/account/query/paymentDetail?dtStart='+stime+'&dtEnd='+etime+"&offset="+offset+"&maxRecordes="+maxRecordes,  
			        type: 'post',  
			        dataType: 'json',  
			        async: true,  
			        success: function (resp) {  
			            if (resp){  
		            	   alert(resp.body.data);
						}
					},
					error : function() {
						alert("请求失败!");
					}
				})
			});
			
		
		});
		
//
$('#walletRecharge').on('click', function() {
	index=top.layer.open({
		type : 1,
		title : '账户充值',
		btn : [ '确定充值', '取消' ],
		area : ['400px','265px'],
		scrollbar: false,
		content :'<div  class="dialog-refunds-apply"> \
					<div class="form-group money" style="height:36px;"> \
						<span class="label-text">账户余额</span> \
						<p><span>&yen;</span>${ repObject.balance == null ?"0.00":repObject.balance}</p> \
					</div> \
					<div class="form-group money"> \
						<span class="label-text">充值金额：</span> <input type="text" id="rechargeAmount" /> \
					</div> \
				</div>',
		yes : function(index, layero) {
			var rAmount = layero.find("#rechargeAmount").val();
			if (rAmount === "") {
				parent.layer.msg("充值金额不能为空");
				layero.find("#rechargeAmount").val("");
				layero.find("#rechargeAmount").focus();
				return false;
			}else if(isNaN(rAmount)){
				parent.layer.msg("充值金额只能为数字");
				layero.find("#rechargeAmount").val("");
				layero.find("#rechargeAmount").focus();
				return false;
			}else if (Number(rAmount) <= 0) {
				top.layer.msg("充值金额必须大于0");
				layero.find("#rechargeAmount").val("");
				layero.find("#rechargeAmount").focus();
				return false;
			} else {
				var loadindex = top.layer.load();// 数据加载成功之前，使用loading组件
				$.ajax({  
			        url: '${ctx}/account/recharge/sign?moneyOrder='+rAmount,  
			        type: 'post',  
			        dataType: 'json',  
			        async: true,  
			        success: function (resp) {  
			            if (resp){
			            	$("#rechargeForm").attr("action",resp.recharge_url);
			            	$("#version").val(resp.version);
							$("#platform").val(resp.platform);
							$("#oid_partner").val(resp.oid_partner);
							$("#timestamp").val(resp.timestamp);
							$("#userreq_ip").val(resp.userreq_ip);
							$("#sign_type").val(resp.sign_type);
							$("#sign").val(resp.sign);
							$("#user_login").val(resp.user_login);
							$("#busi_partner").val(resp.busi_partner);
							$("#no_order").val(resp.no_order);
							$("#dt_order").val(resp.dt_order);
							$("#name_goods").val(resp.name_goods);
							$("#money_order").val(resp.money_order);
							$("#info_order").val(resp.info_order);
							$("#notify_url").val(resp.notify_url);
							/* $("#url_return").val(resp.url_return); */
							$("#rechargeForm").submit();
							top.layer.close(index);
							top.layer.alert("完成充值！", {
								icon: 3, title:'充值结果',
								yes : function(index, layero) {
									location.reload();
									top.layer.close(index);
								},
								cancel : function(index, layero) {
									location.reload();
									top.layer.close(index);
								} 
								
							}, function(index){
							    top.layer.close(index);
							}); 
						}
			            top.layer.close(loadindex);
					},
					error : function() {
						top.layer.msg("充值失败，请稍后重试！");
						top.layer.close(loadindex);
					}
				});
			}
		}
	});
});	
$('#walletCashout').on('click', function() {
	index=top.layer.open({
		type : 1,
		title : '账户提现',
		btn : [ '确定提现', '取消' ],
		area : ['400px','315px'],
		scrollbar: false,
		content :'<div  class="dialog-refunds-apply"> \
					<div class="form-group money" style="height:36px;"> \
						<span class="label-text">可提现金额</span> \
						<p><span>&yen;</span>${ repObject.balance == null ?"0.00":repObject.balance}</p> \
					</div> \
					<div class="form-group money"> \
						<span class="label-text">提现金额：</span> <input type="text" id="cashoutAmount" /> \
					</div> \
					<div class="form-group"> \
						<span class="label-text">支付密码：</span> <input type="password" id="pwdPay" /> \
					</div> \
				</div>',
		yes : function(index, layero) {
			var rAmount = layero.find("#cashoutAmount").val();
			var pwdPay = layero.find("#pwdPay").val();
			if (rAmount === "") {
				parent.layer.msg("提现金额不能为空");
				layero.find("#cashoutAmount").val("");
				layero.find("#cashoutAmount").focus();
				return false;
			}else if(isNaN(rAmount)){
				parent.layer.msg("提现金额只能为数字");
				layero.find("#cashoutAmount").val("");
				layero.find("#cashoutAmount").focus();
				return false;
			}else if(pwdPay === "") {
				parent.layer.msg("支付密码不能为空");
				layero.find("#pwdPay").val("");
				layero.find("#pwdPay").focus();
				return false;
			}else if (Number(rAmount) <= 0) {
				top.layer.msg("提现金额必须大于0");
				layero.find("#cashoutAmount").val("");
				layero.find("#cashoutAmount").focus();
				return false;
			} else {
				var loadindex = top.layer.load();// 数据加载成功之前，使用loading组件
				$.ajax({  
			        url: '${ctx}/account/cashout/apply?moneyOrder='+rAmount+'&pwdPay='+pwdPay,  
			        type: 'post',  
			        dataType: 'json',  
			        async: true,  
			        success: function (resp) {  
			            if (resp){
			            	if("0000" == resp.ret_code){
								top.layer.close(index);
								indexS = top.layer.open({
									type : 1,
									title : '账户提现',
									btn : [ '确定'],
									area : ['400px','315px'],
									scrollbar: false,
									content :'<div id="tips" class="dialog-refunds-success"> \
												<div class="coffee-success" style="margin-top:50px;"> \
												<span class="coffee-icon"></span> \
													<p>您提交的<strong id="rAmount">'+rAmount+'</strong>元提现操作已完成<br />请耐心等待提现结果！</p> \
												</div>\
											</div>',
									yes : function(index, layero) {
										location.reload();
										top.layer.close(index);
									}
					            });
							}else{
								top.layer.close(index);
								indexS = top.layer.open({
									type : 1,
									title : '账户提现',
									btn : [ '确定'],
									area : ['400px','315px'],
									scrollbar: false,
									content :'<div id="tipf" class="dialog-refunds-success">\
												<div class="coffee-error" style="margin-top:50px;">\
													<span class="coffee-icon"></span>\
													<p><strong id="ret_msg">['+resp.ret_code+']'+resp.ret_msg+'</strong><br /></p>\
												</div>\
											</div>',
									yes : function(index, layero) {
										location.reload();
										top.layer.close(index);
									}
					            });
							}
						}
						top.layer.close(loadindex);
					},
					error : function() {
						top.layer.msg("提现失败，请稍后重试！");
						top.layer.close(loadindex);
					}
				});
			}
		}
	});
});
</script>
<form action="" method="post" id="rechargeForm" target="_blank" style="display: none">
	<input type="text" id="version" name="version">
	<input type="text" id="platform" name="platform">
	<input type="text" id="oid_partner" name="oid_partner">
	<input type="text" id="timestamp" name="timestamp">
	<input type="text" id="userreq_ip" name="userreq_ip">
	<input type="text" id="sign_type" name="sign_type">
	<input type="text" id="sign" name="sign">
	<input type="text" id="user_login" name="user_login">
	<input type="text" id="busi_partner" name="busi_partner">
	<input type="text" id="no_order" name="no_order">
	<input type="text" id="dt_order" name="dt_order">
	<input type="text" id="name_goods" name="name_goods">
	<input type="text" id="money_order" name="money_order">
	<input type="text" id="info_order" name="info_order">
	<input type="text" id="notify_url" name="notify_url">
	<!-- <input type="text" id="url_return" name="url_return"> -->
	<input type="submit">
</form>
</body>

</html>
