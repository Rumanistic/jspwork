package com.tjoeun.controller;

import java.io.IOException;

import com.tjoeun.vo.Person;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ElServlet
 */
public class ElServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 데이터를 담을 수 있는 jsp 내장 객체의 종류
		 * 1. ServletContext(Application Scope)
		 * 		한 애플리케이션당 단 한개만 존재하는 객체
		 * 		이 영역에 데이터를 담으면 애플리케이션 전역에서 사용 가능
		 * 		공유 범위가 가장 큼(jsp / servlet / java)
		 * 
		 * 2. HttSession(Session Scope)
		 * 		한 브라우저당 1개가 존재하는 객체
		 * 		이 영역에 데이터를 담으면 jsp / servlet 단에서 사용 가능
		 * 		공유 범위가 2번째로 큼(jsp/ servlet)
		 * 
		 * 3. HttpServletRequest(request Scope)
		 * 		요청할 때 마다 생성하는 객체
		 * 		이 영역에 데이터를 담으면 request 객체를 포워딩 받는 응답 jsp에서만 사용 가능
		 * 		공유는 응답 jsp에서만 가능
		 * 
		 * 4. Pagecontext(page Scope)
		 * 		jsp페이지마다 존재하는 객체
		 * 		공유 범위가 가장 작음(해당 페이지 내에서만 사용 가능)
		 * 
		 * 위 4개의 객체들을
		 * 		데이터를 담을 때는 .setAttribute("key", dataForSave);
		 * 		데이터를 꺼낼 때는 .getAttribute("key");
		 * 		데이터를 삭제할 때 .removeAttribute("key");
		 */
		
		// 3. requestScope
		request.setAttribute("classRoom", "801호");
		request.setAttribute("student", new Person("홍길동", 23, "남"));
		
		// 2. sessionScope
		HttpSession hs = request.getSession();
		hs.setAttribute("academy", "tjoeun");
		hs.setAttribute("teacher", new Person("김지원", 35, "여"));
		
		request.setAttribute("scope", "3. RequestScope");
		hs.setAttribute("scope", "2. SessionScope");
		
		// 응답페이지를 지정하여 포워딩
		request.getRequestDispatcher("views/01_EL/01_el.jsp").forward(request, response);
	}

}
