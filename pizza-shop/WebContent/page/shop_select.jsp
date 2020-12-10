<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>지점별 매출 현황</h3>
<table border="1">
	<tr>
		<td>지점 코드</td>
		<td>지점 명</td>
		<td>총매출액</td>
	</tr>
<%
    try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection
        ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
        Statement stmt = conn.createStatement();
        String query = "SELECT SHOP.SCODE, SHOP.SNAME, SUM(SALE.AMOUNT * PIZZA.COST) FROM TBL_PIZZA_01 PIZZA, TBL_SALELIST_01 SALE, TBL_SHOP_01 SHOP WHERE PIZZA.PCODE = SALE.PCODE AND SHOP.SCODE = SALE.SCODE GROUP BY SHOP.SCODE, SHOP.SNAME ORDER BY SHOP.SCODE ASC";
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            %>
                <tr>
                    <td><% out.println(rs.getString(1));%></td>
                    <td><% out.println(rs.getString(2));%></td>
                    <td>₩<% out.println(String.format("%,d", Integer.parseInt(rs.getString(3))));%></td>
                </tr>
            <%

        }
        stmt.close();
        conn.close();
    }
    catch (Exception e) {
        e.printStackTrace();
    }
%>
</table>