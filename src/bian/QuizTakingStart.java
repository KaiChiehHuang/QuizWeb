package bian;

import java.io.*;
import java.util.*;

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
 * Servlet implementation class QuizTakingStart
 */
@WebServlet("/QuizTakingStart")
public class QuizTakingStart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizTakingStart() {
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
		Quiz quiz = (Quiz)session.getAttribute("quiz");
		session.setAttribute("index", 1);
		session.setAttribute("result", "");
		ArrayList<Problem> problems = new ArrayList<Problem>();
		problems = quiz.getProblems();
		quiz.setOnQuizMode();
		quiz.quizStart();
		if (quiz.isRandomQuiz()) {
			Collections.shuffle(problems);
		}
		session.setAttribute("problems", problems);
		if (quiz.isOnePage()) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("QuizTakingOnePage.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("QuizTakingMultiPageQuestion.jsp");
			dispatcher.forward(request, response);
		}
	}

}
