<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>통합매출현황조회</h3>
<table border="1">
	<tr>
		<td>매출전표번호</td>
		<td>지점</td>
		<td>판매일자</td>
		<td>피자코드</td>
		<td>피자명</td>
		<td>판매수량</td>
		<td>매출액</td>
	</tr>
<%
    try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection
        ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
        Statement stmt = conn.createStatement();
        String query = "SELECT SALE.SALENO, SHOP.SCODE, SHOP.SNAME, SALE.SALEDATE, PIZZA.PCODE, PIZZA.PNAME, SALE.AMOUNT, PIZZA.COST * SALE.AMOUNT FROM TBL_PIZZA_01 PIZZA, TBL_SALELIST_01 SALE, TBL_SHOP_01 SHOP WHERE PIZZA.PCODE = SALE.PCODE AND SHOP.SCODE = SALE.SCODE ORDER BY SALE.SALENO ASC";
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
        	String date = rs.getString(4).substring(0,10);
            %>
                <tr>
                    <td><% out.println(rs.getInt(1));%></td>
                    <td><% out.println(rs.getString(2) + "-" + rs.getString(3));%></td>
                    <td><% out.println(date);%></td>
                    <td><% out.println(rs.getString(5));%></td>
                    <td><% out.println(rs.getString(6));%></td>
                    <td><% out.println(rs.getInt(7));%></td>
                    <td>₩<% out.println(String.format("%,d", Integer.parseInt(rs.getString(8))));%></td>
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