<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<html lang="ko">
<head>
<title>한국전파진흥협회</title>
<script type="text/javascript">
window.onload = function() {
	var scrollHeight = document.getElementById("body").scrollHeight;
	<%-- 부모창으로 높이 보내기 --%>
	window.parent.postMessage({"scrollHeight" : scrollHeight }, '*');
};
</script>
<style>
	pre {word-wrap:break-word; white-space: pre-wrap;}
</style>

</head>
<body id="body">
	<c:out value="${util:unEscape(mailVO.cont) }" escapeXml="false" />
</body>
</html>