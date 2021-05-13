<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/> 

<link rel="stylesheet" href="/publish/ma/css/style.css"/>
<div class="tbl_wrap w100p">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%">
			<col>
			<col style="width:35%">
			<col style="width:35%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><input type="checkbox" id="col1AllCheckbox" onclick="onclickArrCol1AllCheckbox()"></th>
				<th scope="col">이름</th>
				<th scope="col">아이디</th>
				<th scope="col">이메일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
							<td><%-- 아이템 리스트용 체크박스 --%>
								<input type="checkbox" name="col1Item" id="col1Item_${result.seq}" value="${result.seq}" data-userInfo='{"id":"col1Item_${result.seq}","name":"${result.name }","email": "${result.email }","userSeq":"${result.seq }" }'>
							</td>
							<td>${result.name }</td>
							<td>${result.id }</td>
							<td>${result.email }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="4" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- //tbl end --%>
<%-- paging start --%>
<div class="paging_wrap w100p">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="pop" jsFunction="fncPageBoard2" />
	</div>
	<div class="btn_right">
		<a href="#" class="btn btn_mdl btn_write btn_mail" onclick="fncChoose();">선택</a>
	</div>
</div>
<%-- //paging end--%>

<script type="text/javascript">
<%--리스트 화면에서 보이는 체크박스를 자동으로 체크해주는 코드. 
 사용자가 체크박스를 클릭 -> 페이지네이션 링크 클릭 -> 이전 페이지링크 클릭시 예전에 클릭했던 체크박스를 유지시켜줌 --%>
col1Json= $("#col1").val().trim() ? JSON.parse($("#col1").val().trim()) : col1Json
col1Json.forEach(function(value){
	$('#'+value.id).attr('checked', 'checked');
});
chkAllBoxesAuto();

<%-- 상황을 감지하여 전체 체크박스를 자동으로 체크해주는 코드 --%>
function chkAllBoxesAuto(){
	var col1CheckedBoxes = $("[ID^=col1Item_]:checked").size();
	var col1Boxes = $("[ID^=col1Item_]").size();
	console.log("## col1CheckedBoxes: "+col1CheckedBoxes+", col1Boxes: "+col1Boxes)
	if(+col1CheckedBoxes == +col1Boxes){
		$("#col1AllCheckbox").prop('checked','checked');
	}
	else{
		$("#col1AllCheckbox").removeAttr('checked');
	}
	return false;
}

<%-- 체크박스 하나의 이벤트를 감지하는 코드 --%>
$("[ID^=col1Item_]").change(function() {
	var userInfo=$(this).attr("data-userInfo");
	userInfo=JSON.parse(userInfo);
    if(this.checked) {
    	if(checkDupArrayIndex(col1Json,userInfo.id)<0){
    		col1Json.push(userInfo);
    	}
    }
    else{
    	var col1JsonIndex=checkDupArrayIndex(col1Json,userInfo.id);
    	if(checkDupArrayIndex(col1Json,userInfo.id) > -1){
    		col1Json.splice(col1JsonIndex,1);
    	}
    }
    chkAllBoxesAuto();
    $("#col1").val(JSON.stringify(col1Json))
    return false;
});

<%-- 전체 체크박스를 클릭했을때 작동하는 이벤트 함수 --%>
var onclickArrCol1AllCheckbox=function(){
	$("#col1AllCheckbox").change(function() {
	    if(this.checked) {
			selectAllCheckbox();
	    }
	    else{
	    	unselectAllCheckbox();
	    }
	    $("#col1").val(JSON.stringify(col1Json))
	});
	return false;
}

<%-- 아이템 리스트의 모든 체크박스를 체크하는 코드 --%>
var selectAllCheckbox=function(){
	$('[ID^=col1Item_]').prop('checked', true);
	var checkedBoxes = $("[ID^=col1Item_]:checked");
	checkedBoxes.each(function() { 
		var userInfo=$(this).attr("data-userInfo");
		userInfo=JSON.parse(userInfo);
		if(checkDupArrayIndex(col1Json,userInfo.id) < 0){
	   		col1Json.push(userInfo);
	   	}
	});
}

<%-- 아이템 리스트의 모든 체크박스를 해재하는 코드 --%>
var unselectAllCheckbox=function(){
	var checkedBoxes = $("[ID^=col1Item_]:checked");
	checkedBoxes.each(function() { 
		var userInfo=$(this).attr("data-userInfo");
		userInfo=JSON.parse(userInfo);
		var col1JsonIndex=checkDupArrayIndex(col1Json,userInfo.id);
    	if(col1JsonIndex > -1){
    		col1Json.splice(col1JsonIndex,1);
    	}
	});
	$('[ID^=col1Item_]').prop('checked', false);
}

<%-- 특정 json 객체에 key값이 있나 확인하는 코드--%>
Array.prototype.getIndexOf = function(el) {

  var arr = this;

  for (var i=0; i<arr.length; i++){
     //console.log(arr[i].id);
     //console.log(el);
     if(arr[i].id==el){
       return i;
     }
     
  }
  return -1;
}

var checkDupArrayIndex=function(arrayList,itemValue){
	for (var i=0; i<arrayList.length; i++){
	     //console.log(arr[i].id);
	     //console.log(el);
	     if(arrayList[i].id==itemValue){
	       return i;
	     }
	     
	  }
	return -1;
}

var fncChoose=function() {
	var arrUserHtml='';
	if(col1Json.length > 0){
		for(var j = 0; j<col1Json.length; j++){
			arrUserHtml += '<li class="mail_select_obj" id="picked' + col1Json[j].id + '">';
			arrUserHtml += col1Json[j].name + '(' + col1Json[j].email + ')';
			<%-- \'' '\'  넣어주는 이유가 parameter를 문자열로 넘겨주기 위한 코드--%>
			arrUserHtml += '<a href="javascript:void(0)" class="mail_del btn_del" onclick="fncUserDel(\'' + col1Json[j].id + '\')">x</a>';
			arrUserHtml += '<input type="hidden" name="mailList[' + j + '].name" value="'+col1Json[j].name+'" />';
			arrUserHtml += '<input type="hidden" name="mailList[' + j + '].rEmail" value="'+col1Json[j].email+'" />';
			arrUserHtml += '<input type="hidden" name="mailList[' + j + '].userSeq" value="'+col1Json[j].userSeq+'" />';
			arrUserHtml += '</li>';
		}
	}
	window.opener.col1Json=col1Json
	opener.$("#col1").val($("#col1").val().trim());
	opener.$("#receiver").html(arrUserHtml);	
	
	self.close();
} 

</script>