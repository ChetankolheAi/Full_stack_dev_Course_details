<%@page import="student.Utility"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>course_main</title>
<link  rel="stylesheet" href="style2.css">

</head>
<body>
    <div class="container">
        <h2>Course List</h2>
        <form name="frmCourse" action="course_add.jsp" method="get">  
            <table class="course-table">
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Course Fees</th>
                    <th>View</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <% 
                try {
                    String strQuery = "SELECT * FROM course;";
                    Connection con = Utility.getMySQLConnection();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery(strQuery);
                    int course_id;
                    String course_name;
                    int course_fees;
                    while(rs.next()) {
                        course_id = rs.getInt(1);
                        course_name = rs.getString(2);
                        course_fees = rs.getInt(3);
                %>
                <tr>
                    <td><%=course_id %></td>
                    <td><%=course_name %></td>
                    <td><%=course_fees %></td>
                    <td><a class="action-btn view-btn" href="course_View.jsp?course_id=<%=course_id %>">View</a></td>
                    <td><a class="action-btn edit-btn" href="course_edit.jsp?course_id=<%=course_id %>">Edit</a></td>
                    <td><a class="action-btn delete-btn" href="course_delete.jsp?course_id=<%=course_id %>">Delete</a></td>
                </tr>
                <% 
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                }
                %>
            </table>
            <div class="button-group">
                <input type="submit" class="btn" name="AddNew" value="Add New Course">
                <a class="btn back-btn" href="Home.html">Back</a>
            </div>
        </form>
    </div>
</body>
</html>