public class Task {
  private int task_id; // Auto-incremented task ID
  private String task_name; // Name of the task
  private String description; // Task description
  private String due_date; // Due date in yyyy-MM-dd format
  private String priority; // Enum: Low, Medium, High
  private String status; // Enum: Pending, Completed, Overdue
  private String type; // Type of the task (varchar)

  // Constructor
  public Task(String task_name, String description, String due_date, String priority, String status, String type) {
      this.task_name = task_name;
      this.description = description;
      this.due_date = due_date;
      this.priority = priority;
      this.status = status;
      this.type = type;
  }

  // Getters and Setters
  public int getTask_id() {
      return task_id;
  }

  public void setTask_id(int task_id) {
      this.task_id = task_id;
  }

  public String getTask_name() {
      return task_name;
  }

  public void setTask_name(String task_name) {
      this.task_name = task_name;
  }

  public String getDescription() {
      return description;
  }

  public void setDescription(String description) {
      this.description = description;
  }

  public String getDue_date() {
      return due_date;
  }

  public void setDue_date(String due_date) {
      this.due_date = due_date;
  }

  public String getPriority() {
      return priority;
  }

  public void setPriority(String priority) {
      this.priority = priority;
  }

  public String getStatus() {
      return status;
  }

  public void setStatus(String status) {
      this.status = status;
  }

  public String getType() {
      return type;
  }

  public void setType(String type) {
      this.type = type;
  }
}
