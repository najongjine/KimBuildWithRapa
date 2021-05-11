$(document).ready(function(){
	/*리스트 화면에서 보이는 체크박스를 자동으로 체크해주는 코드. 
	 사용자가 체크박스를 클릭 -> 페이지네이션 링크 클릭 -> 이전 페이지링크 클릭시 예전에 클릭했던 체크박스를 유지시켜줌 */
	var resultListSeqList=$("#resultListSeqList").val();
	resultListSeqList=resultListSeqList.split(', ');
	resultListSeqList.forEach(function(value){
		$('#addListCheckbox_'+value).attr('checked', 'checked');
	});
	var resultListCheckedBoxes = $("input:checkbox[name=resultListCheckbox]:checked").size();
	var resultListBoxes = $("input:checkbox[name=resultListCheckbox]").size();
	if(resultListCheckedBoxes == resultListBoxes){
		$("#resultListAllCheckbox").attr('checked','checked');
	}
	 
	/* 체크박스 하나의 이벤트를 감지하는 코드 */
	$("input:checkbox[name=resultListCheckbox]").change(function() {
		var checkboxId=this.id.split("_")
		var checkBoxIdSeq=checkboxId[checkboxId.length-1]
		var resultListSeqListStr=$("#resultListSeqList").val();
	    if(this.checked) {
			if(resultListSeqListStr.indexOf(checkBoxIdSeq)==-1){
				$("#resultListSeqList").val(resultListSeqListStr + ', '+checkBoxIdSeq);
			}
	    }
	    else{
	    	$("#resultListSeqList").val(resultListSeqListStr.replace(', '+checkBoxIdSeq,''));
	    }
	});
});

var onclickResultListAllCheckbox=function(){
	$("#resultListAllCheckbox").change(function() {
	    if(this.checked) {
			selectAllCheckbox();
	    }
	    else{
	    	unselectAllCheckbox();
	    }
	});
}

/* 아이템 리스트의 모든 체크박스를 체크하는 코드 */
var selectAllCheckbox=function(){
	$('input:checkbox[name=resultListCheckbox]').prop('checked', true);
	var checkedBoxes = $("input:checkbox[name=resultListCheckbox]:checked");
	checkedBoxes.each(function() { 
		var checkboxId=this.id.split("_")
		var checkBoxIdSeq=checkboxId[checkboxId.length-1]
		var resultListSeqListStr=$("#resultListSeqList").val();
		if(resultListSeqListStr.indexOf(checkBoxIdSeq)==-1){
			$("#resultListSeqList").val(resultListSeqListStr + ', '+checkBoxIdSeq);
		}
	});

	return false;
}

/* 아이템 리스트의 모든 체크박스를 해재하는 코드 */
var unselectAllCheckbox=function(){
	var checkedBoxes = $("input:checkbox[name=resultListCheckbox]:checked");
	checkedBoxes.each(function() { 
		var checkboxId=this.id.split("_")
		var checkBoxIdSeq=checkboxId[checkboxId.length-1]
		var resultListSeqListStr=$("#resultListSeqList").val();
		$("#resultListSeqList").val(resultListSeqListStr.replace(', '+checkBoxIdSeq,''));
	});
	$('input:checkbox[name=resultListCheckbox]').prop('checked', false);
	return false;
}