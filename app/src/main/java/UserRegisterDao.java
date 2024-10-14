import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserRegisterDao {
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
		Connection con=null;
		try{
			con=DriverManager.getConnection(dburl, dbuname, dbpassword);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return con;
	}
	public String insert(User user){
		loadDriver(dbdriver);
		Connection con=getConnection();
		String result="data entered successfully";
		String sql="insert into user values(?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			//ps.setString(1, user.getuser_id()); //may change to setString later?
			ps.setString(1, user.getuser_id());  //temp
			ps.setString(2, user.getName());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getPassword());
			ps.setString(5, user.getProfile_date_created());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result="data not entered";
		}
		return result;
	}
}
