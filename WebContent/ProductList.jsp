<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*"%>

<%
	String URL = "jdbc:mysql://localhost:3306/rentmenow";
	String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	String USER = "affan";
	String PASS = "affan";
	Connection conn = null;
	try {
		Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(URL, USER, PASS);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProductList</title>
</head>
<body>

<%
		String query = "SELECT * FROM product WHERE ";
		if (request.getParameter("id") != null) {
			int catId = Integer.parseInt(request.getParameter("id"));
			query += "CategoryId=" + catId;
		} /* else if (request.getParameter("search") != null) {
			String searchString = request.getParameter("search");
			query += "product_name LIKE '%" + searchString + "%'";
		} */
		System.out.println("Query: " + query);
		ResultSet rs = conn.createStatement().executeQuery(query);
	%>
	<ul class="wrapper">
		<%
			while (rs.next()) {
				int id = rs.getInt("ProductId");
		%>
		<form action="">
		<li class="box">
				<%=rs.getString("ProductName")%> <br>
				<label>Description : </label><%=rs.getString("ProductDescription") %><br>
				<label>Price per day :</label><%=rs.getString("Price") %>
				<input class="btn btn-success" type="submit" name="rent" value="Rent" onclick="rentbutton()">
				<br><br>
		</li>
		</form>
		<%
			}
		%>
	</ul>

</body>
</html>