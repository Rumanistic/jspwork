<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,vote.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<%
	int num = 0;

	if(!(request.getParameter("num") == null || request.getParameter("num").equals("")))
		num = Integer.parseInt(request.getParameter("num"));
	int sum = vDao.sumVoteCount(num);
	ArrayList<VoteItem> aList = vDao.getVoteCount(num);
	VoteList vList = vDao.getOneVote(num);
	
	Random r = new Random();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table>
			<tr>
				<th colspan=4>Q : <%=vList.getQuestion() %></th>
			</tr>
			<tr>
				<td colspan=4>총 투표 수 : <%=sum %></td>
			</tr>
			<tr>
				<th width="10%">번호</th>
				<th width="20%">항목</th>
				<th>그래프</th>
				<th width="10%">특표 수</th>
			</tr>
		<%
			System.out.println(aList.size());
			for(int i = 0; i < aList.size(); i++){
				VoteItem vi = aList.get(i);
				
				int rgb = r.nextInt(255*255*255);
				String rgbHex = "#" + Integer.toHexString(rgb);
				
				int ratio = (int)(Math.ceil(vi.getCount() / (double)sum * 100));
				String[] list = vi.getItem();
		%>
			<tr>
				<td><%=i %></td>
				<td><%=list[0] %></td>
				<td>
					<table width="<%=ratio %>" height="15">
						<tr>
							<td bgcolor="<%=rgbHex %>"></td>
						</tr>
					</table>
				</td>
				<td><%=vi.getCount() %></td>
			</tr>
		<%
			} 
		%>
		</table>
	</div>
</body>
</html>