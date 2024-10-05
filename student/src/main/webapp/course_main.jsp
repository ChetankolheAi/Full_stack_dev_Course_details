<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="student.Utility" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Management</title>
    <link rel="stylesheet" href="style2.css">
</head>
<body>
    <div class="container">
        <form name="formcourse" action="course_add.jsp" method="get">
            <h2>Course List</h2>
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
                Connection con = null;
                try {
                    String strQuery = "SELECT * FROM course";
                    con = Utility.getMySQLConnection();

                    if (con == null) {
                        out.println("<tr><td colspan='6'>Error: Unable to connect to the database.</td></tr>");
                    } else {
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery(strQuery);

                        if (!rs.isBeforeFirst()) {
                            out.println("<tr><td colspan='6'>No data found in the course table.</td></tr>");
                        }

                        int course_id;
                        String course_name;
                        int course_fees;

                        while (rs.next()) {
                            course_id = rs.getInt(1);
                            course_name = rs.getString(2);
                            course_fees = rs.getInt(3);
                %>
                <tr>
                    <td><%=course_id %></td>
                    <td><%=course_name %></td>
                    <td><%=course_fees %></td>
                    <td><a href="course_view.jsp" class="action-btn view-btn">View</a></td>
                    <td><a href="course_edit.jsp" class="action-btn edit-btn">Edit</a></td>
                    <td><a href="course_delete.jsp" class="action-btn delete-btn">Delete</a></td>
                </tr>
                <%
                        }
                        rs.close();
                        stmt.close();
                    }
                } catch (SQLException e) {
                    out.println("<tr><td colspan='6'>SQL Error: " + e.getMessage() + "</td></tr>");
                } catch (Exception e) {
                    out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (con != null) {
                        try {
                            con.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
                %>
            </table>

            <div class="button-group">
                <input type="submit" name="Addnew" value="Add New Course" class="btn">
                <a href="Home.html" class="btn back-btn">Back</a>
            </div>
        </form>
    </div>
</body>
</html>
