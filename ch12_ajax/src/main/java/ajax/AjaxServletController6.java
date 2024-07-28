package ajax;

import java.io.IOException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxServletController6 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> mList = new MemberMgr().getAllMember();
		
		response.setContentType("application/json; charset=utf-8");
		/*
		 * JSONArray jarr = new JSONArray(); for(Member m : mList) { JSONObject jobj =
		 * new JSONObject(); jobj.put("id", m.getId()); jobj.put("name", m.getName());
		 * jobj.put("gender", m.getGender()); jobj.put("email", m.getEmail());
		 * 
		 * jarr.add(jobj); }
		 */
		
		new Gson().toJson(mList, response.getWriter());
		
		/* response.getWriter().print(jarr); */		
	}

}
