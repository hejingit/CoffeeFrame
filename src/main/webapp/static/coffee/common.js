function addDate(date,days){ 
	var d=new Date(date); 
	d.setDate(d.getDate()+days); 
	var month=d.getMonth()+1; 
	var day = d.getDate(); 
	if(month<10){ 
		month = "0"+month; 
	} 
	if(day<10){ 
		day = "0"+day; 
	} 
	var val = d.getFullYear()+"-"+month+"-"+day; 
	return val; 
}

function addDate2(date,days){ 
	var d=new Date(date); 
	d.setDate(d.getDate()+days); 
	var month=d.getMonth()+1; 
	var day = d.getDate(); 
	if(month<10){ 
		month = "0"+month; 
	} 
	if(day<10){ 
		day = "0"+day; 
	} 
	var val = d.getFullYear()+"/"+month+"/"+day; 
	return val; 
}

function day30ago(){
	$("#endCreateTime").val(addDate(new Date(),0))
	$("#startCreateTime").val(addDate(new Date(),-29))
}

function day7ago(){
	$("#endCreateTime").val(addDate(new Date(),1))
	$("#startCreateTime").val(addDate(new Date(),-7))
}


function compare2Days(sdate,edate){     
	  var aDate, oDate1, oDate2, iDays      
	  aDate = sdate.split("-");      
	  oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0])   //转换为12-13-2008格式      
	  aDate = edate.split("-");      
	  oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0])      
	  iDays = parseInt((oDate2 - oDate1) / 1000 / 60 / 60 /24);        
	  return iDays;	      
}
function checkForm(){
	var stime=$("#startCreateTime").val();
	var etime=$("#endCreateTime").val();
	if(stime!="" && etime!="" && compare2Days(stime,etime)<0){
		top.layer.msg("结束日期不能小于开始日期,请重新选择！");
		$("#endCreateTime").val("");
		$("#endCreateTime").focus();
		return false;
	}
	return true;
}
function query(){
	if(checkForm()){
		search();
	}else{
		return;
	}
}

var format=function(date,fmt) { 
	
    var o = {         
    "M+" : date.getMonth()+1, //月份         
    "d+" : date.getDate(), //日         
    "h+" : date.getHours()%12 == 0 ? 12 : date.getHours()%12, //小时         
    "H+" : date.getHours(), //小时         
    "m+" : date.getMinutes(), //分         
    "s+" : date.getSeconds(), //秒         
    "q+" : Math.floor((date.getMonth()+3)/3), //季度         
    "S" : date.getMilliseconds() //毫秒         
    };         
    var week = {         
    "0" : "/u65e5",         
    "1" : "/u4e00",         
    "2" : "/u4e8c",         
    "3" : "/u4e09",         
    "4" : "/u56db",         
    "5" : "/u4e94",         
    "6" : "/u516d"        
    };         
    if(/(y+)/.test(fmt)){         
        fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));         
    }         
    if(/(E+)/.test(fmt)){         
        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[date.getDay()+""]);         
    }         
    for(var k in o){         
        if(new RegExp("("+ k +")").test(fmt)){         
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));         
        }         
    }         
    return fmt;         
}

function time_range(beginTime, endTime, nowTime) {
    var strb = beginTime.split (":");
    if (strb.length != 2) {
        return false;
    }

    var stre = endTime.split (":");
    if (stre.length != 2) {
        return false;
    }

    var strn = nowTime.split (":");
    if (stre.length != 2) {
        return false;
    }
    var b = new Date ();
    var e = new Date ();
    var n = new Date ();

    b.setHours (strb[0]);
    b.setMinutes (strb[1]);
    e.setHours (stre[0]);
    e.setMinutes (stre[1]);
    n.setHours (strn[0]);
    n.setMinutes (strn[1]);

    if (n.getTime () - b.getTime () > 0 && n.getTime () - e.getTime () < 0) {
        return true;
    } else {
        return false;
    }
}