package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class StdInfoVerify
 */
public class StdInfoVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UseChunDbBean ucb = new UseChunDbBean();
		boolean verify = false;
		
		String stdNo = request.getParameter("no");
		String stdName = request.getParameter("name");
		String stdSsn = request.getParameter("ssn");
		
		System.out.println("stdNo : " + stdNo +" | name : " + stdName + " | ssn : " + stdSsn);
		if(stdNo.equals("admin") && stdName.equals("관리자") && stdSsn.equals("970122"))
			verify = true;
		else
			verify = ucb.doVerify(stdNo, stdName, stdSsn);
		
		System.out.println(verify);
		
		HttpSession session = request.getSession();
		session.setAttribute("isVerified", verify);
		session.setAttribute("stdNo", stdNo);
		response.sendRedirect("findpwd.jsp");
	}

}
