package bian;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import jdk.internal.org.objectweb.asm.tree.IntInsnNode;
import xuandong.*;

/**
 * Servlet implementation class QuizResultServlet
 */
@WebServlet("/QuizResultServlet")
public class QuizResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizResultServlet() {
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
		Quiz quiz = (Quiz)session.getAttribute("quiz");
		
		ArrayList<Problem> problems = new ArrayList<Problem>();
		problems = quiz.getProblems();
		
		// Set answer.		
		for (int i = 1; i < problems.size() + 1; i++) {
			String[] answers = request.getParameterValues("answer" + i);
			String answer = "";
			for (int j = 0; j < answers.length; j++) {
				answer = answer + answers[j] + "|";
			}
			answer = answer.substring(0, answer.length() - 1);
			problems.get(i-1).setUserAnswer(answer);
		}
		
		quiz.quizEnd();
		RequestDispatcher dispatcher = request.getRequestDispatcher("QuizResult.jsp");
		dispatcher.forward(request, response);
	}

}
