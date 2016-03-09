package bian;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xuandong.MultiChoice;
import xuandong.PictureResponse;
import xuandong.Problem;
import xuandong.Quiz;

/**
 * Servlet implementation class QuizAddProblem
 */
@WebServlet("/QuizAddProblem")
public class QuizAddProblem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizAddProblem() {
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
		
		String type = request.getParameter("type");
		Problem problem = new Problem(type, true);
		String question = request.getParameter("question");
		problem.setQuestion(question);
		if (type.equals("MC") || type.equals("SC")) {
			String[] choices = request.getParameterValues("choices");
			problem = (MultiChoice) problem;
		}
		if (type.equals("PR")) {
			problem = (PictureResponse) problem;
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("QuizCreateYY.jsp");
		dispatcher.forward(request, response);
	}

}
