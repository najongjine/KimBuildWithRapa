<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Pragma" content="no-store"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>전파방송통신교육원 포털</title>
<link rel="stylesheet" type="text/css" href="/publish/ma/css/atic/style.css">
<link rel="stylesheet" type="text/css" href="/publish/ma/css/atic/jquery-ui-1.12.1.custom.css"/>
<script type="text/javascript" src="/publish/ma/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/publish/ma/js/jquery-ui-1.12.1.custom.js"></script>
<script type="text/javascript" src="/publish/ma/js/common.js"></script>
<script type="text/javascript" src="/resource/js/cm.validate.js" charset="utf-8"></script>
<script type="text/javascript" src="/publish/ma/js/highcharts.js"></script>
<script type="text/javascript" src="/publish/ma/js/exporting.js"></script>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
</head>
<body>
<div id="skipnavi">
   <a href="#container">▶본문 바로가기</a>
   <a href="#gnb_area">▶주메뉴 바로가기</a>
</div>
<div id="wrapper">
	<header id="header">
		<div class="header_box">
			<h1 class="logo">
				<a href="/ma/main.do">사이트 로고</a>
			</h1>
			<!-- GNB -->
			<div id="gnb_area">
				<nav id="gnb">
					<ul class="gnb clear">
						<c:forEach var="result" items="${mgrMenu }" varStatus="status" >
							<li ${util:getMenuCd(url).depth1 eq result.menuCd ? 'class="on"' : '' }>
								<a href="${result.url }" >${result.menuNm }</a>
							</li>
						</c:forEach>
					</ul>
				</nav>
			</div>
			<!-- //GNB -->
			<div class="util_box">
				<span class="user_info">
					<strong>${loginMgrNm}</strong> [ <strong>${loginMgrId }</strong> ] 님
					<a href="/logout.do" class="btn_logout"><strong>로그아웃</strong></a>
				</span>
				<a href="/ma/sys/mn/list.do" class="go_homepage">홈페이지</a>
			</div>
		</div>
	</header>
	<div id="main_container">
		<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
			<input type="hidden" id="eduBoardSeq" name="eduBoardSeq"/>
			<input type="hidden" id="eduBoardCd" name="eduBoardCd"/>
			<input type="hidden" id="eduBoardDivn" name="eduBoardDivn"/>
			<input type="hidden" id="eduCourseSeq" name="eduCourseSeq"/>
		</form>
		<!-- main -->	
		<section class="main">
			<!-- top_area -->
			<div class="top_area">
				<div class="admin_info">
					<table class="adm_tbl">
						<caption>관리자 정보 이름, 접속시간, 이전접속에 관련된 내용입니다.</caption>
						<colgroup>
							<col style="width:35%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th scope="col" colspan="2">관리자 정보</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<td>${loginMgrNm }</td>
							</tr>								
							<tr>
								<th scope="row">접속 시간</th>
								<td>${loginMgrNowDate }</td>
							</tr>						
							<tr>
								<th scope="row">이전 접속</th>
								<td>${loginMgrLastDate }</td>
							</tr>								
						</tbody>
					</table>
				</div>
				
				<form name="complForm" id="complForm">
					<input type="hidden" name="schEtc02" id="schEtc02" value="${searchVO.schEtc02}">
				</form>
				<div class="state01 m_box">
					<h2 class="m_title">민원합계</h2>
					<span class="selcs">
			          	<select id="select_eduCnt" onchange="chYearCompl(this);">
			          		<c:choose>
			          			<c:when test="${fn:length(yearList) > 0 }">
			          				<c:forEach var="list" items="${yearList }">
			          					<option value="${list.year }">${list.year }</option>
			          				</c:forEach>
			          			</c:when>
			          			<c:otherwise>
			          				<option value="<c:out value=""/>" >없음</option>
			          			</c:otherwise>
			          		</c:choose>
			          	</select>
		          	</span>
		          	<div class="tbl_complCnt">
		          	</div>
				</div>
				
				<div class="state02 m_box">
					<h2 class="m_title">접속현황</h2>
					<table class="state_tbl">
						<colgroup>
							<col style="width:25%">
							<col style="width:25%">
							<col style="width:25%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th scope="col">구분</th>
								<th scope="col">사용자페이지</th>
								<th scope="col">관리자페이지</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">접속횟수</th>
								<td class="point01"><fmt:formatNumber value="${maFtCnt.ftCnt }" pattern="#,###"/></td>
								<td class="point02"><fmt:formatNumber value="${maFtCnt.maCnt }" pattern="#,###"/></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div><!-- //top_area -->
			<div class="mid_area">
				<div class="lc">
					<div class="chart_cell m_box">
			        	<div class="main_chart">
			        		<h2 class="m_title">월별 민원 현황</h2>
							<div class="chart_box">
								<div id="chart01" style="max-width:1160px;height:100%"></div>
							</div>
						</div>
			        </div>
			        
			        <div class="chart_cell m_box">
			        	<div class="main_chart">
			        		<h2 class="m_title">접속횟수 현황</h2>
							<div class="chart_box">
								<div id="chart02" style="max-width:1160px;height:100%"></div>
							</div>
						</div>
			        </div>
				</div>
				<div class="rc">
					<div class="m_box">
						<div class="board_head">
				      		<h2 class="m_title">승인대기게시물</h2>
				      		<a href="/ma/mdev/mallow/list.do" class="more" title="더보기">+</a>
				      	</div>
      					<div class="board_box">
					       	<table class="main_board">
								<caption>강사교육문의</caption>
								<colgroup>
									<col style="width:10%;">
									<col style="width:16%;">
									<col>
									<col style="width:10%;">
									<col style="width:15%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">신청자</th>
										<th scope="col">제목</th>
										<th scope="col">상태</th>
										<th scope="col">접수일</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(allowNList) > 0 }">
											<c:forEach var="list" items="${allowNList }" varStatus="status">
												<tr class="cursor" onclick="location.href='/ma/mdev/mallow/view.do?seq=${list.seq}'">
													<td>${status.count }</td>
													<td>${list.name }</td>
													<td class="subject">
														<c:out value="${util:cutText(list.title,15,'...')}"/>
													</td>
													<td><span class="tag qna_ing">${list.bStatus}</span></td>
													<td>${list.rgstDt }</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr class="no_data">
												<td colspan="5">문의 내용이 존재하지 않습니다.</td>
											</tr>	
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div><!-- //board_box -->
					</div><!-- //m_box -->
					
					<div class="m_box">
						<div class="board_head">
				      		<h2 class="m_title">재승인신청</h2>
				      		<a href="/ma/mdev/mallow/list.do" class="more" title="더보기">+</a>
				      	</div>
      					<div class="board_box">
					       	<table class="main_board">
								<caption>교육과정문의</caption>
								<colgroup>
									<col style="width:10%;">
									<col style="width:16%;">
									<col>
									<col style="width:10%;">
									<col style="width:15%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">신청자</th>
										<th scope="col">제목</th>
										<th scope="col">상태</th>
										<th scope="col">접수일</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(allowPList) > 0 }">
											<c:forEach var="list" items="${allowPList }" varStatus="status">
												<tr class="cursor" onclick="location.href='/ma/mdev/mallow/view.do?seq=${list.seq}'">
													<td>${status.count }</td>
													<td>${list.name }</td>
													<td class="subject">
														<c:out value="${util:cutText(list.title,15,'...')}"/>
													</td>
													<td><span class="tag qna_ing">${list.bStatus}</span></td>
													<td>${list.rgstDt }</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr class="no_data">
												<td colspan="5">문의 내용이 존재하지 않습니다.</td>
											</tr>	
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div><!-- //board_box -->
					</div><!-- //m_box -->
					
				</div><!-- //rc -->
			</div>
		</section><!--// main -->
	</div>
</div>
<script type="text/javascript">
var getCompList=function(year){
	if(!$("#schEtc02").val().trim()){
		$("#schEtc02").val('${yearList[0].year}')
	}
	if(year){
		$("#schEtc02").val(year)
	}
	$.ajax({
		url:'mc01/compl.do'
		,data:$("#complForm").serialize()
		,dataType:'html'
		,success:function(data){
			$(".tbl_complCnt").html(data)
		}
		,error:function(err){
			alert("통신에러")
		}
	})
	return false;
}
var chYearCompl=function(year){
	getCompList($(year).val());
	return false;
}

<%-- 차트를 그릴때 필요한 합계 데이터.--%>
var arrUrlMaData = [];
var arrUrlFtData = [];
<%-- 차트를 그릴때 필요한 년도 데이터.--%>
var arrUrlCategory = [];

<c:forEach var="result" items="${urlConMCnt }" varStatus="status">
	arrUrlMaData.push(+'${result.maCnt}');
	arrUrlFtData.push(+'${result.ftCnt}');
	arrUrlCategory.push('${result.imonth}');
</c:forEach>

<%--차트를 그릴 element id--%>
Highcharts.chart('chart02', {
    chart: {//
        type: 'line'
    },
    <%-- 제목 부분은 opennote 양식을 사용하기 때문에 false--%>
    title: false,
    navigation: {
       buttonOptions: {
         y: -1000 //차트 다운버튼 화면에서 숨김
       }
    },
    credits: {
       enabled: false //하단 하이차트 주소 숨김
    },
    yAxis: {
        title: false,
        labels : {//
            format: '{value:,.0f}'
        }
    },
    xAxis: {
     categories: arrUrlCategory
    },
    plotOptions: {
        line: {
          dataLabels: {
            enabled: true
          }
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span>',
        pointFormat: '<table><tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                   '<td style="padding:0"><b>{point.y:,.0f}</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    series: [{
        name: '관리자 접속횟수',
        data: arrUrlMaData,
        color:'#d4ad38',
    }
    ,{
        name: '사용자 접속횟수',
        data: arrUrlFtData
    },
    ]
});
Highcharts.setOptions({
    lang : {
       thousandsSep:','
    }
});

getCompList();
</script>
</body>
</html>		