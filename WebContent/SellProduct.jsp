<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sell Product</title>
</head>

<%@ page import="java.sql.*" %>

 <%
    String URL = "jdbc:mysql://localhost:3306/rentmenow";
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String USER = "affan";
    String PASS = "affan";
    Connection conn=null;
    try {
    	Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(URL,USER,PASS);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
    ResultSet rs = conn.createStatement().executeQuery("Select * from categories");
 %>

<body>
<h1 align="center">SELL PRODUCT HERE</h1>
<form action="Submitproduct" method="get">
		<label>Product Name :	<input type="text" name="pname"></label><br/><br/>
		<label>Product Description:	<textarea name="desc"></textarea></label><br/><br/>
		<label>Cost:	<input type="number" name="cost"></label><br/><br/>
		<label>Category<select name="category">
		<%while(rs.next()){
						String cat = rs.getString("CategoryName");
						int id = rs.getInt("CategoryId");
						%><option value="<%=id %>"> <%=cat %></option>
					<%}%>
		
		
		</select></label></br><br/>
		<input type="submit" value="SUBMIT"/>
	</form>
</body>
</html>