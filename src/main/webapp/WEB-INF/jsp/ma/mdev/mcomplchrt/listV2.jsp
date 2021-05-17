<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<%-- content --%>
<div class="content_box">
<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
	<input type="hidden" id="pageIndex" name="pageIndex" value="<c:out value="${searchVO.pageIndex }"/>"/>
	
	<%-- pagination에서 한페이지에 몇개의 아이템을 보여줄 것인가 --%>
	<input type="hidden" id="pageUnit" name="pageUnit" value="<c:out value="${searchVO.pageUnit lt 10 ? 10 : searchVO.pageUnit }"/>"/>
	
	<%-- 년도통계, 해당년도의 월별 통계 자료를 검색할때 쓰이는 필드 (년도별, 월별 탭 선택시에 쓰이는 필드) . 'Y' | 'M' --%>
	<input type="hidden" id="schEtc01" name="schEtc01" value="${schEtc01 }"/>
	
	<%-- 통계 테이들의 데이터를 클릭 했을시, 년도를 담을때 쓰는 inputbox. addList 테이블 부분만 바뀐다. 
	 차트+통계의 검색박스 통계 테이블 데이터 클릭 부분과 리스트 부분을 따로가기 위한 필드--%>
	<input type="hidden" id="schEtc05" name="schEtc05" value="${schEtc05 }"/>
	
	<%-- 통계 테이들의 데이터를 클릭 했을시, 수도권	경상권	충청권	전라권 등을 담을때 쓰는 inputbox. addList 테이블 부분만 바뀐다. 
	 차트+통계의 검색박스 통계 테이블 데이터 클릭 부분과 리스트 부분을 따로가기 위한 필드--%>
	<input type="hidden" id="schEtc06" name="schEtc06" value="${schEtc06 }"/>
	<ul class="tab js-tab tab_menu">
	    <li class="btn_tap current"><a href="javascript:void(0)" onclick="fncSelTab('Y')">년도별</a></li>
	    <li class="btn_tap"><a href="javascript:void(0)" onclick="fncSelTab('M')">월별</a></li>
	</ul>
	<%-- search  --%>
	<div class="search_box">
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit hideBtn3">년도</strong>	
					<select id="schEtc02" name="schEtc02" class="selec w100 sel_year" title="구분 선택">
						<option value="" <c:if test="${empty schEtc02}">selected="selected"</c:if>>전체</option>
						<c:forEach var="result" items="${yearList }" varStatus="status">
							<option value="${result.year }" <c:if test="${schEtc02 eq result.year}">selected="selected"</c:if>>${result.year }</option>
						</c:forEach>
					</select>
					<strong class="tit hideBtn3">권역</strong>		
					<select id="schEtc03" name="schEtc03" class="selec w100" title="구분 선택">  
					 	<option value="">전체</option>
						<option value="수도권" >수도권</option>
						<option value="경상권" >경상권</option>
						<option value="전라권" >전라권</option>
						<option value="충청권" >충청권</option>
						<option value="강원권" >강원권</option>
						<option value="제주권" >제주권</option>										
						<!-- <option value="기타" >기타</option> -->
					</select>				
					<strong class="tit hideBtn3">통신사</strong>	
					<select id="schEtc04" name="schEtc04" class="selec w100" title="구분 선택">  
						<option value="">전체</option>
						<option value="SKT">SKT</option>
						<option value="KT">KT</option>
						<option value="LGU+">LGU+</option>
						<option value="기타">기타</option>
					</select>
					<strong class="tit">검색구분</strong>
					<select id="searchCondition" name="searchCondition" class="selec w100" title="구분 선택">
						<option value="0">주소</option>
					</select>
					<input type="text" id="searchKeyword" name="searchKeyword" class="text w40p">
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_ciapSearch">검색</button>
					</span>
				</div>
			</fieldset>
	</div>
	<%--// search  --%>
	<div class="tbl_total">
	</div>
	<br/>
	<div class="tbl">
	</div>
</form>
</div>
<script type="text/javascript">
<%--통계 테이블 페이지를 가져오는 코드--%>
var loadTotalData=function(){
	if(!$("#schEtc01").val().trim()){
		$("#schEtc01").val('Y');
	}
	$.ajax({
		method : "POST",
		url : "totalData.do",
		data : $("#defaultFrm").serialize(),
		dataType : "HTML",
		success : function(data){
			$(".tbl_total").html(data);
		},error : function(error){
			alert("통신에러")
		}
	});
	return false;
}
var fncSelTab=function(dtKind){
	if(!dtKind){
		dtKind='Y';
	}
	$("#schEtc01").val(dtKind);
	if(dtKind == 'Y' && !$('#schEtc02 option[value=""]').length){
		var emptyOption = new Option("전체", "");
		$(emptyOption).html("전체");
		$("#schEtc02").prepend(emptyOption);
	}
	if(dtKind == 'Y'){
		$("#schEtc02").val('')
	}
	if(dtKind == 'M' && !$("#schEtc02").val().trim()){
		var tempYear=$("#schEtc02 option:eq(1)").val();
		$("#schEtc02").val(tempYear);
	}
	if(dtKind == 'M'){
		$("#schEtc02 option[value='']").remove();
	}
	<%--통계 클릭->년도를 바꿀때 통계클릭 데이터가 남아 있으면 검색이 이상해져서 그것을 잡아주는 코드--%>
	$("#schEtc05").val("");
	$("#schEtc06").val("");
	loadTotalData();
	return false;
}

<%--데이터 없음을 나타내는 td 의 colspan을 알아서 조정해주는 코드--%>
var fncColLength=function(){
	$("colgroup").each(function(index){
		$(this).nextAll('tbody:first').find(".no_data").attr("colspan", $(this).children("col").length);
	});
}

fncSelTab();
$("#schEtc02, #schEtc03, #schEtc04").on('change',function(){
	<%--통계 클릭->년도를 바꿀때 통계클릭 데이터가 남아 있으면 검색이 이상해져서 그것을 잡아주는 코드--%>
	$("#schEtc05").val("");
	$("#schEtc06").val("");
	loadTotalData();
	return false;
});
$("#searchKeyword").keydown(function(e){
	if (e.keyCode == 13) { 
		loadTotalData();
	}
	return false;
});
$("#btn_ciapSearch").on("click",function(){
	loadTotalData();
	return false;
})
</script>