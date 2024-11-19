

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UViewCourse
 */
@WebServlet("/UViewCourse")
public class UViewCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UViewCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve user_id from session
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("username");
        
        // If user is not logged in, redirect to login page
        if (userId == null || userId.isEmpty()) {
            response.sendRedirect("loginPage.jsp");
            return;
        }

        // Call CourseDao to retrieve courses for the given user_id
        CourseDao courseDao = new CourseDao();
        
        List<Course> courses = courseDao.getCourseByUserId(userId);
        
        // Set the courses in the request scope to be accessible in the JSP
        request.setAttribute("courseList", courses);
        
        // Forward to the JSP page that will display the courses
        request.getRequestDispatcher("myCourses.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}