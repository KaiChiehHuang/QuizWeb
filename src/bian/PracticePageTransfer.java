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

import xuandong.*;

/**
 * Servlet implementation class PracticePageTransfer
 */
@WebServlet("/PracticePageTransfer")
public class PracticePageTransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PracticePageTransfer() {
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
		ArrayList<Problem> practiceProblems = new ArrayList<Problem>();
		practiceProblems = (ArrayList<Problem>) session.getAttribute("practiceProblems");
		int index = (Integer)session.getAttribute("index");
		session.setAttribute("index", index+1);
		String[] answers = request.getParameterValues("answer" + index);
		String answer = "";
		if (answers == null) {
			answer = "";
		} else {
			for (int j = 0; j < answers.length; j++) {
				answer = answer + answers[j] + "|";
			}
			answer = answer.substring(0, answer.length() - 1);
		}
		Problem thisProblem = practiceProblems.get(index);
		practiceProblems.get(index).setAnswers(answer);
		String result = practiceProblems.get(index).getCorrectAnswerNumber();
		String counts[] = result.split("/");
		if (counts[0].equals(counts[1])) {
			practiceProblems.remove(index);
		} else {
			practiceProblems.remove(index);
			practiceProblems.add(thisProblem);
		}
		session.setAttribute("index", index);
		session.setAttribute("result", result);
		RequestDispatcher dispatcher = request.getRequestDispatcher("QuizPracticingMultiPageResult.jsp");
		dispatcher.forward(request, response);
	}

}
