import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UViewTask")
public class UViewTask extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UViewTask() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user_id from session
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("username"); // Assuming 'username' corresponds to user_id
        
        // If user is not logged in, redirect to login page
        if (userId == null || userId.isEmpty()) {
            response.sendRedirect("loginPage.jsp");
            return;
        }

        // Call TaskDao to retrieve tasks for the given user_id
        TaskDao taskDao = new TaskDao();
        List<Task> tasks = taskDao.getTasksByUserId(userId);
        
        // Set the tasks in the request scope to be accessible in the JSP
        request.setAttribute("taskList", tasks);
        
        // Forward to the JSP page that will display the tasks
        request.getRequestDispatcher("myTask.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST requests if needed, otherwise redirect to doGet
        doGet(request, response);
    }
}
