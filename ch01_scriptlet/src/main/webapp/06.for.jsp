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
	int sum = 0;
	for(int i = 1; i <= 10; i++){
		if(i <= 9){
%>
			<%=(i + " + ") %>
<%
	}else{
%>
			<%=(i + " = ") %>
<%		
		}		
	sum += i;
	}
%>
<%=sum %>
<br>
<%
	int[] arr = new int[10];
	for(int i = 0; i < arr.length; i++){
		arr[i] = i+1;
%>
		<%=arr[i] + "<br>"%>
<%
	}
%>
</body>
</html>