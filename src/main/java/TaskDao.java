import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TaskDao {
    private String dburl = "jdbc:mysql://localhost:3306/studysmart";
    private String dbuname = "root";
    private String dbpassword = "#Ben01226723853"; // Remember to use your own password
    private String dbdriver = "com.mysql.jdbc.Driver";

    // Load the database driver
    public void loadDriver(String dbdriver) {
        try {
            Class.forName(dbdriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Establish connection to the database
    public Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    // Insert a new task into the database
    public String insert(Task task) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String result = "Task added successfully";
        String sql = "INSERT INTO task (task_name, description, due_date, priority, status, type) VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, task.getTask_name());
            ps.setString(2, task.getDescription());
            ps.setString(3, task.getDue_date());
            ps.setString(4, task.getPriority());
            ps.setString(5, task.getStatus());
            ps.setString(6, task.getType());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            result = "Task could not be added";
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

    // Optional method for other operations, such as updating tasks or viewing tasks
    // For example, a method to retrieve tasks for a particular user can be added here.
}
