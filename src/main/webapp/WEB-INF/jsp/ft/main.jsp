<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<title>김건축사무소</title>
	<link rel="stylesheet" type="text/css" href="/publish/ft/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="/publish/ft/css/style.css">
	<%-- <link rel="stylesheet" href="/publish/ft/css/main.css"/> --%>
	<script type="text/javascript" src="/publish/ft/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/publish/ft/js/common.js"></script>
	<script type="text/javascript" src="/publish/ma/js/board.js"></script>
	<script type="text/javascript" src="/publish/ft/js/jquery.bxslider.js"></script>
	<script src="/publish/ma/js/jquery-ui.js"></script>
	<script src="/publish/ft/js/jquery.cookie.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			popUp();
			
			$('.slider').bxSlider({
				controls:false,
				auto: true,
				autoControls: true,
				autoControlsCombine:true,
				pager:true,
				pause: 4000
			});
		});
		function myFunc(){
			var url="/ft/ftcustomer/ftnotice/view.do?seq=3"
			window.open(url, 'popup', 'top=120,left=50,titlebar=no,status=no,toolbar=no,resizable=no,scrollbars=yes,width=800px, height=600px');
			
			$("#defaultFrm").attr({"action" : url, "method" : "post", "target" : url, "onsubmit" : ""}).submit();
			return false
		}
		
		/* 팝업을 띄우는 메인 스크립트 */
		function popUp(){
		<c:forEach var="popUp" items="${popupList}" varStatus="status">
			if(!$.cookie("popUpYn${status.count}")){
				var html="";
					html = '<div id="dispay_view${status.count}"class="mainPop js-mainPop id_popup1 p_main_pop">';
					html += '<h1 class="mainPop_tag">공지<br>사항</h1>';
					html += '<h2 class="mainPop_tit"><c:out value="${util:unEscape(popUp.title)}"/></h2>';
					html += '<div class="mainPop_cont">';
					html += '<p><c:out value="${util:unEscape(popUp.cont)}" escapeXml="false"/></p>';
					if('${popUp.atchFileId}'){
						html += '<p><img src="/atch/getImage.do?atchFileId=${popUp.atchFileId}&fileSn=0" alt="팝업" style="width:70%;"></p>';
					}
					html += '</div>';
					html += '<div class="mainPop_foot">';
					html += '<label class="no_today"><input type="checkbox" class="checkbox check" name="popUp" onclick="closePopup(${status.count})">오늘 하루 동안 열지 않음</label>';
					html += '<a href="javaScript:void(0)" class="btn_close od_popup" onclick="view_hide(${status.count}); return false;">닫기</a>';
					html += '</div>';
					html += '</div>';
					$("#pcPop").append(html);	
					$("#dispay_view${status.count}").css({"left":"${popUp.popLeft}px", "top":"${popUp.popTop}px", "width":"${popUp.popWidth}px"});	
			}	    		
		</c:forEach>
		$( ".p_main_pop" ).draggable();
		
	}
		
		/* 팝업 오늘 하루동안 보지 않기 버튼용 함수 */
		function closePopup(num) {
			if ($("input:checkbox[name=popUp]").is(":checked")==true) {
				$.cookie("popUpYn"+num, "N", 1);
				view_hide(num);
			}
			if ($("input:checkbox[name=mPop]").is(":checked")==true){
				$.cookie("mPop","N",1);
			}
		}
		
		/* 팝업 닫기 버튼용 */
		function view_hide(num) {
			$("#dispay_view"+num).css("display", "none");
		}
	</script>
 </head>
 <body>
 	<div>
 		<form id="#defaultFrm" method="post"  onsubmit="return false;">
 			<input type="hidden" id="seq">
 		</form>
 	</div>
 	<div id="pcPop"></div>
	<div id="skipnavi">
		<a href="#container">▶본문 바로가기</a>
		<a href="#gnb_area">▶주메뉴 바로가기</a>
	</div>
	<div id="wrapper">
		<!-- header  -->
		<%@ include file="/WEB-INF/jsp/cmmn/layout/ft/header.jsp" %>
		<!-- // header   -->
		<!-- container -->
		<div id="container">
			<div class="main_slider">
				<ul class="slider">
					<li>
						<img src="/publish/ft/images/main/slider01.png" alt="완벽한 시공 · 확실한 A/S 김건축은 고객맞춤형 서비스를 추구합니다">
					</li>
					<li>
						<img src="/publish/ft/images/main/slider02.png" alt="">
					</li>
					<li>
						<img src="/publish/ft/images/main/slider03.png" alt="">
					</li>
				</ul>
			</div>
			<div id="main_content">
				<div class="main_conts clear">
					<div class="business_box">
						<h3>사업분야</h3>
						<p>김건축의 사업분야를 소개합니다. <br>김건축은 고객맞춤형을 추구합니다.</p>
						<a href="/ft/ftcomp/ftbzarea/list.do">바로가기</a>
					</div>
					<div class="notice_box">
						<div>
							<h3>공지사항</h3>
							<ul class="notice_list">
								<c:forEach var="result" items="${noticeList}" varStatus="status">
									<li onclick="; return false;">
										<a href="#">
											<img src="/publish/ft/images/sub/icon_notice.png" alt="공지">
											&nbsp;<c:out value="${util:cutText(result.title,15,'...') }"/>
										</a>
										<span class="date">${result.rgstDt }</span>
									</li>
								</c:forEach>
							</ul>
							<a href="#" class="more"></a>
						</div>
					</div>
					<div class="quotation">
						<h3 class="tit_quotation"><img src="/publish/ft/images/main/tit_quotation.png" alt="견적문의"></h3>
						<div>
							<p>온라인으로 쉽고 간편한 견적내기</p>
                            <p>전문가들의 정확한 진단을 받아보세요.</p>
                            <a href="/ft/ftconsult/ftaskprice/list.do" alt="견적문의">온라인문의 바로가기<span class="quotation_arrow"></span></a>
						</div>
					</div>
				</div>
				<div class="main_tabarea clear">
					<ul class="tab_menu main_tab">
						<li class="current"><a href="#main_tab01"><span class="icon_tab01"></span><span>시공사례</span></a></li>
						<li><a href="#main_tab02"><span class="icon_tab02"></span><span>추천설계</span></a></li>
						<li><a href="#main_tab03"><span class="icon_tab03"></span><span>시공현장</span></a></li>
						<li><a href="#main_tab04"><span class="icon_tab04"></span><span>인테리어사례</span></a></li>
					</ul>
					<!-- 시공사례  -->
					<div id="main_tab01" class="tab_content main_tabcont">
						<ul class="clear">
							<c:forEach var="result" items="${bexamList}" varStatus="status">
								<li>
									<img src="/atch/getImage.do?atchFileId=${result.atchFileId}&fileSn=${result.minFileSn}" alt=""
					  					onerror="this.src='/publish/ma/images/no_img.png'" width="100%" height="100%">
									<a href="/ft/ftportfo/ftbexamp/view.do?seq=${result.seq}" target="_blank"><span class="hover_txt"><strong>${result.title }</strong>${result.rgstDt }</span><span class="more">상세보기 +</span></a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- 추천설계  -->
					<div id="main_tab02"  class="tab_content main_tabcont">
						<ul class="clear">
							<c:forEach var="result" items="${brecoList}" varStatus="status">
								<li>
									<img src="/atch/getImage.do?atchFileId=${result.atchFileId}&fileSn=${result.minFileSn}" alt=""
					  					onerror="this.src='/publish/ma/images/no_img.png'" width="100%" height="100%">
									<a href="/ft/ftportfo/ftbreco/view.do?seq=${result.seq}" target="_blank"><span class="hover_txt"><strong>${result.title }</strong>${result.rgstDt }</span><span class="more">상세보기 +</span></a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- 시공현장  -->
					<div id="main_tab03"  class="tab_content main_tabcont">
						<ul class="clear">
							<c:forEach var="result" items="${bfieldList}" varStatus="status">
								<li>
									<img src="/atch/getImage.do?atchFileId=${result.atchFileId}&fileSn=${result.minFileSn}" alt=""
					  					onerror="this.src='/publish/ma/images/no_img.png'" width="100%" height="100%">
									<a href="/ft/ftportfo/ftbfield/view.do?seq=${result.seq}" target="_blank"><span class="hover_txt"><strong>${result.title }</strong>${result.rgstDt }</span><span class="more">상세보기 +</span></a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- 인테리어사례  -->
					<div id="main_tab04"  class="tab_content main_tabcont">
						<ul class="clear">
							<c:forEach var="result" items="${binteexammList}" varStatus="status">
								<li>
									<img src="/atch/getImage.do?atchFileId=${result.atchFileId}&fileSn=${result.minFileSn}" alt=""
					  					onerror="this.src='/publish/ma/images/no_img.png'" width="100%" height="100%">
									<a href="/ft/ftportfo/ftinteexam/view.do?seq=${result.seq}" target="_blank"><span class="hover_txt"><strong>${result.title }</strong>${result.rgstDt }</span><span class="more">상세보기 +</span></a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			<%@ include file="/WEB-INF/jsp/cmmn/layout/ft/quickmenu.jsp" %>
			
		</div>
		<!-- //container -->
		<!-- footer -->
		<%@ include file="/WEB-INF/jsp/cmmn/layout/ft/footer.jsp" %>
		<!-- //footer -->
	</div>
 </body>
</html>
