<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="student.Utility"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Course</title>
    <link  rel="stylesheet" href="style_course_edit.css">
    
    <style>
        /* Include the CSS styles provided above here */
    </style>
</head>
<body>
    <div class="container">
        <form name="frmEditCourse" action="Course_EditSave.jsp" method="get">
            <h1>Edit Course</h1>
            <table>
                <% 
                try {
                    int course_id = Integer.parseInt(request.getParameter("course_id"));
                    String strQuery = "Select * from course where course_id = " + course_id + ";";
                    Connection con = Utility.getMySQLConnection();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery(strQuery);
                    
                    String course_name;
                    int course_fees;
                    while(rs.next()) {
                        course_id = rs.getInt(1);
                        course_name = rs.getString(2);
                        course_fees = rs.getInt(3);
                %>
                <tr>
                    <td>Course Id</td>
                    <td><input type="text" name="course_id" id="course_id" value="<%=course_id%>" readonly></td>
                </tr>
                <tr>
                    <td>Course Name</td>
                    <td><input type="text" name="course_name" id="course_name" value="<%=course_name%>"></td>
                </tr>
                <tr>
                    <td>Course Fees</td>
                    <td><input type="text" name="course_fees" id="course_fees" value="<%=course_fees%>"></td>
                </tr>
                <% 
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                }
                %>
            </table>
            <table>
                <tr>
                    <td><input type="submit" class="action-btn" value="Save Course"></td>
                    <td><input type="reset" class="reset-btn" value="Reset"></td>
                    <td><a href="course_main.jsp" class="back-link">Back</a></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
