<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="vList" class="vote.VoteList" />
<jsp:setProperty name="vList" property="*" />
<jsp:useBean id="vItem" class="vote.VoteItem" />
<jsp:setProperty name="vItem" property="*" />
<jsp:useBean id="vDao" class="vote.VoteDao" />
<%
	String sDate = request.getParameter("syear") + "-" + request.getParameter("smonth") + "-" + request.getParameter("sday");
	String eDate = request.getParameter("eyear") + "-" + request.getParameter("emonth") + "-" + request.getParameter("eday");
	vList.setSdate(sDate);
	vList.setEdate(eDate);
	
	System.out.println(sDate + " | "+ eDate);
	boolean result = vDao.insertVote(vList, vItem);
	String msg = "투표 등록에 실패했습니다.";
	String location = "voteInsert.jsp";
	
	if(result){
		msg = "정상적으로 등록되었습니다.";
		location = "voteList.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("<%=msg %>");
	location.href="<%=location %>";
</script>
</head>
<body>

</body>
</html>