/*리스트 화면에서 보이는 체크박스를 클릭시, 아이템들의 SEQ 값을 담는 list*/
var resultListSeqList=[];

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
		fncPageBoard('list','nonWorktimeConnectlist.do',pageIndexForCommonJs,'pageIndex');
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

/* 리스트에서 특정 premitive 값을 가지고 있는 element를 제거하는 코드*/
var removeItemOnceFromArray=function(arr, value) {
  var index = arr.indexOf(value);
  if (index > -1) {
    arr.splice(index, 1);
  }
  return arr;
}
/* 리스트에서 특정 premitive 값을 가지고 있는 element를 제거하는 코드*/
var removeItemAllFromArray=function(arr, value) {
  var i = 0;
  while (i < arr.length) {
    if (arr[i] === value) {
      arr.splice(i, 1);
    } else {
      ++i;
    }
  }
  return arr;
}