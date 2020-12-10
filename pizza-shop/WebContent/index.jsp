<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : ""; 
%>
</head>
<body>
	<%@include file="static/header.jsp" %>
    <%@include file="static/nav.jsp" %>
    
    <%
    switch(section) {
    case "insert":
        %><%@include file="page/insert.jsp" %><%
        break;
    case "total_select":
        %><%@include file="page/total_select.jsp" %><%
        break;
    case "shop_select":
        %><%@include file="page/shop_select.jsp" %><%
        break;
    case "list_select":
        %><%@include file="page/list_select.jsp" %><%
        break;
    default:
        %><%@include file="static/index.jsp" %><%
    }
    %>
    
    <%@include file="static/footer.jsp" %>
</body>
</html>