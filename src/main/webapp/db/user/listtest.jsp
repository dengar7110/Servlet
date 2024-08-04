<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.garden.servlet.common.MysqlService" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍당무 마켓</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

<%
    MysqlService mysqlService = MysqlService.getInstance();
    mysqlService.connect();
    
    String query = "SELECT used_goods.image, used_goods.title, used_goods.price, seller.nickname FROM `used_goods`"
                + "JOIN `seller` ON seller.id = used_goods.sellerId"
                + "ORDER BY seller.id DESC;";
                
    List<Map<String, Object>> resultList = mysqlService.select(query);

    if (resultList == null) {
        System.out.println("resultList is null");
    } else {
        System.out.println("resultList size: " + resultList.size());
    }
%>

<div id="wrap">

    <div class="header-nav">
        <header class="mt-3">
            <h3 class="text-center text-white">HONG당무 마켓</h3>
        </header>
        
        <nav class="main-menu">
            <ul class="nav nav-fill font-weight-bold mb-3">
                <li class="nav-item"><a href="#" class="nav-link text-white">리스트</a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white">물건 올리기</a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white">마이 페이지</a></li>
            </ul>
        </nav>
    </div>
    
    <section class="container mt-4">
        <div class="row">
        <% if (resultList != null && !resultList.isEmpty()) { %>
            <% for(Map<String, Object> resultMap : resultList) { %>
                <div class="col-4">
                    <div class="content border border-success p-3">
                        <img width="200" alt="" src="<%= resultMap.get("image") %>">
                        <div class="font-weight-bold"><%= resultMap.get("title") %></div>
                        <div><%= resultMap.get("price") %> 원</div>
                        <div><%= resultMap.get("nickname") %></div>
                    </div>
                </div>
            <% } %>
        <% } else { %>
            <div class="col-12">
                <p>상품 목록이 없습니다.</p>
            </div>
        <% } %>
        </div>
    </section>
    
    <footer class="mt-4 text-center">
        <div>Copyright 2019. HONG All Rights Reserved.</div>
    </footer>
    
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>