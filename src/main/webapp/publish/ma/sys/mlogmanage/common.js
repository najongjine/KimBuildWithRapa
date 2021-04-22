$(document).ready(function(){
	fncDate('searchStartDate','searchEndDate');
	fncPageBoard('addList','addList.do',pageIndexForCommonJs);
});
var searchLog=function(cat){
	
	switch(cat){
	case 0:
		$("#schEtc01").val('');
		fncPageBoard('list','list.do',pageIndexForCommonJs,'pageIndex');
		break;
	case 1:
		$("#schEtc01").val('nonWorktimeConnect');
		fncPageBoard('list','list.do',pageIndexForCommonJs,'pageIndex');
		break;
	case 2:
		$("#schEtc01").val('multipleConAttemp');
		fncPageBoard('list','multipleConAttemplist.do',pageIndexForCommonJs,'pageIndex');
		break;
	case 3:
		$("#schEtc01").val('bannedIpConAttemp');
		fncPageBoard('list','bannedIpConAttemplist.do',pageIndexForCommonJs,'pageIndex');
		break;
	case 4:
		$("#schEtc01").val('loginFailed');
		fncPageBoard('list','loginFailedlist.do',pageIndexForCommonJs,'pageIndex');
		break;
	}
	return false;
}
var resetTime=function(){
	$("#schEtc02").val('----');
	$("#schEtc03").val('----');
	return false;
}