

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class PostServlet4
 */
public class PostServlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int mask = pw.length();
		String pw_mask = "";
		for(int i = 0; i < mask; i++) {
			pw_mask += "*";
		}
		out.print("<html>");
		out.print("<body>");
		out.print("<h1>Post 서블릿으로 html문서 만들기</h1>");
		out.print("<h3> ID: " + id + "</h3>");
		out.print("<h3> PW: " + pw_mask + "</h3>");
		out.print("<h3> EMAIL: " + email + "</h3>");
		out.print("</body>");
		out.print("</html>");
		
		System.out.println("id: " + id);
		System.out.println("pw: " + pw);
		System.out.println("email: " + email);
	}

}
