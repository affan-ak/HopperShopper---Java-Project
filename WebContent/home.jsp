<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
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
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Categories</title>
</head>
<body>
<h1 align="center">Welcome to ReNtMeNoW:)</h1>
<h3 align="right"><a href="SellProduct.jsp">SELL PRODUCT HERE</a></h3>
		<p>Choose from a wide range of products.</p>
		<p>You can search for a particular item by category or type the name of the product in our search bar on the top left corner of the screen.</p>
		<p>Please choose a category from below :</p>
<ul>
		<%
			String query = "SELECT * FROM categories";
			ResultSet rs = conn.createStatement().executeQuery(query);
			while(rs.next()) {
				int id=rs.getInt("CategoryId");
		%>
		<li>
		<a href="ProductList.jsp?id=<%=id %>" target=""><%=rs.getString("CategoryName") %></a></li>
		
			<%} %>				
		</ul>

</body>
</html>