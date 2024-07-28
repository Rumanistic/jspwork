package com;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class StdNoFind
 */
public class StdNoFind extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UseChunDbBean ucb = new UseChunDbBean();
		
		String stdName = request.getParameter("name");
		String stdSsn = request.getParameter("ssn");
		
		System.out.println("name : " + stdName + " | ssn : " + stdSsn);
		
		String result = ucb.getStdId(stdName, stdSsn);
		
		System.out.println(result);
		
		HttpSession session = request.getSession();
		session.setAttribute("result", result);
		response.sendRedirect("findid.jsp");
	}
}