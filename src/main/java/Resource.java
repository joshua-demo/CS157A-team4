public class Resource {
  private int id;
  private int taskId;
  private String url;
  private String displayText;
  
  
  // Default constructor
  public Resource() {}
  
  // Constructor with parameters
  public Resource(int id, int taskId, String url, String displayText) {
      this.id = id;
      this.taskId = taskId;
      this.url = url;
      this.displayText = displayText;
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
  
  public String getDisplayText() {
      return displayText != null ? displayText : url;  // Fallback to URL if displayText is null
  }
  
  public void setDisplayText(String displayText) {
      this.displayText = displayText;
  }
}