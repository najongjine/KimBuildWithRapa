<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="tbl_top">
	<div class="tbl_left">
		<i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span>
	</div>
	<div class="tbl_right"></div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%">
			<col>
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col" class="subject">시설명</th>
				<th scope="col">무선국명</th>
				<th scope="col">관리담당자</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor">
							<td onclick="fncPageBoard('view','view.do','${result.seq}','seq')">
								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}
							</td>
							<td class="" onclick="fncPageBoard('view','view.do','${result.seq}','seq')"><c:out value="${util:cutText(result.fctNm,30,'...') }"/></td>
							<td onclick="fncPageBoard('view','view.do','${result.seq}','seq')">${result.rsNm }</td>
							<td onclick="fncPageBoard('view','view.do','${result.seq}','seq')">${result.mnger }</td>
							<td onclick="fncPageBoard('view','view.do','${result.seq}','seq')">${result.rgstDt }</td>
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
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
	<div class="btn_left">
		<a href="#" class="btn btn_mdl btn_excel" onclick="fncExcelUp();">엑셀업로드</a>
		<input type="hidden" name="excelFileId" id="excelFileId" />
		<iframe name="excelFileIdFrame" id="excelFileIdFrame" src="/atch/fileUpload.do?atchFileId=&fileCnt=1&atchFileIdNm=excelFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
	</div>
	<div class="btn_right">
		<a href="#" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do');">등록</a>
	</div>
</div>
<%-- //paging end--%>

<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript">

var fncExcelUp=function(){
	if($("#excelFileId").val() != null && $("#excelFileId").val() != '' ){
		if(confirm("파일을 업로드 하시겠습니까?")){
		
			var inData = {};
		
			inData.atchFileId = $("#excelFileId").val();
			/*
			ex: {"atchFileId":"FILE0000000000004133"}
			*/
		
			$.ajax({
				url : "saveExcel.json",
				dataType : "json",
				data : inData,
				success : function(data){
					var totalCnt = data.total;
					var successCnt = data.cnt;
					alert("총 "+totalCnt+"건 중에서 "+successCnt+"건 입력 성공하였습니다.");
					fncPageBoard('addList','addList.do',1);
				},error : function(data){
					alert("오류가 발생하였습니다.\n잠시 후 다시 시도해 주시기 바랍니다.");
				}/* ,
				complete : function(data){
				closeLoading();
				} */
			});
		}
	}else{
		alert("업로드 할 파일을 첨부해 주세요.");
		return false;
	}
}
</script>