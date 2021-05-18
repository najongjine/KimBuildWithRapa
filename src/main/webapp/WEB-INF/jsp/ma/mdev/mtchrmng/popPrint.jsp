<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>전파방송통신교육원</title>
<!-- <link rel="stylesheet" type="text/css" href="/publish/mgr/css/reset.css"> -->
<link rel="stylesheet" type="text/css" href="/publish/frt/css/print2.css">
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/frt/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
</head>
<body>
<div class="print_wrap">
	<div id="content_box">
		<div class="tbl">
			<div class="tbl_wrap">
				<table class="tbl_row_type01">
					<caption></caption>
					<colgroup>
						<col style="width: 6%;">
						<col style="width: 7%;">
						<col style="width: 16%;">
						<col style="width: 7%;">
						<col style="width: 9%;">
						<col style="width: 7%;">
						<col style="width: 9%;">
						<col style="width: 10%;">
						<col style="width: 11%;">
						<col style="width: 7%;">
						<col style="width: 9%;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" colspan="10" class="title">전파방송통신교육원 강사 이력카드</th>
							<th scope="row">등급</th>
							<td scope="row"></td>
						</tr>
						<tr>
							<th scope="col" class="bold">성명</th>
							<th scope="col">한글</th>
							<td>${mgr0012VO.name }</td>
							<th scope="col" >한자</th>
							<td colspan="2">${mgr0012VO.tchrNm }</td>
							<th scope="col" >성별</th>
							<td colspan="2">${mgr0012VO.tchrGender eq 'M' ? '남자' : mgr0012VO.tchrGender eq 'F' ? '여자' : '-' }</td>
							<th scope="col" colspan="2">작성일</th>
							<td>${empty mgr0012VO.rgstDt ? mgr0012VO.rvseDt : mgr0012VO.rgstDt }</td>
						</tr>
						<tr>
							<th scope="col" rowspan="3" class="bold">강의분야</th>
							<th scope="col" colspan="2">대분류</th>
							<td colspan="4">${mgr0012VO.tchrFldLarge }</td>
							<th scope="col">중분류</th>
							<td colspan="3">${mgr0012VO.tchrFldMiddle }</td>
							<td rowspan="6">
								<img src="/atch/getImage.do?atchFileId=${mgr0012VO.atchFileId}&fileSn=0" style="margin:0 auto;width:100px; height:125px;"/>
							</td>
						</tr>
						<tr>
							<th scope="col" colspan="2" class="no_bg">소분류</th>
							<td colspan="4">${mgr0012VO.tchrFldSmall }</td>
							<th scope="col">세분류</th>
							<td colspan="3">${mgr0012VO.tchrFldDetail }</td>
						</tr>
						<tr>
							<th scope="col" colspan="2">기타</th>
							<td colspan="8">${mgr0012VO.tchrFldEtc }</td>
						</tr>
						<tr>
							<th scope="col" rowspan="2" class="bold">자택</th>
							<th scope="col">우편</th>
							<td colspan="6">${mgr0012VO.post }</td>
							<th scope="col" >전화</th>
							<td colspan="2"><span class="tel">${mgr0012VO.tel }</span></td>
							
						</tr>
						<tr>
							<th scope="col" >주소</th>
							<td colspan="6">${mgr0012VO.addr1 } ${mgr0012VO.addr2 }</td>							
							<th scope="col" >H.P</th>
							<td colspan="2"><span class="tel">${mgr0012VO.cell }</span></td>
						</tr>
						<tr>
							<th scope="col" rowspan="3" class="bold">직장</th>
							<th scope="col">우편</th>
							<td></td>
							<th scope="col" >주소</th>
							<td colspan="7"></td>
						</tr>
						<tr>
							<th scope="col">회사</th>
							<td colspan="3">${mgr0012VO.busiName }</td>
							<th scope="col" >부서</th>
							<td colspan="2">${mgr0012VO.takeStation }</td>
							<th scope="col" >직위</th>
							<td colspan="3">${mgr0012VO.takePosition }</td>
						</tr>
						<tr>
							<th scope="col" >전화</th>
							<td colspan="3">${mgr0012VO.telo }</td>
							<th scope="col" >팩스</th>
							<td colspan="2">${mgr0012VO.fax }</td>
							<th scope="col">Email</th>
							<td colspan="3">${mgr0012VO.email }</td>
						</tr>
						<tr>
							<th scope="col" class="bold" rowspan="${fn:length(eduList) > 0 ? fn:length(eduList)+1 : 2 }">학력사항</th>
							<th scope="col" colspan="3">기간</th>
							<th scope="col" colspan="3">학교명</th>
							<th scope="col" colspan="2">전공학과</th>
							<th scope="col">학위</th>
							<th scope="col" colspan="2">비고</th>
						</tr>
						<c:choose>
							<c:when test="${fn:length(eduList) > 0 }">
								<c:forEach var="list" items="${eduList }">
									<tr>
										<td colspan="3">${list.eduPeri }</td>
										<td colspan="3">${list.school }</td>
										<td colspan="2">${list.major }</td>
										<td>${list.degree }</td>
										<td colspan="2">${list.eduRmrk }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3" class="c">년 월 ~ 년 월</td>
									<td colspan="3"></td>
									<td colspan="2"></td>
									<td></td>
									<td colspan="2"></td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr>
							<th scope="col" class="bold" rowspan="${fn:length(crrList) > 0 ? fn:length(crrList)+1 : 2 }">경력사항</th>
							<th scope="col" colspan="3">기간</th>
							<th scope="col" colspan="2">근무처</th>
							<th scope="col">부서</th>
							<th scope="col">직위</th>
							<th scope="col" colspan="4">주요업무내용</th>
						</tr>
						<c:choose>
							<c:when test="${fn:length(crrList) > 0 }">
								<c:forEach var="list" items="${crrList }">
									<tr>
										<td colspan="3">${list.crrPeri }</td>
										<td colspan="2">${list.work }</td>
										<td>${list.dprt }</td>
										<td>${list.pstn }</td>
										<td colspan="4">${list.jobCont }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3" class="c">년 월 ~ 년 월</td>
									<td colspan="2"></td>
									<td></td>
									<td></td>
									<td colspan="4"></td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr>
							<th scope="col" class="bold" rowspan="${fn:length(lctrList) > 0 ? fn:length(lctrList)+1 : 2 }">강의경력</th>
							<th scope="col" colspan="3">기간(개월)</th>
							<th scope="col" colspan="2">학교(기관)명</th>
							<th scope="col">대상</th>
							<th scope="col" colspan="2">강의과목</th>
							<th scope="col">교육시간</th>
							<th scope="col">교재</th>
							<th scope="col">비고</th>
						</tr>
						<c:choose>
							<c:when test="${fn:length(lctrList) > 0 }">
								<c:forEach var="list" items="${lctrList }">
									<tr>
										<td colspan="3">${list.lctrPeri }</td>
										<td colspan="2">${list.orgNm }</td>
										<td>${list.tgt }</td>
										<td colspan="2">${list.subject }</td>
										<td>${list.lctrTime }</td>
										<td>${list.lctrBook }</td>
										<td>${list.lctrRmrk }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3" class="c">년 월 ~ 년 월</td>
									<td colspan="2"></td>
									<td></td>
									<td colspan="2"></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr>
							<th scope="col" class="bold" rowspan="${fn:length(bookList) > 0 ? fn:length(bookList)+1 : 2 }">저서</th>
							<th scope="col" colspan="4">저서명</th>
							<th scope="col" colspan="4">출판사</th>
							<th scope="col">출판년도</th>
							<th scope="col" colspan="2">공저 및 편저사항</th>
						</tr>
						<c:choose>
							<c:when test="${fn:length(bookList) > 0 }">
								<c:forEach var="list" items="${bookList }">
									<tr>
										<td colspan="4">${list.book }</td>
										<td colspan="4">${list.pbls }</td>
										<td>${list.pblsYear }</td>
										<td colspan="2">${list.bookRmrk }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">　</td>
									<td colspan="4"></td>
									<td></td>
									<td colspan="2"></td>
								</tr>
							</c:otherwise>
						</c:choose>
						<%-- <tr>
							<th scope="col" rowspan="${fn:length(asctList) > 0 ? fn:length(asctList)+1 : 2 }">가입<br/>학회<br/>협회</th>
							<th scope="col" colspan="5">학회 및 협회</th>
							<th scope="col" colspan="6">담당역할</th>
						</tr>
						<c:choose>
							<c:when test="${fn:length(bookList) > 0 }">
								<c:forEach var="list" items="${bookList }">
									<tr>
										<td colspan="5">${list.association }</td>
										<td colspan="6">${list.role }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5">　</td>
									<td colspan="6"></td>
								</tr>
							</c:otherwise>
						</c:choose> --%>
						<tr>
							<td colspan="12" style="padding:20px 20px 0;">
								<div class="tit_big">개인정보 수집·이용에 대한 동의서</div>
								<table class="in_tbl_type01"> 
									<caption></caption>
									<colgroup>
										<col style="width:25%;">
										<col style="width:25%;">
										<col style="width:25%;">
										<col style="width:25%;">
									</colgroup> 
									<tbody>						
										<tr>
											<th scope="row" colspan="4" class="tit">[개인정보 수집·이용에 대한 동의]</th>
										</tr>
										<tr>
											<th scope="row">수집하는 개인정보 항목</th>
											<td colspan="3">성명, 연락처, 소속, 직위, 계좌번호, 주소</td>
										</tr>
										<tr>
											<th scope="row">개인정보의 수집 및 이용목적</th>
											<td colspan="3">제공하신 정보는 한국전파진흥협회의 수당지급(기타소득신고)을 위해서만 사용됩니다.</td>
										</tr>
										<tr>
											<th scope="row">개인정보의 보유 및 이용기간</th>
											<td colspan="3">수집된 개인정보의 보유기간은 5년입니다.</td>
										</tr>
										<tr><td colspan="4">※ 귀하는 이에 대한 동의를 거부할 수 있습니다. 다만, 동의가 없을 경우 이와 관련된 업무 진행이 불가능 할 수 있음을 알려드립니다</td></tr>
										<tr>
					                        <td colspan="2" class="aggre">					                        	 
					                            <label>개인정보 수집 및 이용에 동의함 <input type="checkbox" id="prvcPlcyYn_y" name="prvcPlcyYn" value="Y" onclick="return false;" ${mgr0012VO.prvcPlcyYn eq 'Y' ? 'checked' : '' }/></label>
					                        </td>
					                        <td colspan="2" class="aggre">	　
					                            <label>개인정보 수집 및 이용에 동의하지 않음 <input type="checkbox" id="prvcPlcyYn_n" name="prvcPlcyYn" value="N" onclick="return false;" ${mgr0012VO.prvcPlcyYn eq 'N' ? 'checked' : '' }/></label>					                            
					                        </td>
										</tr>								
										<tr>
											<th scope="row" colspan="4" class="tit"><br>[고유식별정보 처리에 대한 동의]</th>
										</tr>
										<tr>
											<th scope="row" colspan="4"><strong class="th_tit">고유식별정보 처리에 대한 동의</strong></th>
										</tr>
										<tr>
											<th scope="row">수집하는 개인정보 항목</th>
											<td colspan="3">-</td>
										</tr>
										<tr>
											<th scope="row">개인정보의 수집 및 이용목적</th>
											<td colspan="3">제공하신 정보는 한국전파진흥협회의 수당지급(기타소득신고)을 위해서만 사용됩니다.</td>
										</tr>
										<tr>
											<th scope="row">개인정보의 보유 및 이용기간</th>
											<td colspan="3">수집된 고유식별정보의 보유기간은 5년입니다.</td>
										</tr>
										<tr><td colspan="4">※ 귀하는 이에 대한 동의를 거부할 수 있습니다. 다만, 동의가 없을 경우 이와 관련된 업무 진행이 불가능 할 수 있음을 알려드립니다</td></tr>
										<tr>
					                        <td colspan="2" class="aggre">					                        	 
					                            <label>고유식별정보 수집 및 이용에 동의함 <input type="checkbox" id="unqIdYn_y" name="unqIdYn" value="Y" onclick="return false;" ${mgr0012VO.unqIdYn eq 'Y' ? 'checked' : '' }/></label>
					                        </td>
					                        <td colspan="2" class="aggre">	　
					                            <label>고유식별정보 수집 및 이용에 동의하지 않음 <input type="checkbox" id="unqIdYn_n" name="unqIdYn" value="N" onclick="return false;" ${mgr0012VO.unqIdYn eq 'N' ? 'checked' : '' }/></label>					                            
					                        </td>
										</tr>	
										<tr>
											<th scope="row" colspan="4" class="tit"><br>[개인정보의 제 3자 제공에 대한 동의]</th>
										</tr>		
										<tr>
											<th scope="row">제공 목적</th>
											<td colspan="3">정부부처 및 내/외부 감사 등에 비정기적 제공</td>
										</tr>
										<tr>
											<th scope="row">제공 항목</th>
											<td colspan="3">성명, 연락처, 계좌번호, 주소</td>
										</tr>
										<tr>
											<th scope="row">제공받는 자</th>
											<td colspan="3">국세청, 기획재정부, 한국방송통신전파진흥원, 한국전파진흥협회 등</td>
										</tr>
										<tr><td colspan="4">※ 귀하는 이에 대한 동의를 거부할 수 있습니다. 다만, 동의가 없을 경우 이와 관련된 업무 진행이 불가능 할 수 있음을 알려드립니다</td></tr>
										<tr>
					                        <td colspan="2" class="aggre">					                        	 
					                            <label>개인정보의 제3자 제공에 동의함 <input type="checkbox" id="prvdPrsnYn_y" name="prvdPrsnYn" value="Y" onclick="return false;" ${mgr0012VO.prvdPrsnYn eq 'Y' ? 'checked' : '' }/></label>
					                            <br><br>
					                        </td>
					                        <td colspan="2" class="aggre">	　
					                            <label>개인정보의 제3자 제공에 동의하지 않음 <input type="checkbox" id="prvdPrsnYn_n" name="prvdPrsnYn" value="N" onclick="return false;" ${mgr0012VO.prvdPrsnYn eq 'N' ? 'checked' : '' }/></label>
					                            <br><br>					                            
					                        </td>
										</tr>
										<tr>
											<td scope="row" colspan="4">												
												<strong>※ 개인정보 제공자가 동의한 내용 외의 다른 목적으로 활용하지 않으며, 제공된 개인정보의 이용을 거부하고자 할 때에는 개인정보 관리책임자를 통해 열람, 정정, 삭제를 요구할 수 있음</strong>
											</td>
										</tr>
										<tr>
											<td colspan="4" class="to">한국전파진흥협회 전파방송통신교육원장 귀중</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>						
					</tbody>
				</table>				
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(".num").each(function(){
		numFormat($(this), 'num');
	});
	$(".tel").each(function(){
		numFormat($(this), 'tel');
	});
	$(".jumin").each(function(){
		numFormat($(this), 'jumin');
	});
	window.print();
});
function numFormat(object, divn){
	var numVal = object.text().trim();
	if(divn == "tel"){
		numVal = numVal.replace(/^(02[0-9]{0}|0[0-9]{2}|01[0|1|6|7|8|9]{1})([0-9]{3,4})([0-9]{4})$/,"$1-$2-$3");
	}
	if(divn == "busi"){
		numVal = numVal.replace(/^([0-9]{3})([0-9]{2})([0-9]{5})$/,"$1-$2-$3");
	}
	if(divn == "num"){
		numVal = numVal.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	if(divn == "jumin"){
		numVal = numVal.replace(/^([0-9]{6})([0-9]{7})$/,"$1-$2");
	}
	object.text(numVal);
}
</script>
</html>