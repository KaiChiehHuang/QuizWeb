package bian;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xuandong.FillBlank;
import xuandong.MultiChoice;
import xuandong.MultiResponse;
import xuandong.PictureResponse;
import xuandong.QuestionResponse;
import xuandong.Quiz;

/**
 * Servlet implementation class QuizEditingAddProblem
 */
@WebServlet("/QuizEditingAddProblem")
public class QuizEditingAddProblem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizEditingAddProblem() {
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

		
		String type = request.getParameter("type");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		if (type.equals("MC")) {
			MultiChoice pro = new MultiChoice("MC", true);
			String choice = request.getParameter("choice");
			pro.setQuestion(question);
			pro.setChoices(choice);
			pro.setCount(choice.split("\\|").length);
			pro.setAnswers(answer);
			quiz.addProblem(pro);
		} else if (type.equals("MR")) {
			MultiResponse pro = new MultiResponse("MR", true);
			pro.setAnswers(answer);
			pro.setQuestion(question);
			String order = request.getParameter("order");
			if (order == "Yes") {
				pro.setOrdered(true);
			} else {
				pro.setOrdered(false);
			}
			quiz.addProblem(pro);
		} else if (type.equals("FB")) {
			FillBlank fb = new FillBlank("FB", true);
			String[] fbquestion = request.getParameterValues("fbquestion");
			String que = "";
			que += fbquestion[0] + "#" + fbquestion[1];
			fb.setQuestion(que);
			fb.setAnswers(answer);
			quiz.addProblem(fb);
		} else if (type.equals("PR")) {
			PictureResponse pr = new PictureResponse("PR", true);
			pr.setAnswers(answer);
			pr.setQuestion(question);
			String url = request.getParameter("picture");
			pr.setURL(url);
			quiz.addProblem(pr);
		} else if (type.equals("QR")) {
			QuestionResponse qr = new QuestionResponse("QR", true);
			qr.setAnswers(answer);
			qr.setQuestion(question);
			quiz.addProblem(qr);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("QuizEditingCreate.jsp");
		dispatcher.forward(request, response);
	}

}
