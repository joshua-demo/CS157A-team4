import java.time.LocalDate;

public class Task {
    private int taskId;               // Corresponds to task_id (Primary Key, Auto Increment)
    private String taskName;           // Corresponds to task_name
    private String description;        // Corresponds to description
    private LocalDate dueDate;         // Corresponds to due_date
    private String priority;           // Corresponds to priority (enum: 'Low', 'Medium', 'High')
    private String status;             // Corresponds to status (enum: 'Pending', 'Completed', 'Overdue')
    private String type;               // Corresponds to type

    // Constructor
    public Task(int taskId, String taskName, String description, LocalDate dueDate, String priority, String status, String type) {
        this.taskId = taskId;
        this.taskName = taskName;
        this.description = description;
        this.dueDate = dueDate;
        this.priority = priority;
        this.status = status;
        this.type = type;
    }

    // Default constructor
    public Task() {}

    // Getters and Setters
    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDate getDueDate() {
        return dueDate;
    }

    public void setDueDate(LocalDate dueDate) {
        this.dueDate = dueDate;
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

    @Override
    public String toString() {
        return "Task [taskId=" + taskId + ", taskName=" + taskName + ", description=" + description + 
               ", dueDate=" + dueDate + ", priority=" + priority + ", status=" + status + ", type=" + type + "]";
    }
}
