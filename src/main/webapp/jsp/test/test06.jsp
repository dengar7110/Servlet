<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>test06</title>
</head>
<body>

<%--  List<String> goodsList = Arrays.asList(new String[]{ 
    "저지방 우유", "요플레 4개", "딸기 1팩", "삼겹살 300g", "생수 6개", "주방 세제"
	});
--%>
	<% 
		List<String> goodsList = Arrays.asList(new String[]{ 
			  "저지방 우유", "요플레 4개", "딸기 1팩", "삼겹살 300g", "생수 6개", "주방 세제"
		}); 
	%>
	
	<div class="container">
		<h2>장 목록</h2>
		<hr>

	</div>

</body>
</html>