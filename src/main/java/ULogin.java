import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ULogin")
public class ULogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ULogin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("userID");
        String password = request.getParameter("password");

        UserRegisterDao urDao = new UserRegisterDao();
        boolean isValidUser = urDao.validateUser(username, password);

        if (isValidUser) {
            response.getWriter().write("Login successful! Welcome, " + username);
        } else {
            response.getWriter().write("Invalid login. Please try again.");
        }
    }
}
