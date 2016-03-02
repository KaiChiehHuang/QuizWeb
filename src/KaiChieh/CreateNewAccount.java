package KaiChieh;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

import bian.*;
/**
 * Servlet implementation class CreateNewAccount
 */
@WebServlet("/CreateNewAccount")
public class CreateNewAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateNewAccount() {
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
		String userID = request.getParameter("userID");
		String password = request.getParameter("password");
		String userName = request.getParameter("name");
		String userAge = request.getParameter("age");
		ServletContext context = getServletContext();
		AccountManager manager = (AccountManager) context.getAttribute("AccountManager");
		response.setContentType("text/html; charset=UTF-8");
		if(manager.accountExist(userID)) {
//			RequestDispatcher dispatcher = request.getRequestDispatcher("userExist.jsp");
//			dispatcher.forward(request, response);
		}else{
			manager.createAccount(userID, password);
			Statement statement = (Statement) context.getAttribute("statement");
			// TODO need to add user name and age to database
			RequestDispatcher dispatcher = request.getRequestDispatcher("HomePage.jsp");
			dispatcher.forward(request, response);
		}

	}

}
