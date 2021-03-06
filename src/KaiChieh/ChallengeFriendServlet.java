package KaiChieh;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xuandong.Email;

/**
 * Servlet implementation class ChallengeFriendServlet
 */
@WebServlet("/ChallengeFriendServlet")
public class ChallengeFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeFriendServlet() {
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
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("userID");
		String receiverID = request.getParameter("receiverID");
		String quizID = request.getParameter("quizID");
		System.out.println(userID);
		System.out.println(receiverID);
		System.out.println(quizID);
		try {
			Email.challenge(userID, quizID, receiverID);
		}
		catch (Exception ignore) {} 
		RequestDispatcher dispatcher = request.getRequestDispatcher("UserViewHistory.jsp");
		dispatcher.forward(request, response);
	}
}
