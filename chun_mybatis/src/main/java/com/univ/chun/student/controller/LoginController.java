package com.univ.chun.student.controller;

import java.io.IOException;

import com.univ.chun.student.service.StudentServiceImpl;
import com.univ.chun.student.vo.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Student std = new Student();
		std.setStudent_no(request.getParameter("id"));
		std.setStudent_pwd(request.getParameter("pwd"));
		
		Student stdLogin = new StudentServiceImpl().doLogin(std);
		System.out.println(stdLogin);
		if(stdLogin == null) {
			/* request.setAttribute("", stdLogin); */
			request.getRequestDispatcher("WEB-INF/views/login.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("stdLogin", stdLogin);
			request.getSession().setAttribute("sessionTimer", 1800);
			response.sendRedirect(request.getContextPath());
		}
	}

}
