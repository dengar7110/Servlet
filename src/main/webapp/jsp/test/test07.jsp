<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>   
<%@ page import="java.util.ArrayList" %>   
<%@ page import="java.util.Map" %>   
<%@ page import="java.util.HashMap" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>test07</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<h2>검색 결과</h2>
		
		<div class="d-flex col-10 justify-content-around">
			<div>메뉴</div>
			<div>상호</div>
			<div>별점</div>
		</div>
		
	<%
		List<Map<String, Object>> list = new ArrayList<>();
	
	    Map<String, Object> map = new HashMap<String, Object>() {{ put("name", "버거킹"); put("menu", "햄버거"); put("point", 4.3); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "BBQ"); put("menu", "치킨"); put("point", 3.8); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "교촌치킨"); put("menu", "치킨"); put("point", 4.1); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "도미노피자"); put("menu", "피자"); put("point", 4.5); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "맥도날드"); put("menu", "햄버거"); put("point", 3.8); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "BHC"); put("menu", "치킨"); put("point", 4.2); } };
	    list.add(map);
	    
	    map = new HashMap<String, Object>() {{ put("name", "반올림피자"); put("menu", "피자"); put("point", 4.3); } };
	    list.add(map);
	
	    String keyword = request.getParameter("keyword"); 
	    
	    String[] checks = request.getParameterValues("check");
	    
	    %>
	    
	    <%
	    	for(int i = 0; i < list.size(); i++){
    			if(list.get(i).get("menu").equals(keyword)){
    				if (checks != null && checks[0].equals("except")){		
    				
    					if((double)list.get(i).get("point") > 4){ %>
    							
	    				<div class="d-flex col-10 justify-content-around">
			    			<div><%= list.get(i).get("menu") %></div>
			    			<div><%= list.get(i).get("name") %></div>
			    			<div><%= list.get(i).get("point") %></div>
			    		</div>
			    		
    			<% 		}
    						
    				}else{ %>
    				
	    			
	    				<div class="d-flex col-10 justify-content-around">
	    	    			<div><%= list.get(i).get("menu") %></div>
	    	    			<div><%= list.get(i).get("name") %></div>
	    	    			<div><%= list.get(i).get("point") %></div>
	    	    		</div>
    			<% 		
    				}
	    		}
	    	}
	    %>
	    
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>	
</body>
</html>