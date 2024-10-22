import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRegisterDao {
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

	// Validate user login
    public boolean validateUser(String username, String password) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        boolean isValid = false;
        String sql = "SELECT * FROM user WHERE user_id = ? AND password = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            isValid = rs.next(); // Returns true if a record exists
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isValid;
    }
}
