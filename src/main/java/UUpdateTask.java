import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UUpdateTask")
public class UUpdateTask extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UUpdateTask() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String userId = (String) session.getAttribute("username");
        String taskIdStr = request.getParameter("taskId");

        try {
            Task task = new Task();
            task.setTaskId(Integer.parseInt(taskIdStr));
            task.setTaskName(request.getParameter("taskName"));
            task.setDescription(request.getParameter("description"));
            // Convert String to LocalDate
            String dueDateStr = request.getParameter("dueDate");
            if (dueDateStr != null && !dueDateStr.trim().isEmpty()) {
                task.setDueDate(LocalDate.parse(dueDateStr));
            }
            task.setPriority(request.getParameter("priority"));
            task.setStatus(request.getParameter("status"));
            task.setType(request.getParameter("type"));

            TaskDao taskDao = new TaskDao();
            boolean success = taskDao.updateTask(task, userId);
            
            if (success) {
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Task not found or unauthorized");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid task ID format");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}