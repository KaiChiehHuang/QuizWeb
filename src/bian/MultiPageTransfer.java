package bian;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xuandong.Problem;
import xuandong.Quiz;

/**
 * Servlet implementation class MultiPageTransfer
 */
@WebServlet("/MultiPageTransfer")
public class MultiPageTransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MultiPageTransfer() {
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
		ArrayList<Problem> problems = new ArrayList<Problem>();
		problems = quiz.getProblems();
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
		problems.get(index).setUserAnswer(answer);
		session.setAttribute("result", problems.get(index).getCorrectNumber(answer));
	}

}
