<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<%
    pageContext.setAttribute("crcn", "\r\n"); 
    pageContext.setAttribute("br", "<br>");
%> 

<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="atchFileId" id="atchFileId"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<!-- tbl -->
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:15%;">
					<col >
					<col style="width:15%;">
					<col >
					<col style="width:15%;">
					<col >
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><strong>시설자명</strong></th>
						<td colspan="2">
							${kaWireVO.fctNm }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td colspan="2">${kaWireVO.rgstDt }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>사업관리자ID</strong></th>
						<td colspan="">
							<c:out value="${kaWireVO.bsnMngId }"/>
						</td>
						<th scope="row"><strong>담당자연락처</strong></th>
						<td colspan="">
							<c:out value="${kaWireVO.mngerHp }"/>
						</td>
	                    <th scope="row"><strong>무선국 출입 방법</strong></th>
						<td colspan=""><c:out value="${kaWireVO.wiEntMthd }"/></td>
					</tr> 
					<tr>
						<th scope="row"><strong>서비스구분</strong></th>
						<td>
							<c:out value="${kaWireVO.srvcCls }"/>
						</td>
	                    <th scope="row"><strong>무선국명</strong></th>
						<td><c:out value="${kaWireVO.rsNm }"/></td>
						<th scope="row"><strong>허가번호</strong></th>
						<td><c:out value="${kaWireVO.permsSeq }"/></td>
					</tr> 
					<tr>
						<th scope="row"><strong>검사증명서발급일</strong></th>
						<td>
							<c:out value="${kaWireVO.inspDt }"/>
						</td>
	                    <th scope="row"><strong>무선국 주소</strong></th>
						<td><c:out value="${kaWireVO.inspDt }"/></td>
						<th scope="row"><strong>관리담당자</strong></th>
						<td><c:out value="${kaWireVO.mnger }"/></td>
					</tr> 
					
					<tr>
						<th scope="row"><strong>시작 주파수대역</strong></th>
						<td colspan="">
							<c:out value="${kaWireVO.txFreqFrom }"/>
						</td>
	                    <th scope="row"><strong>도착 주파수대역</strong></th>
						<td colspan=""><c:out value="${kaWireVO.txFreqTo }"/></td>
						<th scope="row"><strong>안테나전력의합</strong></th>
						<td colspan=""><c:out value="${kaWireVO.anthPwrSum }"/></td>
					</tr>
					<tr>
						<th scope="row"><strong>안테나 형식</strong></th>
						<td colspan="">
							<c:out value="${kaWireVO.anthKind }"/>
						</td>
	                    <th scope="row"><strong>안테나이득</strong></th>
						<td colspan=""><c:out value="${kaWireVO.anthBnft }"/></td>
						<th scope="row"><strong>안테나높이</strong></th>
						<td colspan=""><c:out value="${kaWireVO.anthHght }"/></td>
					</tr>
					<tr>
						<th scope="row"><strong>지상고</strong></th>
						<td colspan="">
							<c:out value="${kaWireVO.grndHght }"/>
						</td>
	                    <th scope="row"><strong>안테나 빔 계수</strong></th>
						<td colspan=""><c:out value="${kaWireVO.anthBmCnt }"/></td>
						<th scope="row"><strong>안테나 빔 형태</strong></th>
						<td colspan=""><c:out value="${kaWireVO.anthBmKind }"/></td>
					</tr>
					<tr>
						<th scope="row"><strong>등가등방성 방사전력</strong></th>
						<td colspan="">
							<c:out value="${kaWireVO.istrRadPwr }"/>
						</td>
	                    <th scope="row"><strong>중심주파수</strong></th>
						<td colspan=""><c:out value="${kaWireVO.cntrFreq }"/></td>
						<th scope="row"><strong>대역폭</strong></th>
						<td colspan=""><c:out value="${kaWireVO.bndwth }"/></td>
					</tr>
					<tr>
						<th scope="row"><strong>기준신호 주파수</strong></th>
						<td colspan="">
							<c:out value="${kaWireVO.refSigFreq }"/>
						</td>
	                    <th scope="row"><strong>안테나 틸트각도</strong></th>
						<td colspan=""><c:out value="${kaWireVO.anthTiltAng }"/></td>
						<th scope="row"><strong>최대 수직 빔 각도</strong></th>
						<td colspan=""><c:out value="${kaWireVO.maxVertBeamAng }"/></td>
					</tr>
					<tr>
						<th scope="row"><strong>최대 수평 빔 각도</strong></th>
						<td colspan="">
							<c:out value="${kaWireVO.maxHorizBeamAng }"/>
						</td>
	                    <th scope="row"><strong>동기신호 그룹주기</strong></th>
						<td colspan=""><c:out value="${kaWireVO.syncSigGrpfrq }"/></td>
						<th scope="row"><strong>슬롯포맷 개수</strong></th>
						<td colspan=""><c:out value="${kaWireVO.slotFmtCnt }"/></td>
					</tr>
					<tr>
						<th scope="row"><strong>주파수자원 블럭계수</strong></th>
						<td colspan="">
							<c:out value="${kaWireVO.freqrcBlockCnt }"/>
						</td>
	                    <th scope="row"><strong>보조반송파 개수</strong></th>
						<td colspan=""><c:out value="${kaWireVO.subWvCnt }"/></td>
						<th scope="row"><strong>상향및 가드심볼 개수</strong></th>
						<td colspan=""><c:out value="${kaWireVO.abvGrdsmbCnt }"/></td>
					</tr>
					<tr>
						<th scope="row"><strong>한슬롯 심볼개수</strong></th>
						<td colspan="">
							<c:out value="${kaWireVO.oneslotSmbCnt }"/>
						</td>
	                    <th scope="row"><strong>슬롯포맷</strong></th>
						<td colspan=""><c:out value="${kaWireVO.slotFmtInfo }"/></td>
						<th scope="row"><strong>제조사</strong></th>
						<td colspan=""><c:out value="${kaWireVO.mnfctr }"/></td>
					</tr>
					<tr>
						<th scope="row"><strong>이미지</strong></th>
						<td colspan="5">
						<c:forEach var="result" items="${kaWireVO.imgList}" varStatus="status">
								<span style="vertical-align:middle;margin:0px 50px">
								<img src="/atch/getImage.do?atchFileId=${result.atchFileId}&fileSn=${result.fileSn}" alt=""
				  											onerror="this.src='/publish/ma/images/no_img.png'" width="200" height="180" >
								</span>
						</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<a href="#" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="#" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="#" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	</form:form>
</div>

<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/publish/ft/js/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="/publish/ft/js/jquery.pikachoose.js"></script>
<script language="javascript">
	$(document).ready(
		function (){
			$("#pikame").PikaChoose({carousel:true,autoPlay:false,carouselOptions:{wrap:'circular'}});
		});
</script>
