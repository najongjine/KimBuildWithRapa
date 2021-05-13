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
	<input type="hidden" id="schEtc01" name="schEtc01"/>
	
	<%-- 통계 테이들의 데이터를 클릭 했을시, 년도를 담을때 쓰는 inputbox. addList 테이블 부분만 바뀐다. 
	 차트+통계의 검색박스 통계 테이블 데이터 클릭 부분과 리스트 부분을 따로가기 위한 필드--%>
	<input type="hidden" id="schEtc05" name="schEtc05"/>
	
	<%-- 통계 테이들의 데이터를 클릭 했을시, 수도권	경상권	충청권	전라권 등을 담을때 쓰는 inputbox. addList 테이블 부분만 바뀐다. 
	 차트+통계의 검색박스 통계 테이블 데이터 클릭 부분과 리스트 부분을 따로가기 위한 필드--%>
	<input type=""hidden"" id="schEtc06" name="schEtc06"/>
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
					<select id="schEtc02" name="schEtc02" class="selec w10p sel_year" title="구분 선택">
					</select>
					<strong class="tit hideBtn3">권역</strong>		
					<select id="schEtc03" name="schEtc03" class="selec w10p" title="구분 선택">  
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
					<select id="schEtc04" name="schEtc04" class="selec w10p" title="구분 선택">  
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
$(document).ready(function(){
	fncSelTab('${empty searchVO.schEtc01 ? "Y" : searchVO.schEtc01 }');
});
$("#searchKeyword").keydown(function(e){
	 if (e.keyCode == 13) { 
		<%--차트와 통계 테이블을 페이지를 가져오는 코드--%>
		fncTotalData();
		<%--V_COMPLAIN 테이블의 데이터를 리스트 테이블 페이지로 가져오는 코드--%>
		fncPageBoard('addList','addList.do','1');
	 }
});
$("#btn_ciapSearch").click(function(){
	fncTotalData();
	fncPageBoard('addList','addList.do','1');
});
$("#schEtc02").change(function(){
	fncTotalData();
	fncPageBoard('addList','addList.do','1');
});
$("#schEtc03").change(function(){
	fncTotalData();
	fncPageBoard('addList','addList.do','1');
});
$("#schEtc04").change(function(){
	fncTotalData();
	fncPageBoard('addList','addList.do','1');
});

<%--데이터 없음을 나타내는 td 의 colspan을 알아서 조정해주는 코드--%>
function fncColLength(){
	$("colgroup").each(function(index){
		$(this).nextAll('tbody:first').find(".no_data").attr("colspan", $(this).children("col").length);
	});
}

<%--년도별,월별 탭을 클릭했을시 데이터를 가져오는 코드--%>
function fncSelTab(divn){
	<%-- V_COMPLAIN 에 존재하는 년도만 컨트롤로에서 받아 selectbox에 추가 시켜주는 코드--%>
	if(divn == "Y"){
		var selHtml = '<option value="" class="sel_year_option">전체</option>';
		<c:forEach var="list" items="${yearList }" varStatus="status">
			selHtml += '<option value="${list.year }">${list.year }</option>';
		</c:forEach>
		$(".sel_year").html(selHtml);
	}
	if(divn == "M"){
		$(".sel_year_option").remove();
	}
	
	<%-- 년도통계, 해당년도의 월별 통계 자료를 검색할때 쓰이는 필드 (년도별, 월별 탭 선택시에 쓰이는 필드) . 'Y' | 'M' --%>
	$("#schEtc01").val(divn);
	$("#schEtc05").val("");
	$("#schEtc06").val("");
	fncTotalData();
	fncPageBoard('addList','addList.do','1');
}

<%--차트와 통계 테이블을 페이지를 가져오는 코드--%>
function fncTotalData(){
	//fncLodingStart();
	$.ajax({
		method : "POST",
		url : "totalData.do",
		data : $("#defaultFrm").serialize(),
		dataType : "HTML",
		success : function(data){
			$(".tbl_total").html(data);
		},error : function(req, text){
		},complete : function(){
			//fncLodingEnd();
		}
	});
}
</script>