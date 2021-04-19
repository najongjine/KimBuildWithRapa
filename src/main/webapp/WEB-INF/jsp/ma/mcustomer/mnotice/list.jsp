<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<style>

       /* Set the size of the div element that contains the map */

      #map {

        height: 400px;  /* The height is 400 pixels */

        width: 100%;  /* The width is the width of the web page */

       }

    </style>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script
    src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script type="text/javaScript">
$(document).ready(function(){
	
	fncDate('searchStartDate','searchEndDate');	
	fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
	
	if($("#selectNoticeDateCat").val() == 'none'){
		$("#dateSearchSpan").hide()
	}
	
	$(document).on('change','#selectNoticeDateCat',function(){
		if($("#selectNoticeDateCat").val() != 'none'){
			$("#dateSearchSpan").show()
		}
		else{
			$("#dateSearchSpan").hide()
		}
   });
	
});
//Initialize and add the map

function initMap() {

  // The location of Uluru

  var uluru = {lat: 35.02513526817247, lng: 126.78068508458036};

  // The map, centered at Uluru

  var map = new google.maps.Map(

      document.getElementById('map'), {zoom: 14, center: uluru});

  // The marker, positioned at Uluru

  var marker = new google.maps.Marker({position: uluru, map: map});

}
</script>
<%-- content --%>
<div class="content_box">
	 <div id="map"></div>
	<div>dgsdgwgwt4</div>
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="hidden" id="seq" name="seq"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit">검색구분</strong>
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="w100"  >  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="제목"/>
						<form:option value="2" label="내용"/>
					</form:select>
					<form:input path="searchKeyword" id="searchKeyword" class="text w50p" />
					&nbsp;&nbsp;&nbsp;&nbsp;
					<strong class="tit">기간구분</strong>
					<form:select path="selectNoticeDateCat" id="selectNoticeDateCat" title="날짜 종류 선택" cssClass="w100"  >
						<form:option value="rgstdate" label="등록일"/>
						<form:option value="noticedate" label="공지기간"/>
					</form:select>
					<span id="dateSearchSpan">
						<form:input path="searchStartDate" id="searchStartDate" readonly="readonly" class="text w100" />
							~
						<form:input path="searchEndDate" id="searchEndDate" readonly="readonly" class="text w100"/>
					</span>
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
				</div>
			</fieldset>
		</form:form>
	</div>
	<%--// search  --%>
	<div class="tbl">
	</div>
	 <script async defer

    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDkGDqpH6pcGOyyp4Z4TWBLde-YI0LRBKE&callback=initMap">

    </script>
</div>
