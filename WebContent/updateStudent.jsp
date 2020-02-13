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

<html>
    <head>    
        <title>Faculty Registration Form</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        </head>
        
    <%
    String msg = "";
    String color = "";
   		if(request.getMethod().compareToIgnoreCase("post")==0)
   		{
   			try
   			{
   				String str = request.getParameter("id");
   				if(str==null){
   					response.sendRedirect("index.jsp");
   					return;
   				}
   				int id = Integer.parseInt(str);
   				String name = request.getParameter("name");
   				String course = request.getParameter("course");
   				String rollno = request.getParameter("rollno");
   	   			String address = request.getParameter("address");
   	   			String state = request.getParameter("state");
   	   			String postal = request.getParameter("postal");
   	   			
   	   			DB db = new DB();
   	   			Connection conn = db.getConnection();
   	   			String query = "UPDATE `student` SET `roll_number`=?,`name`=?,`address`=?,`state`=?,`postal_code`=?,`course`=? WHERE student_id = ?";
   	   			
   	   			PreparedStatement pst = conn.prepareStatement(query);
   	   			
   	   			System.out.println(query);
   	   			
   	   			pst.setString(1, rollno);
   	   			pst.setString(2, name);
   	   			pst.setString(3, address);
   	   			pst.setString(4, state);
	   	   		pst.setString(5, postal);
		   	   	pst.setString(6, course);
   	   			pst.setInt(7, id);
   	   			
   	   			pst.executeUpdate();
   	   			
   	   			color = "green";
   	   			msg = "Faculty Updated Succesfully";
   	   			
   	   			
   			}catch(Exception ex){
   				ex.printStackTrace();
   				color = "red";
   				msg = "Error Occured";
   			}
   		}
   			String  str = request.getParameter("id");
   			if(str==null){
   				response.sendRedirect("index.jsp");
   				return;
   			}
   			int id = Integer.parseInt(str);
   			DB db = new DB();
   		  	Connection con = db.getConnection();
   		  	String query = "Select * from student where student_id = ?";
   			PreparedStatement pst = con.prepareStatement(query);
   			pst.setInt(1, id);
   			ResultSet rs = pst.executeQuery();
   			
   			if(!rs.next()){
   				response.sendRedirect("index.jsp");
   			}
   		
    %>    
    
    <body>
    <div class="form-group col-12 p-0">
		<h4 style="color:<%= color %>"><%= msg %></h4>
	</div>
        <form id="form" method="post" action="updateStudent.jsp" class="form-horizontal">
         	
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4">
                    <h2 style="text-align: center">Update Student Details</h2>
                </div>
            </div>
            <hr/>
            <input type="hidden" value="<%=rs.getInt("student_id") %>" name="id" hidden="true" class="form-control" id="id">
            <div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                  	<label for="usr">Name:</label>
  					<input type="text"  name="name" class="form-control" id="name" value="<%=rs.getString("name")%>">
                  </div>
			</div>
			<div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                  	<label for="usr">Roll No:</label>
  					<input type="text"  name="rollno" class="form-control" id="name" value="<%=rs.getString("roll_number")%>">
                  </div>
			</div>
			<div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                  	<label for="usr">Name:</label>
  					<input type="text"  name="course" class="form-control" id="name" value="<%=rs.getString("course")%>">
                  </div>
			</div>
			
			
			<div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                  	<label for="address">Address:</label>
  					<input type="text" value="<%=rs.getString("address")%>" name="address" class="form-control" id="address">
                  </div>
			</div>
			<div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                  	<label for="postal">Postal:</label>
  					<input type="text" name="postal"  value="<%=rs.getString("postal_code")%>" class="form-control" id="postal">
                  </div>
			</div>
			<div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                  	<label for="state">State:</label>
  					<input name="state" value="<%=rs.getString("state")%>" class="form-control" id="state">
                  </div>
			</div>
           
            <br/>
            
            <div class="form-group">
                <div class="col-sm-4"></div>
                <div class="col-sm-6">
                    <div class="col-sm-2">
                        <Button class="btn btn-success" style="width: 80px;">Submit</Button>
                    </div>
                    <div class="col-sm-4">
                    </div>
                    
                </div>
            </div>
            
        </form>
        <div class="col-sm-2">
                        <a href="index.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
                    </div>
    </body>
</html>