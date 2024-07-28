package ajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AjaxServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("input");
		System.out.println("요청 시 전달한 값 : " + str);
		
		// DB에서 요청 처리를 수행했다고 가정, 응답할 데이터
		String responseData = "리턴데이터 : " + str + ", 길이 : " + str.length();
		
		// 응답 데이터 리턴
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(responseData);
	}

}
