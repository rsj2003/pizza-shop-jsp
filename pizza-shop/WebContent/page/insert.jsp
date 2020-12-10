<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>매출전표등록</h3>
<%
    try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection
        ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
        Statement stmt = conn.createStatement();
        %>
<form action="action/sale_insert.jsp" method="post" name="action_form">
<table border="1">
	<tr>
		<td>매출전표번호</td>
		<td><input type="number" name="saleno"></td>
	</tr>
	<tr>
		<td>지점코드</td>
		<td><input type="text" name="scode"></td>
	</tr>
	<tr>
		<td>판매일자</td>
		<td><input type="date" name="date"></td>
	</tr>
	<tr>
		<td>피자코드</td>
		<td>
			<select name="pcode">
				<option value="0">피자선택</option>
				<%
				String query = "SELECT PCODE, PNAME FROM TBL_PIZZA_01";
				ResultSet rs= stmt.executeQuery(query);
				while (rs.next()) {
					%><option value="<%=rs.getString(1)%>">[<%=rs.getString(1)%>] <%=rs.getString(2)%></option><%
				}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td>판매수량</td>
		<td><input type="number" name="amount"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="등록하기" onclick="submit_form()">
			<input type="button" value="다시쓰기" onclick="reset_form()">
		</td>
	</tr>
</table>
</form>

<script>
function reset_form() {
	alert("정보를 지우고 처음부터 다시 입력 합니다!");
	document.action_form.reset();
}

function submit_form() {
	if(document.action_form.saleno.value === "") {
		alert("매출전표번호가 입력되지 않았습니다.");
		document.action_form.saleno.focus();
		return;
	}
	if(document.action_form.scode.value === "") {
		alert("지점코드가 입력되지 않았습니다.");
		document.action_form.scode.focus();
		return;
	}
	if(document.action_form.date.value === "") {
		alert("판매일자가 입력되지 않았습니다.");
		document.action_form.date.focus();
		return;
	}
	if(document.action_form.pcode.selectedIndex === 0) {
		alert("피자코드가 입력되지 않았습니다.");
		document.action_form.pcode.focus();
		return;
	}
	if(document.action_form.amount.value === "") {
		alert("판매수량이 입력되지 않았습니다.");
		document.action_form.amount.focus();
		return;
	}
	
	alert("등록을 하겠습니다.");
	document.action_form.submit();
}
</script>

        
<%        stmt.close();
        conn.close();
    }
    catch (Exception e) {
        e.printStackTrace();
    }
%>