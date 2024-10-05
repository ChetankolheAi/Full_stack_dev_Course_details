package student;

import java.sql.*;

public class Utility {
	public static Connection getMySQLConnection() {
		 Connection connection = null;
		try {
            // below two lines are used for connectivity.
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student",
                "root", "1234");
            return connection;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
          return connection;
		
	}
	public static void main(String args[]) {
		  Connection connection = null;
	        try {
	            // below two lines are used for connectivity.
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            connection = DriverManager.getConnection(
	                "jdbc:mysql://localhost:3306/student",
	                "root", "1234");
	 
	            // mydb is database
	            // mydbuser is name of database
	            // mydbuser is password of database
	 
	            Statement statement;
	            statement = connection.createStatement();
	            ResultSet resultSet;
	            resultSet = statement.executeQuery(
	                "select * from course");
	            int course_id;
	            String course_name;
	            int course_fees;
	            while (resultSet.next()) {
	                course_id = resultSet.getInt(1);
	                course_name = resultSet.getString(2);
	                course_fees = resultSet.getInt(3);
	                System.out.println("\ncourse_id : " + course_id  + " \tCourse_name : " + course_name + " \tcourse_fees :" + course_fees );
	            }
	            resultSet.close();
	            statement.close();
	            connection.close();
	        }
	        catch (Exception exception) {
	            System.out.println(exception);
	        }
	    } // function ends
	} // class ends