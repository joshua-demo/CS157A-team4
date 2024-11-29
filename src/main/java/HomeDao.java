import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HomeDao {
	private String dburl="jdbc:mysql://localhost:3306/studysmart";
	private String dbuname="root";
	private String dbpassword="$Iamroot$"; //Remember to put your own password
	private String dbdriver="com.mysql.jdbc.Driver";
	
	 public void loadDriver(String dbdriver){
			try{
				Class.forName(dbdriver);
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}
		}

	  public Connection getConnection(){
			Connection con = null;
			try{
				con=DriverManager.getConnection(dburl, dbuname, dbpassword);
			}catch(SQLException e){
				e.printStackTrace();
			}
			return con;
		}
	  
	  public HomePageStats getHomePageStats(String userId) {
		  loadDriver(dbdriver);
		  Connection con = getConnection();
		  HomePageStats currentHomePage = new HomePageStats();
		  
		  //Get number of enrolled courses 
		  String sqlEnrolled =  "SELECT COUNT(*) " + 
				  	   			"FROM enrolled "	+
				  	   			"WHERE user_id = ?";
		  
		  //Get number of tasks
		  String sqlPerforms =  "SELECT COUNT(*) " + 
				  				"FROM performs " + 
				  				"WHERE user_id = ?";
		  
		  try {
			  PreparedStatement psEnrolled = con.prepareStatement(sqlEnrolled);
			  PreparedStatement psPerforms = con.prepareStatement(sqlPerforms);
			  
			  psEnrolled.setString(1, userId);
			  psPerforms.setString(1, userId);
			  
			  ResultSet rsEnrolled = psEnrolled.executeQuery();
			  ResultSet rsPerforms = psPerforms.executeQuery();

			  currentHomePage.setName(userId);
			  if (rsEnrolled.next()) {  // Move the cursor to the first row
				    currentHomePage.setCoursesEnrolled(rsEnrolled.getInt(1));  // Get the count of enrolled courses
			  }
	
			  if (rsPerforms.next()) {  // Move the cursor to the first row
				    currentHomePage.setNumberOfTasks(rsPerforms.getInt(1));  // Get the count of tasks
			  }
			  
		  } catch (Exception e) {
			  e.getStackTrace();
		  }
		 				  
		   
		  return currentHomePage;
	  }
}
