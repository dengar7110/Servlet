package com.garden.servlet.database.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.garden.servlet.common.MysqlService;

@WebServlet("/db/ex/ex02")
public class Ex02Controller extends HttpServlet {

	@Override
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		MysqlService mysqlService = MysqlService.getInstance();
		// 접속
		mysqlService.connect();
		
		List <Map <String, Object>> resultList = mysqlService.select("SELECT * FROM `used_goods`");
		
		for(Map<String, Object> resultMap:resultList) {
			
			String title = (String)resultMap.get("title");
			int price = (Integer)resultMap.get("price");
			
			out.println("제목 : " + title + " 가격 : " + price);
			
		}
		
		
		String query = "INSERT INTO `used_goods` \r\n"
				+ "(`sellerId`, `title`, `price`, `description`)\r\n"
				+ "VALUE\r\n"
				+ "(3, '고양이 간식 팝니다', 2000, '안먹어도 팔아요');";
		
		int count = mysqlService.update(query);
		
		out.println("삽입 결과 : " + count);
		
		
		
	}
	
}
