package com.garden.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test03")
public class Test03Controller extends HttpServlet{
	
//	기사 문구를 브라우저에 출력하세요.
//	WebServlet 어노테이션을 이용해서 URL을 Mapping 하세요.
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dateTimeString = formatter.format(date);
		out.println("<html><head><title>뉴스기사</title></head><body>");
		out.println("<h1>[단독] 고양이가 야옹해</h1>");
		out.println("<p>기사 입력시간 : " + dateTimeString + "</p><hr>");
		out.println("<p>끝</p></body></html>");
		
		
	}
	

}
