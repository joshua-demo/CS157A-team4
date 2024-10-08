public class User {
	
	private String user_id;
    private String name;
    private String email;
    private String password;
    private String profile_date_created;
    
    public User(String user_id, String name, String email, String password, String profile_date_created) {
        this.user_id = user_id;
    	this.name = name;
        this.email = email;
        this.password = password;
        this.profile_date_created = profile_date_created;
    }

    // Getters and Setters
    public String getuser_id(){ return user_id; }
    public void setuser_id(String user_id) { this.user_id = user_id; } 
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

	public String getProfile_date_created() { return profile_date_created; }
	public void setProfile_date_created(String profile_date_created) { this.profile_date_created = profile_date_created; }

    
    
}



