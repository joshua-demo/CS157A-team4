import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.studysmart.User;

/**
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve new values from the form
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPass = request.getParameter("passwordConfirm");
        String newEmail = request.getParameter("email");
        UpdateProfileDao updateDao = new UpdateProfileDao();
        
        // Assume you have a method to update the user in the database
        User user = updateDao.getUserFromSession(request); // Implement this method to retrieve user
        User updatedUser = user;
        if(username !=null) {
        	if( username.length()>3) {
        		updatedUser.setName(username);
        	}else {
        		response.sendRedirect("editProfile.jsp?error=1");
        		return;
        	}
        }
        else {
        	updatedUser.setName(user.getName());
        }
        
        if(password!=null) {
        	if(password.equals(confirmPass)) {
        		updatedUser.setPassword(password);
        	}
        	else {
        		response.sendRedirect("editProfile.jsp?error=2");
        		return;
        	}
        }
        else {
        	updatedUser.setPassword(user.getPassword());
        }
        if(newEmail != null) {
        	updatedUser.setEmail(newEmail);
        }
        
        // Update the database
        updateDao.updateUserInDatabase(user,updatedUser); // Implement this method to perform the DB update

        // Optionally update session attributes
        HttpSession session = request.getSession();
        session.setAttribute("username", updatedUser.getName());
        session.setAttribute("user", updatedUser);

        // Redirect to profile page or show success message
        response.sendRedirect("myProfile.jsp?success=1");
	}


}
