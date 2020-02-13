<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Database.DB" %>

<%

try{
	String  str = request.getParameter("id");
	if(str==null){
		response.sendRedirect("index.jsp");
		return;
	}else{
		int id = Integer.parseInt(str);
		DB db = new DB();
	 	Connection con = db.getConnection();
	 	String query = "delete from student where student_id = "+id;
		PreparedStatement pst = con.prepareStatement(query);
		pst.executeUpdate();
		
	}
	
	} catch(Exception ex){
		ex.printStackTrace();
	}
	response.sendRedirect("listStudent.jsp");

%>


