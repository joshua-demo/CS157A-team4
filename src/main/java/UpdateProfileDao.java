import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.studysmart.User;

public class UpdateProfileDao {
	private String dburl="jdbc:mysql://localhost:3306/StudySmart";
	private String dbuname="root";
	private String dbpassword="CS157A@sjsu"; //Remember to put your own password
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
	
	public User getUserFromSession(HttpServletRequest request) {
	    HttpSession session = request.getSession(false); // Get the current session, if it exists
	    if (session != null) {
	        // Retrieve user ID and other attributes from the session
	    	User user = (User) session.getAttribute("user");
	    	String userId = user.getuser_id();
	    	String username = user.getName();
	    	String email = user.getEmail();
	    	String password = user.getPassword();

	        if (userId != null && username != null) {
	            // Create and return a User object (assuming you have a User class)
	            return new User(userId, email, username, password);
	        }
	    }
	    return null; // Return null if no user is found
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
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getName());
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
	public void updateUserInDatabase(User user, User newUser) {
		loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "SELECT * FROM user WHERE user_id = ? AND password = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getuser_id());
            ps.setString(2, user.getPassword());
            ResultSet rs = ps.executeQuery();
            String updateQuery = "UPDATE users SET username = ?, email = ?, password = ? WHERE userId = ?";

            try (PreparedStatement stmt = con.prepareStatement(updateQuery)) {
                // Set the values in the prepared statement
                stmt.setString(1, newUser.getuser_id());   // Set new username
                stmt.setString(2, newUser.getEmail());      // Set new email
                stmt.setString(3, newUser.getName());   // Set new password
                stmt.setString(4, newUser.getPassword());     // Set the userId for the user to update
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
	}
}