package com.garden.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/servlet/test10")
public class Test10Controller extends HttpServlet {
	
	private final Map<String, String> userMap =  new HashMap<String, String>() {
		{
			put("id", "hagulu");
			put("password", "asdf");
			put("name", "김인규");
		}
	};
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = userMap.get("name");
		
		out.println("<html><head><title>사용자 정보 확인</title></head><body>");
		
		if(!id.equals(userMap.get("id"))) {
			// 아이디가 일치하지 않는 경우
			out.println("<h3>ID가 일치하지 않습니다.</h3>");
		}else if (!password.equals(userMap.get("password"))){
			out.println("<h3>password가 일치하지 않습니다.</h3>");
		}else {
			out.println("<h3>" + name + "님 환영합니다.</h3>");
		}
		
		out.println("</body></html>");
		
	}
	

}


