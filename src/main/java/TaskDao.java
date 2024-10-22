import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TaskDao {
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

	// Insert Task and associate it with user_id in performs table
	public String insert(Task task, String userId) {
			loadDriver(dbdriver);
			Connection con = getConnection();
			String result = "Task entered successfully";
			String taskInsertSql = "INSERT INTO task (task_name, description, due_date, priority, status, type) VALUES (?, ?, ?, ?, ?, ?)";
			String performInsertSql = "INSERT INTO performs (user_id, task_id) VALUES (?, ?)";
			
			try {
					// Insert task and retrieve generated task_id
					PreparedStatement psTask = con.prepareStatement(taskInsertSql, PreparedStatement.RETURN_GENERATED_KEYS);
					psTask.setString(1, task.getTaskName());
					psTask.setString(2, task.getDescription());
					psTask.setDate(3, java.sql.Date.valueOf(task.getDueDate()));
					psTask.setString(4, task.getPriority());
					psTask.setString(5, task.getStatus());
					psTask.setString(6, task.getType());
					
					int affectedRows = psTask.executeUpdate();

					if (affectedRows == 0) {
							throw new SQLException("Inserting task failed, no rows affected.");
					}
					
					// Get the generated task_id
					ResultSet generatedKeys = psTask.getGeneratedKeys();
					if (generatedKeys.next()) {
							int taskId = generatedKeys.getInt(1);

							// Insert into perform table (user_id and task_id)
							PreparedStatement psPerform = con.prepareStatement(performInsertSql);
							psPerform.setString(1, userId); // Set user_id
							psPerform.setInt(2, taskId);    // Set task_id
							psPerform.executeUpdate();
					} else {
							throw new SQLException("Inserting task failed, no ID obtained.");
					}
			} catch (SQLException e) {
					e.printStackTrace();
					result = "Task not entered";
			}
			
			return result;
	}

	// Method to retrieve all tasks associated with a user_id
	public List<Task> getTasksByUserId(String userId) {
			loadDriver(dbdriver);
			Connection con = getConnection();
			List<Task> taskList = new ArrayList<>();
			
			String sql = "SELECT t.task_id, t.task_name, t.description, t.due_date, t.priority, t.status, t.type " +
										"FROM task t " +
										"JOIN performs p ON t.task_id = p.task_id " +
										"WHERE p.user_id = ?";
			
			try {
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, userId);
					ResultSet rs = ps.executeQuery();
					
					while (rs.next()) {
							Task task = new Task();
							task.setTaskId(rs.getInt("task_id"));
							task.setTaskName(rs.getString("task_name"));
							task.setDescription(rs.getString("description"));
							task.setDueDate(rs.getDate("due_date").toLocalDate());
							task.setPriority(rs.getString("priority"));
							task.setStatus(rs.getString("status"));
							task.setType(rs.getString("type"));
							
							taskList.add(task);
					}
			} catch (SQLException e) {
					e.printStackTrace();
			}
			
			return taskList;
	}

}
