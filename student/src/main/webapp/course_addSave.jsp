<%@page import="java.sql.Connection"%>
<%@page import="student.Utility"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CourseAddSave</title>
</head>
<body>
<% 
	int course_id;
	String course_name;
	int course_fees;
	
	course_id = Integer.parseInt(request.getParameter("course_id"));
	course_name = request.getParameter("course_name");
	course_fees= Integer.parseInt(request.getParameter("course_fees")); 
	
	try {
		String strQuery = "INSERT INTO course VALUES (?,?,?);";
		Connection con = Utility.getMySQLConnection();
		
		PreparedStatement pstmt = 
				 con.prepareStatement(strQuery);
		pstmt.setInt(1,course_id);
		pstmt.setString(2,course_name);
		pstmt.setInt(3,course_fees);
		
		int result = pstmt.executeUpdate();
		if(result > 0)
		{
			response.sendRedirect("course_main.jsp");
		}	 
	} catch(Exception e)
	{
		e.printStackTrace();
	}
	
%>
</body>
</html>