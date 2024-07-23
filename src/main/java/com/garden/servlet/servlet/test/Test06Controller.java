package com.garden.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test06")
public class Test06Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		
		String number2String = request.getParameter("number2");
		
		int number1 = Integer.parseInt(request.getParameter("number1"));
		int number2 = Integer.parseInt(request.getParameter("number2"));
		
		int addtion = number1 + number2;
		int substraction = number1 - number2;
		int multiplication = number1 * number2;
		int division = number1 / number2;
		
		//{"addition":100, "substraction":20, "multiplication":102 , "division":10"}
		
		out.println("{\"addtion\":" + addtion + ",\"substraction\":" + substraction + ",\"multiplication\":" + multiplication + ",\"division\":" + division + "}");
		
		
	}

}
