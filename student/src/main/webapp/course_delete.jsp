<%@page import="java.sql.PreparedStatement"%>
<%@page import="student.Utility"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Course</title>
</head>
<body>
<% 
	int course_id;
	String course_name;
	int course_fees;
	
	course_id = Integer.parseInt(request.getParameter("course_id"));
	
	try {
		String strQuery = "delete from course where course_id = " + course_id + ";";
		Connection con = Utility.getMySQLConnection();
		
		PreparedStatement pstmt = 
				 con.prepareStatement(strQuery);
		int result = pstmt.executeUpdate();
		if(result > 0)
		{
			pstmt.close();
			con.close();
			response.sendRedirect("course_main.jsp");
		}	 
	} catch(Exception e)
	{
		e.printStackTrace();
	}
	
	
%>
</body>
</html>