package board;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class BoardUpdate
 */
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String curPage = request.getParameter("curPage");
		Board b = new Board();
		BoardDAO bDao = new BoardDAO();
		
		b.setNum(Integer.parseInt(request.getParameter("num")));
		b.setName(request.getParameter("name"));
		b.setSubject(request.getParameter("subject"));
		b.setContent(request.getParameter("content"));
		b.setPass(request.getParameter("pass"));
		
		System.out.println("b.pass : " + b.getPass());
		
		HttpSession session = request.getSession();
		Board lb = (Board)session.getAttribute("bean");
		
		System.out.println("lb.pass : " + lb.getPass());
		
		if(lb.getPass().equals(b.getPass())) {
			if(bDao.updateBoard(b)) {
				response.sendRedirect("read.jsp?num=" + b.getNum() + "&curPag=" + curPage);
			}			
		} else {
			out.print("<script>");
			out.print("alert('비밀번호가 일치하지 않습니다.')");
			out.print("history.back()");
			out.print("<script>");
		}
	}

}
