package ajax;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class AjaxServletPostResponse extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/html; charset=utf-8"); // >> response의 데이터를 text타입으로 넘기기 때문에 모든 자료형이 String 형태로 리턴됨
		
		String name = (String)request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		/* // 응답 데이터를 한줄(String)으로 보낼 때
		String responseData = "이름: " + name + ", 나이: " + age;
		response.getWriter().print(responseData);
		*/

		/* // 응답 데이터만 별도로 보낼 때
		response.getWriter().print(name);
		response.getWriter().print(age);
		*/
		
		/*
		 * 
		 */
		
		JSONArray jArr = new JSONArray();
		jArr.add(name);
		jArr.add(age);
		
//		response.setContentType("application/json; charset=utf-8");
//		response.getWriter().print(jArr);
		
		JSONObject jObj = new JSONObject();
		jObj.put("name", name);
		jObj.put("age", age);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jObj);
		
//		Map<String, Object> responseData = new HashMap<>();
//		responseData.put("name", name);
//		responseData.put("age", Integer.parseInt((String)request.getParameter("age")));
		
		
		
	}

}
