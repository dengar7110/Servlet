<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>test03</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

	<%
		String what = request.getParameter("what");
	
		Date date = new Date();
		
		SimpleDateFormat dateformatter = new SimpleDateFormat("yyyy년 M월 d일"); 
		SimpleDateFormat timeformatter = new SimpleDateFormat("H시 m분 s초");
		
		String result = "규격에 맞지 않는 파라미터 유형!!";
		
		String dateString = dateformatter.format(date);
		String timeString = timeformatter.format(date);
		
		// what : date : 날짜
		// what : date : 시간  
		if(what.equals("date")) {
			result = "오늘 날짜 " + dateString;
		}else if(what.equals("time")) {
			result = "현재 시간 " + timeString;
		}
	
	%>
	
	<div class="container">
		<div class="display-4"><%= result %></div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>