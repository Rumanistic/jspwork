package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class StdPwdUpdate
 */
public class StdPwdUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UseChunDbBean ucb = new UseChunDbBean();
		boolean result = false;
		
		if(request.getParameter("newPwd").equals(request.getParameter("newPwdChk"))){
			String stdNo = request.getParameter("stdNo");
			String newStdPwd = request.getParameter("newPwd");
			System.out.println(stdNo + " | " + request.getParameter("newPwdChk") + newStdPwd);	
			
			result = ucb.updateStdPwd(stdNo, newStdPwd);

			if(result) {
				HttpSession session = request.getSession();
				session.setAttribute("result", result);
			}
			
			if(stdNo.equals("admin")) {
				result = true;
				HttpSession session = request.getSession();
				session.setAttribute("result", result);
			}	
			
			response.sendRedirect("findpwd.jsp");
		}
			
	}

}
