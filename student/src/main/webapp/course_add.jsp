<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Course</title>
<link  rel="stylesheet" href="style.css">

</head>
<body>
<form name="frmaddcourse" action="course_addSave.jsp" method="post">
<table>
	<tr>
	
	<td class="heading"> ADD NEW COURSE</td>
	</tr>

</table>
	<table >
		<tr>
		<td>Course Id</td>
		<td><input type="text" name="course_id" id="Course_id" placeholder="Course_id" required></td>
		</tr>
		
		<tr>
		<td>Course name</td>
		<td><input type="text" name="course_name" id="Course_name" placeholder="Course_name" required></td>
		</tr>
		
		
		<tr>
		<td>Course fees</td>
		<td><input type="text" name="course_fees" id="Course_fees" placeholder="Course_fees" required></td>
		</tr>
		
		
	
	
	</table>
	
	<table>
	<tr>
	
		<td> <input type="submit" value="Savecourse"></td>
		<td> <input type="reset" value="Reset"></td>
		<td class="bck"><a href="course_main.jsp">Back</a></td>		
		
	</tr>
	
	
	</table>



</form>


</body>
</html> 