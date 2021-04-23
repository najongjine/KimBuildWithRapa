<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/sys/mlogmanage/resultListCheckbox.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	
});
</script>
<div class="tbl_top">
	<div class="tbl_left">
		<%-- 아이템 리스트용 체크박스 전체선택 --%>
		<a href="#" class="btn btn-mdl btn_save" onclick="selectAllCheckbox()">전체선택</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span>
	</div>
	<div class="tbl_right">
		<select id="pageUnitSelect">
		  <option value="10" <c:if test="${searchVO.pageUnit eq 10}">selected='selected'</c:if> >10</option>
		  <option value="20" <c:if test="${searchVO.pageUnit eq 20}">selected='selected'</c:if> >20</option>
		  <option value="30" <c:if test="${searchVO.pageUnit eq 30}">selected='selected'</c:if> >30</option>
		  <option value="40" <c:if test="${searchVO.pageUnit eq 40}">selected='selected'</c:if> >40</option>
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
			<col >
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col" class="">구분</th>
				<th scope="col" class="">ID</th>
				<th scope="col" class="">URL</th>
				<th scope="col" class="">IP</th>
				<th scope="col">접속시간</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr >
							<td>
								<%-- 아이템 리스트용 체크박스 --%>
								<input type="checkbox" name="resultListCheckbox" id="addListCheckbox_${result.seq}">
								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}
							</td>
							<td class="" >
								<c:choose>
									<c:when test="${result.userkind eq 'admin'}">관리자</c:when>
									<c:otherwise>사용자</c:otherwise>
								</c:choose>
							</td>
							<td><c:out value="${result.id }"/></td>
							<td><c:out value="${result.url }"/></td>
							<td><c:out value="${result.ip }"/></td>
							<td><c:out value="${result.rgstDt }"/></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="6" class="no_data">데이터가 없습니다.</td></tr>
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
	<div class="btn_right">
	</div>
</div>
<%-- //paging end--%>