<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.*" %>
<%
	ChunBean cb = null;

	cb = (ChunBean)session.getAttribute("stdInfo");
	int sessionExpireTimer = 1800;
	
	if(cb != null){
		
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
<script type="text/javascript">
	logout = () => {
<%
		session.invalidate();
%>
		location.href = "chunLogin.jsp";
	}
</script>
</head>
<body>
	<div>
		<span>
			<script type="text/javascript">
				let i = <%=sessionExpireTimer %>;
				let expireCounter = setInterval(() => {i--}, 1000);
				String timer = "" + expireCounter/60 + ":" + expireCounter%60;
			</script>
			
		</span>
	</div>
  <button onclick="logout();">로그아웃</button>
</body>
</html>