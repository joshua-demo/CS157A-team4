import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TaskServlet
 */
@WebServlet("/TaskServlet")
public class TaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Hardcoded user information (for demonstration purposes)
        String hardcodedUser = "user123";  // Hardcoded username

        // Get task information from request parameters
        String taskTitle = request.getParameter("taskTitle");
        String taskDescription = request.getParameter("taskDescription");

        // Create a Task object with the hardcoded user and task details
        Task task = new Task(taskTitle, taskDescription, hardcodedUser);

        // Insert the task into the database using TaskDao
        TaskDao taskDao = new TaskDao();
        String result = taskDao.addTask(task);

        // Send the result back to the client
        response.getWriter().print(result);
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
}
