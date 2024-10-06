<%@page import="java.sql.PreparedStatement"%>
<%@page import="student.Utility"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		String strQuery = "update course set course_name=? , course_fees=? where course_id=?;";
		Connection con = Utility.getMySQLConnection();
		
		PreparedStatement pstmt = 
				 con.prepareStatement(strQuery);
		
		pstmt.setString(1,course_name);
		pstmt.setInt(2,course_fees);
		pstmt.setInt(3,course_id);
		
		int result = pstmt.executeUpdate();
		if (result > 0) {
		    response.sendRedirect("course_main.jsp");
		} else {
		    out.println("<p>No records were updated. Please check if the course ID exists.</p>");
		}
	 
	} catch(Exception e)
	{
		e.printStackTrace();
	}
	
%>
</body>
</html>