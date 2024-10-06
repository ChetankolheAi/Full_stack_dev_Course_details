<%@page import="student.Utility"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course View</title>
<link  rel="stylesheet" href="style_course_view.css">

</head>
<body>
    <div class="container">
        <table>
            <tr>
                <td><h1>View Course</h1></td>
            </tr>
        </table>
        <table class="view-course-table"> 
            <% 
            try {
                int course_id = Integer.parseInt(request.getParameter("course_id"));
                String strQuery = "Select * from course where course_id = " + course_id + ";";
                Connection con = Utility.getMySQLConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(strQuery);
                while(rs.next()) {
                    course_id = rs.getInt(1);
                    String course_name = rs.getString(2);
                    int course_fees = rs.getInt(3);
            %>
            <tr>
                <td>Course Id</td>
                <td><input class="large-text" type="text" name="course_id" id="course_id" value="<%=course_id%>" readonly></td>
            </tr>
            <tr>
                <td>Course Name</td>
                <td><input class="large-text" type="text" name="course_name" id="course_name" value="<%=course_name%>" readonly></td>
            </tr>
            <tr>
                <td>Course Fees</td>
                <td><input class="large-text" type="text" name="course_fees" id="course_fees" value="<%=course_fees%>" readonly></td>
            </tr>
            <% 
                } 
            } catch(Exception e) {
                e.printStackTrace();
            }
            %>
        </table>
        <div class="button-group">
            <a class="action-btn" href="course_main.jsp">Back</a>
        </div>
    </div>
</body>


</html>