<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<style>
.font_red {color:#ff6565; font-weight:bold;}
</style>
<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
	<input type="hidden" name="selectedYear" id="selectedYear" value="${searchVO.selectedYear }"/>
	<input type="hidden" name="selectedMonth" id="selectedMonth" value="${searchVO.selectedMonth }"/>
	<input type="hidden" name="schYearMonth" id="schYearMonth" value="${searchVO.schYearMonth }"/>
	<input type="hidden" name="seq" id="seq" value="${caVO.seq }"/>
	<div class="content_box">
		<div class="tbl_wrap mar_t20">
			<table class="tbl_row_type01">
				<colgroup>
					<col width="20%">
					<col>
				</colgroup>
				<tbody id="calTbody">
					<tr>
						<th>날짜 </th>
						<td>
							<span class="calendar_input"><form:input path="dataDate" id="dataDate" readonly="true" class="text"/></span>
							<label><input type="checkbox" name="holYn" id="holYn" value="Y" style="margin-left:20px;" <c:if test="${caVO.holYn eq 'Y' }">checked="checked"</c:if> />공휴일여부</label>
						</td>
					</tr>
					<tr id="trHolidayCont">
					</tr>
					<c:choose>
						<c:when test="${resultListSize lt 1}">
							<tr id="trCont_0">
								<th id="thCont">메모</th>
								<td>
									<input type="text" name="caList[0].cont" id="cont_0" class="text w80p" maxlength="100" />
									<a href="javascript:void(0)"  class="btn btn_sml02 btn_add r"  onclick="addContHtml()" >추가</a>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="result" items="${resultList }" varStatus="status">
								<tr id="trCont_${status.index}">
									<c:choose>
										<c:when test="${status.count eq 1}">
											<th id="thCont" rowspan="${resultListSize}">메모</th>
										</c:when>
									</c:choose>
									<td>
										<input type="text" name="caList[${status.index}].cont" id="cont_${status.index }" class="text w80p" maxlength="100" value="${result.cont}"/>
										<c:choose>
											<c:when test="${status.count eq 1}">
												<a href="javascript:void(0)"  class="btn btn_sml02 btn_add r"  onclick="addContHtml()" >추가</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:void(0)" id="btn_del_0" class="btn btn_sml02 btn_del r" onclick="contTrDelete('${status.index}');">삭제</a>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div class="paging_wrap">
			<div class="btn_right">
				<c:choose>
					<c:when test="${caVO ne null }">
						<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="fncSubmit('update')">수정</a>
						<a href="javascript:void(0)" class="btn btn_mdl btn_del" onclick="fncSubmit('delete')">삭제</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="fncSubmit('insert')">등록</a>	
					</c:otherwise>
				</c:choose>
				<a href="javascript:void(0);" class="btn btn_mdl btn_list" id="btn_list"><strong>목록</strong></a>
			</div>
		</div>
	</div>
</form:form>

<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript">
var resultListIndex = '${resultListSize}' ? '${resultListSize}' : 0;
resultListIndex= +resultListIndex + 1;

fncDate('dataDate');

<%--달력 input 값을 바꾸면 목록을 눌렀을시 유저가 선택한 month list 를 볼수있게 해주는 코드--%>
var userSelectedDt=$("#dataDate").val().split('.');
$("#selectedYear").val(userSelectedDt[0]);
$("#selectedMonth").val(userSelectedDt[1]);
$("#schYearMonth").val(userSelectedDt[0]+userSelectedDt[1]);

<%--달력 input이 바꼈을시 데이터를 다시 가져오는 코드--%>
var $input = $("#dataDate"); 
$("#dataDate").on('input', function() {
	
    fncPageBoard("list",'form.do');
});
<%--on('input') 이벤트를 발생시키게 해주는 추가 코드--%>
(function ($) {
    var originalVal = $.fn.val;
    $.fn.val = function (value) {
        var res = originalVal.apply(this, arguments);
 
        if (this.is('input:text') && arguments.length >= 1) {
            this.trigger("input");
        }
 
        return res;
    };
}(jQuery));

var holCont='${caVO.holCont}'
var holidayContHtml='';
holidayContHtml+='<th>휴일</th>';
holidayContHtml+='<td><input name="holCont" id="holCont" class="text w80p" maxlength="100" value="'+holCont+'"/></td>';
if($("#holYn").is(":checked")){
	$("#trHolidayCont").html(holidayContHtml);
}
$("#holYn").on('change', function () {
    var self = $(this);
    if (self.is(":checked")) {
    	$("#trHolidayCont").html(holidayContHtml);
    } else {
        $("#trHolidayCont").html('');
    }
});

var fncSubmit=function(procType){
	if(procType == 'update' || procType == 'insert'){
		if(!$.trim($("#cont_0").val())){
			alert("첫번째 메모는 반드시 입력해주세요");
			$("#cont_0").focus();
			return false;
		}	
		if($("#holYn").is(":checked") && !$("#holCont").val().trim()){
			alert("휴일 내용을 입력해주세요");
			$("#holCont").focus();
			return false;
		}
	}else if(procType == 'delete'){
		if(!confirm("일정을 삭제하시겠습니까?")){
			return false;
		}
	}
	
	fncPageBoard('submit',procType+'proc.do');
	return false;
}

var addContHtml=function(){
	var trContBox=$("[ID^=trCont_]");
	if(trContBox && trContBox.size() && trContBox.size()>4){
		alert("메모 입력박스는 최대 5개까지 됩니다");
		return false;
	}
	var dyHtml="";
	dyHtml+='<tr id="trCont_'+resultListIndex+'">';
	//dyHtml+="<th></th>";
	dyHtml+="<td>";
	dyHtml+='<input type="text" name="caList['+resultListIndex+'].cont" id="cont_'+resultListIndex+'" class="text w80p" maxlength="100" />';
	dyHtml+=' <a href="javascript:void(0)"  class="btn btn_sml02 btn_del r"  onclick="contTrDelete('+resultListIndex+')" >삭제</a>';
	dyHtml+="</td>";
	dyHtml+="</tr>";
	
	$("#calTbody").append(dyHtml);
	resultListIndex++;
	$("#thCont").attr('rowspan',$("[ID^=trCont_]").size());
	return false;
}

var contTrDelete=function(index){
	$("#trCont_"+index).remove();
	$("#thCont").attr('rowspan',$("[ID^=trCont_]").size());
	return false;
}
</script>