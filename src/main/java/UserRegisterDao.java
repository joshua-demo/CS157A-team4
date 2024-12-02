import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRegisterDao {
	private String dburl= dbConnectorInfo.dburl();
	private String dbuname= dbConnectorInfo.dbuname();
	private String dbpassword= dbConnectorInfo.dbpassword(); //Remember to put your own password
	private String dbdriver= dbConnectorInfo.dbdriver();
	
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
			ps.setString(1, user.getuser_id());  
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getName());
			ps.setString(4, user.getPassword());
			ps.setString(5, user.getProfile_date_created());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result="data not entered";
		} finally {
	        try {
	            if (con != null) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
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
	public User getUser(String username, String password) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        User user = null;
        String query = "SELECT * FROM user WHERE user_id = ? AND password = ?";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            // Set the username and password parameters in the query
            stmt.setString(1, username);
            stmt.setString(2, password);  // Check the password as well

            // Execute the query
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // Retrieve user details from the result set
                String email = rs.getString("email");
                String name = rs.getString("name");
                // Create a User object with the data retrieved from the database
                user = new User(username, email, name, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
