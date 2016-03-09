package bian;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xuandong.Problem;
import xuandong.Quiz;

/**
 * Servlet implementation class QuizCreatServlet
 */
@WebServlet("/QuizCreatServlet")
public class QuizCreatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizCreatServlet() {
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
		HttpSession session = request.getSession();
		Quiz quiz = (Quiz)session.getAttribute("newQuiz");
		
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String url = request.getParameter("picture");
		quiz.setName(name);
		quiz.setDescription(description);
		quiz.setImage(url);
		
		String random = request.getParameter("Random");
		String onepage = request.getParameter("OnePage");
		String practice = request.getParameter("Practice");
		String immcorr = request.getParameter("ImmCorr");
		if (random.equals("Yes")) {
			quiz.setRandomQuiz(true);
		}else {
			quiz.setRandomQuiz(false);
		}
		if (onepage.equals("Yes")) {
			quiz.setOnePage(true);
		}else {
			quiz.setOnePage(false);
		}
		if (practice.equals("Yes")) {
			quiz.setPracticeMode(true);
		}else {
			quiz.setPracticeMode(false);
		}
		if (immcorr.equals("Yes")) {
			quiz.setImmediateCorrection(true);
		}else {
			quiz.setImmediateCorrection(false);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("QuizCreateQuestion.jsp");
		dispatcher.forward(request, response);
	}

}
