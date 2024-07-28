package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class BoardPost
 */
public class BoardPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board b = new Board();
		BoardDAO bDao = new BoardDAO();
		
		b.setName(request.getParameter("name"));
		b.setSubject(request.getParameter("subject"));
		b.setContent(request.getParameter("content"));
		b.setPass(request.getParameter("pass"));
		b.setIp(request.getParameter("ip"));
		
		if(bDao.insertBoard(b)) {
			response.sendRedirect("list.jsp");
		}
		else {
			
		};
	}
}
