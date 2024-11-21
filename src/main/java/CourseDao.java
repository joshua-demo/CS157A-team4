import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseDao {
	
	private String dburl="jdbc:mysql://localhost:3306/studysmart";
	private String dbuname="root";
	private String dbpassword="#Ben01226723853"; //Remember to put your own password
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
	  
	  public String insert(Course course, String userId) {
		  	loadDriver(dbdriver);
			Connection con = getConnection();
			String result = "Course entered successfully";
			String courseInsertSql = "INSERT INTO course (name, instructor, start_date, end_date) VALUES (?, ?, ?, ?)";
			String enrolledInsertSql = "INSERT INTO enrolled (user_id, course_id) VALUES (?, ?)";
			
			try {
				// Insert course and retrieve generated course_id
				PreparedStatement psCourse = con.prepareStatement(courseInsertSql, PreparedStatement.RETURN_GENERATED_KEYS);
				psCourse.setString(1, course.getCourseName());
				psCourse.setString(2, course.getInstructor());
				psCourse.setDate(3, java.sql.Date.valueOf(course.getStart_date()));
				psCourse.setDate(4, java.sql.Date.valueOf(course.getEnd_date()));
				
				int affectedRows = psCourse.executeUpdate();

				if (affectedRows == 0) {
						throw new SQLException("Inserting course failed, no rows affected.");
				}
				
				// Get the generated course_id
				ResultSet generatedKeys = psCourse.getGeneratedKeys();
				if (generatedKeys.next()) {
						int courseId = generatedKeys.getInt(1);

						// Insert into enrolled table (user_id and course_id)
						PreparedStatement psEnrolled = con.prepareStatement(enrolledInsertSql);
						psEnrolled.setString(1, userId); // Set user_id
						psEnrolled.setInt(2, courseId);    // Set course_id
						psEnrolled.executeUpdate();
				} else {
						throw new SQLException("Inserting course failed, no ID obtained.");
				}
			} catch (SQLException e) {
					e.printStackTrace();
					result = "course not entered";
			}
			
			return result;
	  }
	  
	public String deleteCourseById(int course_id, String userId) throws SQLException {
		loadDriver(dbdriver);
		Connection con = getConnection();
		String result = "Course deleted sucessfully";
		
		try {
			String coursesSql = "DELETE FROM course WHERE course_id = ?";
			String enrolledSql = "DELETE FROM enrolled WHERE course_id = ? AND user_id = ?";
			PreparedStatement ps = con.prepareStatement(coursesSql);
			PreparedStatement ps1 = con.prepareStatement(enrolledSql);
			ps.setInt(1, course_id);
			ps1.setInt(1, course_id);
			ps1.setString(2, userId);
			
			con.setAutoCommit(false); // Start transaction
		    ps1.executeUpdate(); // Delete from enrolled
		    ps.executeUpdate(); // Delete from courses
		    con.commit(); // Commit transaction
		}
		catch (Exception e) {
			con.rollback(); //revert if someting goes wrong
			e.printStackTrace();
		}
		return result;
	}
	  
	// Method to retrieve all courses enrolled by a user_id
	public List<Course> getCourseByUserId(String userId) {
			loadDriver(dbdriver);
			Connection con = getConnection();
			List<Course> courseList = new ArrayList<>();
			
			String sql = "SELECT c.course_id, c.name, c.instructor, c.start_date, c.end_date " +
										"FROM course c " +
										"JOIN enrolled e ON c.course_id = e.course_id " +
										"WHERE e.user_id = ?";
			
			try {
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, userId);
					ResultSet rs = ps.executeQuery();
					
					while (rs.next()) {
							Course course = new Course();
							course.setCourseId(rs.getInt("course_id"));
							course.setCourseName(rs.getString("name"));
							course.setInstructor(rs.getString("instructor"));
							course.setStart_date(rs.getDate("start_date").toLocalDate());
							course.setEnd_date(rs.getDate("end_date").toLocalDate());
							
							courseList.add(course);
					}
			} catch (SQLException e) {
					e.printStackTrace();
			}
			
			return courseList;
	}
}
