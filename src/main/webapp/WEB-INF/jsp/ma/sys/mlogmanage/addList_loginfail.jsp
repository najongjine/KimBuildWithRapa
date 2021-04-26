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
			<col style="width:5%"> 
			<col style="width:5%">
			<col style="width:10%">
			<col style="width:10%">
			<col>
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><input type="checkbox" id="resultListAllCheckbox" onclick="onclickResultListAllCheckbox()"></th>
				<th scope="col">번호</th>
				<th scope="col" class="">ID</th>
				<th scope="col" class="">최근 로그인 시도</th>
				<th scope="col">최근 IP</th>
				<th scope="col">실패횟수</th>
				<th scope="col">기능</th>
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
							</td>
							<td>
								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}
							</td>
							<td><c:out value="${result.id }"/></td>
							<td><c:out value="${result.rgstDt }"/></td>
							<td><c:out value="${result.ip }"/></td>
							<td><c:out value="${result.loginFailCount }"/></td>
							<td>
								<c:if test="${result.banned eq 'Y' }">
									<a href="#" class="btn btn_mdl btn_save" onclick="allowIp('${result.ip}'); return false;">차단해재</a>
								</c:if>
							</td>
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

<script type="text/javascript" src="/publish/ma/sys/mlogmanage/resultListCheckbox.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	
});
var allowIp=function(ip){
	alert(ip)
	$.ajax({
		url:'allowIp.json?ip='+ip
		,success:function(data){
			fncPageBoard('addList','addList.do',pageIndexForCommonJs);
		}
		,error:function(error){
			alert("통신오류")
		}
	})
	return false;
}
</script>