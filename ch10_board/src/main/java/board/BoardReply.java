package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class BoardReplyServlet
 */
public class BoardReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String curPage = request.getParameter("curPage");
		
		Board b = new Board();
		b.setName(request.getParameter("name"));
		b.setSubject(request.getParameter("subject"));
		b.setContent(request.getParameter("content"));
		b.setPass(request.getParameter("pass"));
		b.setIp(request.getParameter("ip"));
		b.setRef(Integer.parseInt(request.getParameter("ref")));
		b.setPos(Integer.parseInt(request.getParameter("pos")));
		b.setDepth(Integer.parseInt(request.getParameter("depth")));
		
		BoardDAO bDao = new BoardDAO();
		bDao.updateReplyPos(b.getRef(), b.getPos());
		bDao.replyBoard(b);
		
		response.sendRedirect("list.jsp?curPage=" + curPage);
	}

}
