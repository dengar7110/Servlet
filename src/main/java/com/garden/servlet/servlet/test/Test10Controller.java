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
public class Test10Controller extends HttpServlet{
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		String name = userMap.get("name");
		out.println("<html><head><title>사용자 정보 확인</title></head><body>");
		
		if(!userId.equals(userMap.get("id"))) {
			out.println("<h2>id가 일치하지 않습니다.</h2>");
		}else if (!password.equals(userMap.get("password"))){
			out.println("<h2>password가 일치하지 않습니다.</h2>");
		}else {
			out.println("<h2>" + name + "님 환영합니다.</h2>");
		}
		
		out.println("</body></html>");
		
	}
	
	private final Map<String, String> userMap =  new HashMap<String, String>() {
	    {
	        put("id", "hagulu");
	        put("password", "asdf");
	        put("name", "김인규");
	    }
	};

}


