package com;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class StdLogin
 */
public class StdLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		UseChunDbBean ucb = new UseChunDbBean();
		HttpSession session = request.getSession();
		
		String stdId = request.getParameter("id");
		String stdPwd = request.getParameter("pwd");
		
		boolean isLogin = ucb.doLogin(stdId, stdPwd);
		
		System.out.println("id: " + stdId + " pwd: " + stdPwd + " and isLogin? " + isLogin);
		
		if(stdId.equals("admin") && stdPwd.equals("admin")) {
			session.setAttribute("stdId", stdId);
			session.setAttribute("stdInfo", "관리자 로그인 중 입니다.");
			System.out.println(session.getAttribute("stdId"));
			response.sendRedirect("chunMain.jsp");
		}
		
		if(isLogin) {
			session.setAttribute("stdId", stdId);
			session.setAttribute("stdInfo", ucb.getStdInfo(stdId));
			System.out.println(session.getAttribute("stdId"));
			response.sendRedirect("chunMain.jsp");
		}
		else {
			out.print("<script>"
					+ "alert('로그인에 실패하였습니다.');"
					+ "location.href = 'chunLogin.jsp';"
					+ "</script>");
		}
	}

}
