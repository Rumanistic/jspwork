<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, board.*" %>
<jsp:useBean id="bDao" class="board.BoardDAO" />
<%
	request.setCharacterEncoding("utf-8");
	int curPage = 1;
	int curBlock = 1;
	
	int pageSize = 10;
	int pagePerBlocks = 5;
	
	int totalRecord = 0;
	int totalPages = 0;
	int totalBlocks = 0;
	
	int start = 0;
	int end = 0;
	int listSize = 0;
	
	String keyField = "";
	String keyWord = "";
	
	if(!(request.getParameter("curPage") == null || request.getParameter("curPage").equals(""))){
		curPage = Integer.parseInt(request.getParameter("curPage"));
	}
	if(!(request.getParameter("keyField") == null || request.getParameter("keyField").equals("null"))){
		keyField = request.getParameter("keyField");
	}
	if(!(request.getParameter("keyWord") == null || request.getParameter("keyWord").equals("null"))){
		keyWord = request.getParameter("keyWord");
	}
	if(request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")){
			keyField = "";
			keyWord = "";
		}
	}
	
	start = (curPage * pageSize) - pageSize + 1;
	end = curPage * pageSize;
	
	System.out.println("Start: " + start + " | End: " + end);
	
	totalRecord = bDao.getTotalBoards(keyField, keyWord);
	totalPages = (int)Math.ceil(totalRecord/(double)pageSize);
	curBlock = (int)Math.ceil(curPage/(double)pagePerBlocks);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판</title>
<style>
	* {margin: 0 auto;}
	div {width:800px;}
	h2, .cen{text-align:center; }
	.m50 {margin-top:50px;}
	table {margin-top: 30px; width:800px;}
	table th, table td {text-align:center;}
	.a {text-decoration:none; color:black; cursor:pointer;}
	
</style>
<script type="text/javascript">
	block = (val) => {
		document.readFrm.curPage.value = <%=pagePerBlocks %> * (val - 1) +1;
		document.readFrm.submit();
	}
	
	pageing = (val) => {
		document.readFrm.curPage.value = val;
		document.readFrm.submit();
	}
	
	list = () => {
		document.listFrm.submit();
	}
	
	read = (val) => {
		document.readFrm.num.value = val;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
	}
</script>
</head>
<body>
	<h1 style="text-align: center">JSP Board</h1>
	<div>
	<%
		if(totalRecord > 0){	
	%>
		Total: <%=totalRecord %>Articles <font color="red">(<%=curPage %>/<%=totalPages %>Pages)</font>
	<%
		}
		else {
	%>
		<font color="red">검색된 결과가 없습니다.</font>
	<%
		}	
	%>
	</div>
	<table>
		<tr>
	  		<th width="10%">번 호</th>
	    	<th width="40%">제 목</th>
		    <th width="15%">이 름</th>
		    <th width="25%">날 짜</th>
		    <th width="20%">조회수</th>
	  	</tr>
  	<%
	  	ArrayList<Board> aList = bDao.getBoardList(keyField, keyWord, start, end);
  		listSize = aList.size();
  			
	  	for(int i = 0; i < aList.size(); i++){
	  		/* System.out.println(i); */
	  		if(aList.get(i) == null)
	  			break;
	  		Board b = aList.get(i);
	  		String regDate = b.getRegdate().substring(0, 10);
	%>
		<tr>
			<%-- <td><%=b.getNum() %></td> --%>
			<td>
				<%=totalRecord - (curPage - 1) * pageSize - i %>
			</td>
			<td style="text-align: left"> &ensp;
	<%
		if(b.getDepth() > 0){
			for(int j = 0; j < b.getDepth(); j++){
				%>
				&emsp;
				<%
			}
		}
	%>
				<a href="javascript:read('<%=b.getNum() %>')"><%=b.getSubject() %></a>
			</td>
			<td><%=b.getName() %></td>
			<td><%=regDate %></td>
			<td><%=b.getCount() %></td>
		</tr>
	<%
	  	}
	%>
		<tr>
			<td></td>
			<td colspan=3>
	<%
		int pageStart = (curBlock - 1) * pagePerBlocks + 1;
		int pageEnd = pageStart + pagePerBlocks <= totalPages ? pageStart + pagePerBlocks : totalPages + 1;
		System.out.println("pageEnd : " + pageEnd);
		if(totalPages != 0){
			if(curBlock > 1){
	%>
		<a href="javascript:block('<%=curBlock -1%>')">&lt;&lt;</a>
	<%
			}
			
			for(; pageStart < pageEnd; pageStart++){
	%>
		<a href="javascript:pageing('<%=pageStart %>')">[<%=pageStart %>]</a>
	<%
			}
			
			if(totalPages > curBlock * pagePerBlocks){
	%>
		<a href="javascript:block('<%=curBlock +1%>')">>></a>
	<%		
			}
		}
 	%>
			</td>
			<td>
		 		<a href="post.jsp" class="a">[글쓰기]</a>&emsp;
				<a href="javascript:list();" class="a">[처음으로]</a>
			</td>
		</tr>
	</table>
	<div>
	</div>
	<hr>
	<form name="postFrm"></form>
	<form name="searchFrm" method="get" action="list.jsp">
		<table align="center" width="700">
			<tr>
				<td align="center">
					<select name="keyField">
						<option value="name">이름</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select>
					<input name="keyWord" required>
					<input type="submit" value="찾기">
				</td>
			</tr>
		</table>
	</form>
	
	<form name="listFrm">
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="newPage" value="1">
	</form>
	
	<form name="readFrm">
		<input type="hidden" name="num">
		<input type="hidden" name="curPage" value="<%=curPage %>">
		<input type="hidden" name="keyField" value="<%=keyField %>">
		<input type="hidden" name="keyWord" value="<%=keyWord %>">
	</form>
	
	
</body>
</html>
























