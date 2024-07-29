package com.tjoeun.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.tjoeun.vo.Person;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OperationServlet
 */
public class OperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("big", 10);
		request.setAttribute("small", 3);
		
		request.setAttribute("sOne", "");
		request.setAttribute("sTwo", "");
		request.setAttribute("sThree", "안녕");
		
		request.setAttribute("pOne", new Person("", 20, ""));
		request.setAttribute("pTwo", null);
		
		ArrayList<String> aList1 = new ArrayList<>();
		request.setAttribute("aOne", aList1);
		
		ArrayList<String> aList2 = new ArrayList<>();
		aList2.add("YaY");
		request.setAttribute("aTwo", aList2);
		
		request.getRequestDispatcher("views/01_EL/02_operation.jsp").forward(request, response);
	}

}
