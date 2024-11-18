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

	public Task getTaskById(int taskId, String userId) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "SELECT t.task_id, t.task_name, t.description, t.due_date, " +
								"t.priority, t.status, t.type, t.quick_note, t.progress " +
								"FROM task t " +
								"JOIN performs p ON t.task_id = p.task_id " +
								"WHERE p.user_id = ? AND t.task_id = ?";
		try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, userId);
				ps.setInt(2, taskId);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
						Task task = new Task();
						task.setTaskId(rs.getInt("task_id"));
						task.setTaskName(rs.getString("task_name"));
						task.setDescription(rs.getString("description"));
						task.setDueDate(rs.getDate("due_date").toLocalDate());
						task.setPriority(rs.getString("priority"));
						task.setStatus(rs.getString("status"));
						task.setType(rs.getString("type"));
						task.setQuickNote(rs.getString("quick_note"));
						task.setProgress(rs.getInt("progress"));
						
						// Get resources for this task
						task.setResources(getResourcesForTask(taskId, con));

						return task;
				}
		} catch (SQLException e) {
				e.printStackTrace();
		} finally {
				try {
						if (con != null) con.close();
				} catch (SQLException e) {
						e.printStackTrace();
				}
		}
		return null;
	}

	// Method to update a task by task_id
	public boolean updateTask(Task task, String userId) {
		// Implement update task with user verification
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "UPDATE task t " +
									"JOIN performs p ON t.task_id = p.task_id " +
									"SET t.task_name = ?, t.description = ?, t.due_date = ?, t.priority = ?, t.status = ?, t.type = ? " +
									"WHERE p.user_id = ? AND t.task_id = ?";
		try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, task.getTaskName());
				ps.setString(2, task.getDescription());
				ps.setDate(3, java.sql.Date.valueOf(task.getDueDate()));
				ps.setString(4, task.getPriority());
				ps.setString(5, task.getStatus());
				ps.setString(6, task.getType());
				ps.setString(7, userId);
				ps.setInt(8, task.getTaskId());

				int rowsUpdated = ps.executeUpdate();
				return rowsUpdated > 0;
		} catch (SQLException e) {
				e.printStackTrace();
		}
		return false;
	}

	// Method to delete a task by task_id
	public boolean deleteTask(int taskId, String userId) {
    loadDriver(dbdriver);
    Connection con = getConnection();
    
    // Delete from performs table first (to handle foreign key constraints)
    String deletePerformsSql = "DELETE FROM performs WHERE user_id = ? AND task_id = ?";
    // Then delete from task table
    String deleteTaskSql = "DELETE FROM task WHERE task_id = ?";
    
    try {
        // First delete from performs table
        PreparedStatement psPerform = con.prepareStatement(deletePerformsSql);
        psPerform.setString(1, userId);
        psPerform.setInt(2, taskId);
        psPerform.executeUpdate();
        
        // Then delete from task table
        PreparedStatement psTask = con.prepareStatement(deleteTaskSql);
        psTask.setInt(1, taskId);
        int rowsDeleted = psTask.executeUpdate();
        
        return rowsDeleted > 0;
        
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
    return false;
	}

	// Add method to update notes
	public boolean updateTaskNotes(int taskId, String userId, String notes) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "UPDATE task t " +
								"JOIN performs p ON t.task_id = p.task_id " +
								"SET t.quick_note = ? " +
								"WHERE p.user_id = ? AND t.task_id = ?";
		try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, notes);
				ps.setString(2, userId);
				ps.setInt(3, taskId);

				int rowsUpdated = ps.executeUpdate();
				return rowsUpdated > 0;
		} catch (SQLException e) {
				e.printStackTrace();
		}
		return false;
	}

	// Add method to update progress
	public boolean updateTaskProgress(int taskId, String userId, int progress) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "UPDATE task t " +
								"JOIN performs p ON t.task_id = p.task_id " +
								"SET t.progress = ? " +
								"WHERE p.user_id = ? AND t.task_id = ?";
		try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, progress);
				ps.setString(2, userId);
				ps.setInt(3, taskId);

				int rowsUpdated = ps.executeUpdate();
				return rowsUpdated > 0;
		} catch (SQLException e) {
				e.printStackTrace();
		}
		return false;
	}

	// Method to get all resources for a task
	private List<Resource> getResourcesForTask(int taskId, Connection con) {
		List<Resource> resources = new ArrayList<>();
		String sql = "SELECT id, task_id, url FROM resource WHERE task_id = ?";
		
		try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, taskId);
				ResultSet rs = ps.executeQuery();
				
				while (rs.next()) {
						Resource resource = new Resource();
						resource.setId(rs.getInt("id"));
						resource.setTaskId(rs.getInt("task_id"));
						resource.setUrl(rs.getString("url"));
						resources.add(resource);
				}
		} catch (SQLException e) {
				e.printStackTrace();
		}
		return resources;
	}

	// Method to add a new resource
	public boolean addResource(int taskId, String url) {
		loadDriver(dbdriver);
		Connection con = getConnection();
		
		String sql = "INSERT INTO resource (task_id, url) VALUES (?, ?)";
		try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, taskId);
				ps.setString(2, url);
				
				int rowsAffected = ps.executeUpdate();
				return rowsAffected > 0;
		} catch (SQLException e) {
				e.printStackTrace();
		} finally {
				try {
						if (con != null) con.close();
				} catch (SQLException e) {
						e.printStackTrace();
				}
		}
		return false;
	}

	// Method to delete a resource
	public boolean deleteResource(int resourceId, String userId) {
			loadDriver(dbdriver);
			Connection con = getConnection();
			
			// First verify the resource belongs to a task owned by this user
			String sql = "DELETE r FROM resource r " +
									"INNER JOIN task t ON r.task_id = t.task_id " +
									"INNER JOIN performs p ON t.task_id = p.task_id " +
									"WHERE r.id = ? AND p.user_id = ?";
			try {
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setInt(1, resourceId);
					ps.setString(2, userId);
					
					int rowsAffected = ps.executeUpdate();
					return rowsAffected > 0;
			} catch (SQLException e) {
					e.printStackTrace();
			} finally {
					try {
							if (con != null) con.close();
					} catch (SQLException e) {
							e.printStackTrace();
					}
			}
			return false;
	}

}