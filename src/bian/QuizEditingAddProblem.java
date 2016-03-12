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
			String[] checkbox = request.getParameterValues("choicecheck");
			String MCAnswer = "";
			String choice = request.getParameter("choice1");
			String choices = "";
			int index = 1;
			while (choice != null) {
				choices += "|" + choice;
				for (String s: checkbox) {
					s = s.substring(3);
					if (s.equals(String.valueOf(index))) {
						MCAnswer += "|" + choice;
					}
				}
				index++;
				choice = request.getParameter("choice" + index);
			}
			MCAnswer = MCAnswer.substring(1);
			choices = choices.substring(1);
//			System.out.println(MCAnswer);
//			System.out.println(choices);
			pro.setQuestion(question);
			pro.setChoices(choices);
			pro.setCount(MCAnswer.split("\\|").length);
			pro.setAnswers(MCAnswer);
			try {
				pro.setCreating();
				pro.updateDatabase();
			} catch (Exception ignore) {}
			quiz.addProblem(pro);
		} else if (type.equals("MR")) {
			MultiResponse pro = new MultiResponse("MR", true);
			String answerMR = request.getParameter("answer1");
			String answers = "";
			int index = 1;
			while (answerMR != null) {
				answers += "|" + answerMR;
				index++;
				answerMR = request.getParameter("answer" + index);
			}
			answers = answers.substring(1);
//			System.out.println(answers);
			pro.setAnswers(answers);
			pro.setQuestion(question);
			pro.setCount(answers.split("\\|").length);
			String order = request.getParameter("order");
			if (order == null || order == "No") {
				pro.setOrdered(false);
			} else {
				pro.setOrdered(true);
			}
			try {
				pro.setCreating();
				pro.updateDatabase();
			} catch (Exception ignore) {}
			quiz.addProblem(pro);
		} else if (type.equals("FB")) {
			FillBlank fb = new FillBlank("FB", true);
			String[] fbquestion = request.getParameterValues("fbquestion");
			String que = "";
			que += fbquestion[0] + " |||||| " + fbquestion[1];
			fb.setQuestion(que);
			fb.setAnswers(answer);
			try {
				fb.setCreating();
				fb.updateDatabase();
			} catch (Exception ignore) {}
			quiz.addProblem(fb);
		} else if (type.equals("PR")) {
			PictureResponse pr = new PictureResponse("PR", true);
			pr.setAnswers(answer);
			pr.setQuestion(question);
			String url = request.getParameter("picture");
			pr.setURL(url);
			try {
				pr.setCreating();
				pr.updateDatabase();
			} catch (Exception ignore) {}
			quiz.addProblem(pr);
		} else if (type.equals("QR")) {
			QuestionResponse qr = new QuestionResponse("QR", true);
			qr.setAnswers(answer);
			qr.setQuestion(question);
			try {
				qr.setCreating();
				qr.updateDatabase();
			} catch (Exception ignore) {}
			quiz.addProblem(qr);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("QuizEditingCreate.jsp");
		dispatcher.forward(request, response);
	}

}
