package KaiChieh;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bian.User;
import xuandong.Quiz;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
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
		String targetWord = request.getParameter("targetToSearch");
		String searchOption = request.getParameter("searchOption");
		HttpSession session = request.getSession();
		if(searchOption.equals("user")) {
			try {
				ArrayList<User> usersFound = User.serachUser(targetWord);
				session.setAttribute("searchResult", usersFound);
				session.setAttribute("searchOption", "user");
			} catch (Exception ignore) {}
			
		}else if (searchOption.equals("quiz")) {
			try {
				ArrayList<Quiz> quizzesFound = Quiz.serachQuiz(targetWord);
				session.setAttribute("searchResult", quizzesFound);
				session.setAttribute("searchOption", "quiz");
			} catch (Exception e) {e.printStackTrace();}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("SearchResult.jsp");
		dispatcher.forward(request, response);
	}

}
