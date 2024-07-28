package ajaxReply;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

import ajax.Member;
import ajax.MemberMgr;

public class AjaxServletReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		ArrayList<Reply> rList = new ReplyDao().getRelpyList(Integer.parseInt(request.getParameter("ref")));
		new Gson().toJson(rList, response.getWriter());
	}

}
