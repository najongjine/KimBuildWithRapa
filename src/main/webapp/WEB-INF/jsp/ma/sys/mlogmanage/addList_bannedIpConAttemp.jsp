<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:10%">
			<col style="width:10%">
			<col >
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col" class="">접속시간</th>
				<th scope="col" class="">IP</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr >
							<td>
								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}
							</td>
							<td><c:out value="${result.rgstDt }"/></td>
							<td><c:out value="${result.ip }"/></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="3" class="no_data">데이터가 없습니다.</td></tr>
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