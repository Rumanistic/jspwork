<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/* 	
		Cookie[] cookie = request.getCookies();
		if(cookie != null) {
			for(int i = 0; i < cookie.length; i++){
				if(cookie[i].getName().equals("myCookie"))
					out.print("Cookie name = :" + cookie[i].getName() + "<br> Cookie value = " + cookie[i].getValue() + "<p/>");
			}
		} 
	*/
	
	Cookie[] cookies = request.getCookies();
%>
<%!
	public String getCookieValue(Cookie[] cookies, String name){
		if(cookies != null){
			for(int i = 0; i < cookies.length; i++){
				if(cookies[i].getName().equals(name)){
					return cookies[i].getValue();
				}
			}
		}
		return null;
	}
%>
이름 : <%=getCookieValue(cookies, "NAME") %>
성별 : <%=getCookieValue(cookies, "GENDER") %>
나이 : <%=getCookieValue(cookies, "AGE") %>
</body>
</html>