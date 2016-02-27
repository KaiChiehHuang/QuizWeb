package KaiChieh;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bian.AccountManager;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userID = request.getParameter("userName");
		String password = request.getParameter("password");
		ServletContext context = getServletContext();
		AccountManager manager = (AccountManager) context.getAttribute("AccountManager");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(manager.idPasswordMatch(userID, password)) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<meta charset=\"UTF-8\" />");
			out.println("<title>Welcome " +userID+ "</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Welcome " +userID+"</h1>");
			out.println("</body>");
			out.println("</html>");	
		}else{
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginFailed.html");
			dispatcher.forward(request, response);
		}
	}

}
