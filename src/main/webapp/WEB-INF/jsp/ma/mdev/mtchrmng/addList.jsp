<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right">
		<a href="javascript:void(0)" class="btn btn_excel btn_sml03" onclick="excelDown('arrMemberSeq');"><span>엑셀 다운로드</span></a>
		<select id="pageCnt" class="w100"> 
			<option value="10" ${searchVO.schEtc15 eq '10' ? 'selected="selected"':''}>10개</option>
			<option value="30" ${searchVO.schEtc15 eq '30' ? 'selected="selected"':''}>30개</option>
			<option value="50" ${searchVO.schEtc15 eq '50' ? 'selected="selected"':''}>50개</option>
			<option value="100" ${searchVO.schEtc15 eq '100' ? 'selected="selected"':''}>100개</option>
		</select>
	</div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%">
			<col style="width:5%">
			<col style="width:10%">
			<col>
			<col style="width:15%">
			<col style="width:10%">
			<col style="width:15%">
			<col style="width:10%">
			<col style="width:7%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><input type="checkbox" id="chk_all" class="cursor" onclick="chkAll_event(this, 'arrMemberSeq')"/></th>
				<th scope="col">번호</th>
				<th scope="col">성명</th>
				<th scope="col" class="subject">회사명</th>
				<th scope="col">아이디</th>
				<th scope="col">휴대폰</th>
				<th scope="col">이메일</th>
				<th scope="col">등록일</th>
				<th scope="col">상태</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor">
							<td class="c" style="cursor: default;"><input type="checkbox" class="chk_box cursor" value="${result.seq}" onclick="chk_arr(this, 'arrMemberSeq');"/></td>
							<td class="c" onclick="fncPageBoard('update','updateForm.do','${result.seq}','seq')">${paginationInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.index)}</td>
							<td class="c" onclick="fncPageBoard('update','updateForm.do','${result.seq}','seq')">${empty result.name ? "-" : result.name }</td>
							<td class="l" onclick="fncPageBoard('update','updateForm.do','${result.seq}','seq')"><c:out value="${empty result.jobName ? '-' : result.jobName}"/></td>
							<td class="c" onclick="fncPageBoard('update','updateForm.do','${result.seq}','seq')">${empty result.id ? "-" : result.id }</td>
							<td class="c" onclick="fncPageBoard('update','updateForm.do','${result.seq}','seq')"><span class="tel">${empty result.hp ? "-" : result.hp }</span></td>
							<td class="c" onclick="fncPageBoard('update','updateForm.do','${result.seq}','seq')">${empty result.email ? "-" : result.email }</td>
							<td class="c" onclick="fncPageBoard('update','updateForm.do','${result.seq}','seq')">${empty result.rgstDt ? "-" : result.rgstDt }</td>
							<td class="c" onclick="fncPageBoard('update','updateForm.do','${result.seq}','seq')">
								${result.bAlTchrStus}
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="9" class="no_data">데이터가 없습니다</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- //tbl end --%>
<%-- paging start --%>
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
	<div class="btn_left">
		<a href="javascript:void(0);" class="btn btn_mdl btn_save" style="width: 100px" onclick="fncTchrStep('arrMemberSeq')">상태변경</a>
		<select id="select_tchrYn" class="w150">
			<option value="">선택</option>
			<option value="1">미신청</option>
			<option value="2">신청</option>
			<option value="3">승인</option>
			<option value="4">반려</option>
		</select>
	</div>
	<div class="btn_right">
		<a href="#" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do');">등록</a>
	</div>
</div>
<%-- //paging end--%>
<script type="text/javascript">
$(document).ready(function(){
	$(".tel").each(function(){
		numFormat($(this));		
	});
	chk_ready('arrMemberSeq');
});

$("#pageCnt").change(function(){
	$("#schEtc15").val($("#pageCnt").val());
	fncPageBoard('addList','addList.do',1);
});

function numFormat(object){
	var numVal = object.text().trim();
	numVal = numVal.replace(/^(02[0-9]{0}|0[0-9]{2}|01[0|1|6|7|8|9]{1})([0-9]{3,4})([0-9]{4})$/,"$1-$2-$3");
	object.text(numVal);
}

function excelDown(arr){
	var arrVal = $("#"+arr).val();
	if(arrVal == "" || arrVal == null){
		alert("하나이상 체크해주세요");
		return false;
 	}
	
	if(arrVal.indexOf("/") == 0){
		arrVal = arrVal.substring("1");
	}
	arrVal = arrVal.replace(/[\[\]]/g,"");
	arrVal = arrVal.replace(/[\/]/g,",");
	
	$("#arrTemp").val(arrVal);
	fncPageBoard('list','excelDown.do');
	fncLoadingEnd();
}

<%-- 전체체크 id는 chk_all, 체크박스 class는 chk_box, arr은 checkbox 값을 담을 input hidden의 id --%>
<%-- 체크박스 값 arr 담기 --%>
function chk_arr(obj, arr){
	var arrVal = $("#"+arr).val();
	
	if($(obj).prop("checked")){
		
		if(arrVal.indexOf('/['+$(obj).val()+']') > -1){
			arrVal = arrVal.replace('/['+$(obj).val()+']', '');
		}
		arrVal += '/['+$(obj).val()+']';
		$("#"+arr).val(arrVal);
		
 	}else{
 		$("#"+arr).val(arrVal.replace('/['+$(obj).val()+']', ''));
	}

	chkAll_confirm(arr);
}

<%-- 전체 체크 검증 --%>
function chkAll_confirm(arr){
	var arrVal = $("#"+arr).val();
	var allChk = true;
	
	$(".chk_box").each(function(){
		if(arrVal.indexOf('/['+$(this).val()+']') == -1){
			allChk = false;			
		}
	});
	
	if(allChk){
		$("#chk_all").prop("checked",true);	
	}else{
		$("#chk_all").prop("checked",false);
	}
}

<%-- 전체 체크 이벤트 --%>
function chkAll_event(obj, arr){
	
	if($(obj).prop("checked")){
		$(".chk_box").each(function(){
			$(this).prop("checked",true);
			chk_arr($(this), arr);
		});
	}else{
		$(".chk_box").each(function(){
			$(this).prop("checked",false);
			chk_arr($(this), arr);
		});
	}
}

<%-- addlist 체크박스 자동 체크 --%>
function chk_ready(arr){
	var arrVal = $("#"+arr).val();
	var allChk = true;
	
	if(arrVal == "" || arrVal == null){
		allChk = false;
	}else if($(".chk_box").length == 0){
		allChk = false;
	}else{
		$(".chk_box").each(function(){
			if(arrVal.indexOf('/['+$(this).val()+']') > -1){
				$(this).prop("checked",true);		
			}else{
				allChk = false;
			}
		});
	}
	
	if(allChk){
		$("#chk_all").prop("checked",true);	
	}else{
		$("#chk_all").prop("checked",false);	
	}
}

<%-- 삭제처리 일괄 ajax --%>
function fncTchrStep(arr){
	var arrVal = $("#"+arr).val();
	if($("#select_tchrYn").val() == "" || $("#select_tchrYn").val() == null){
		alert("상태를 선택해주세요");
		return false;
	}
	
	if(arrVal == "" || arrVal == null){
		alert("하나이상 체크해주세요");
		return false;
 	}
	
	if(!confirm("변경하시겠습니까?")){
		return false;
	}
	
	if(arrVal.indexOf("/") == 0){
		arrVal = arrVal.substring("1");
	}
	arrVal = arrVal.replace(/[\[\]]/g,"");
	arrVal = arrVal.replace(/[\/]/g,",");
	
	fncLoadingStart();
	$.ajax({
		method : "POST",
		url : "tchrStep.do",
		data : {'arrTemp':arrVal, 'tchrStep':$("#select_tchrYn").val()},
		dataType : "JSON",
		success : function(data){
			alert(data.msg);
			if(data.result == "success"){
				$("#"+arr).val("");
				fncPageBoard('addList','addList.do',1);
			}
		},error : function(req, text){
			alert("처리가 실패하였습니다");
		},complete : function(){
			fncLoadingEnd();
		}
	});
}
</script>