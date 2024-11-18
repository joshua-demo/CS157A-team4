public class Resource {
  private int id;
  private int taskId;
  private String url;
  
  // Default constructor
  public Resource() {}
  
  // Constructor with parameters
  public Resource(int id, int taskId, String url) {
      this.id = id;
      this.taskId = taskId;
      this.url = url;
  }
  
  // Getters and Setters
  public int getId() {
      return id;
  }
  
  public void setId(int id) {
      this.id = id;
  }
  
  public int getTaskId() {
      return taskId;
  }
  
  public void setTaskId(int taskId) {
      this.taskId = taskId;
  }
  
  public String getUrl() {
      return url;
  }
  
  public void setUrl(String url) {
      this.url = url;
  }
}