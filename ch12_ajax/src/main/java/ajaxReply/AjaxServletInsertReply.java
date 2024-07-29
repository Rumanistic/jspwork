package ajaxReply;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxServletInsertReply
 */
public class AjaxServletInsertReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Reply r = new Reply();
		r.setContent(request.getParameter("content"));
		r.setRef(Integer.parseInt(request.getParameter("bnum")));
		r.setName(request.getParameter("name"));
		
		new ReplyDao().insertReply(r);
	}

}
