<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
int saleno = Integer.parseInt(request.getParameter("saleno"));
String scode= request.getParameter("scode");
String pcode = request.getParameter("pcode");
String date = request.getParameter("date");
int amount = Integer.parseInt(request.getParameter("amount"));

try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection
    ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    Statement stmt = conn.createStatement();
    
	String insert_query = "INSERT INTO TBL_SALELIST_01 VALUES(%d, '%s', '%s', '%s', %d)";
	stmt.executeQuery(String.format(insert_query, saleno, scode, date, pcode, amount));
	
	conn.commit();
	
    stmt.close();
    conn.close();
}
catch (Exception e) {
    e.printStackTrace();
}

response.sendRedirect("../index.jsp?section=total_select");

%>