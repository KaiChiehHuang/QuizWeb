package bian;

import java.io.IOException;
import java.sql.SQLException;

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
 * Servlet implementation class DeleteProblemServlet
 */
@WebServlet("/DeleteProblemServlet")
public class DeleteProblemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProblemServlet() {
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
		
		String problemID = request.getParameter("deletedquestion");
//		System.out.println(problemID);
//		System.out.println(quiz.getProblems().size());
		try {
			System.out.println(quiz.getProblems().size());
			quiz.deleteProblem(problemID);
			System.out.println(quiz.getProblems().size());
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			quiz.updateDatabase();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("QuizEditing.jsp");
		dispatcher.forward(request, response);
	}

}
