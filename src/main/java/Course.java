import java.time.LocalDate;

public class Course {
	private int courseId;		//corresponds to course_id (primary key, auto increments) 
	private String courseName; 	//corresponds to name
	private String instructor; 	//corresponds to instructor
	private LocalDate start_date;
	private LocalDate end_date;
	
	//Constructor
	public Course(int courseId, String courseName, String instructor, LocalDate start_date, LocalDate end_date) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.instructor = instructor;
		this.start_date = start_date;
		this.end_date = end_date;
	}

	//default constructor
	public Course() {}

	//getters and setters
	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public LocalDate getStart_date() {
		return start_date;
	}

	public void setStart_date(LocalDate start_date) {
		this.start_date = start_date;
	}

	public LocalDate getEnd_date() {
		return end_date;
	}

	public void setEnd_date(LocalDate end_date) {
		this.end_date = end_date;
	}

	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", courseName=" + courseName + ", instructor=" + instructor
				+ ", start_date=" + start_date + ", end_date=" + end_date + "]";
	}
	
	
	
   
}
