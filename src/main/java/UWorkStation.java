import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UWorkstation")
public class UWorkstation extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("loginPage.jsp");
            return;
        }

        String userId = (String) session.getAttribute("username");
        String taskIdStr = request.getParameter("taskId");

        try {
            int taskId = Integer.parseInt(taskIdStr);
            TaskDao taskDao = new TaskDao();
            Task task = taskDao.getTaskById(taskId, userId);

            if (task != null) {
                request.setAttribute("task", task);
                request.getRequestDispatcher("workstation.jsp").forward(request, response);
            } else {
                response.sendRedirect("myTask.jsp");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("myTask.jsp");
        }
    }
}