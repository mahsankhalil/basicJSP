<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Database.DB" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Faculty</title>
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
</head>
<body>
<div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4">
                    <h2 style="text-align: center">Teacher Details</h2>
                </div>
            </div>
            <div class="col-sm-2">
                        <a href="index.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
                    </div>
	<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col">Address</th>
      <th scope="col">Postal</th>
      <th scope="col">State</th>
      <th scope="col">Options</th>
    </tr>
  </thead>
  <tbody>
  <% 
  	DB db = new DB();
  	Connection con = db.getConnection();
  	String query = "Select * from teacher";
	PreparedStatement pst = con.prepareStatement(query);
	ResultSet rs = pst.executeQuery();
	
	while(rs.next()){
		%>
		<tr>
		<th scope="row"><%= rs.getInt("id") %></th>
		<td><%=rs.getString("name")%></td>
		<td><%=rs.getString("address")%></td>
		<td><%=rs.getString("state")%></td>
		<td><%=rs.getString("postal_code")%></td>
		<td><a class="btn btn-success" href="updateTeacher.jsp?id=<%=rs.getInt("id") %>" role="button">Edit</a><a class="btn btn-danger" href="removeTeacher.jsp?id=<%=rs.getInt("id") %>" role="button">Remove</a></td>
		</tr>
	<% }%>	
	

 
  </tbody>
</table>

</body>
</html>