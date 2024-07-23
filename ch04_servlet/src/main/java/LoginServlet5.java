

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet5
 */
public class LoginServlet5 extends HttpServlet {
	private String id = "admin";
	private String pw = "P@ssw0rd!";
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");
		
		if(userId != null && userPw != null) {
			if(userId.equals(id) && userPw.equals(pw)) {
				HttpSession session = request.getSession();
				session.setAttribute("idKey", userId);
				System.out.println("login success:" + userId + "/ " + userPw);
			}
			else
				System.out.println("login failed:" + userId + "/ " + userPw);
		}
		response.sendRedirect("05.login.jsp");
	}

}
