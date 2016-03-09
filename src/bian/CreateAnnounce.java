package bian;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import xuandong.Administration;
import xuandong.Quiz;

/**
 * Servlet implementation class CreateAnnounce
 */
@WebServlet("/CreateAnnounce")
public class CreateAnnounce extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAnnounce() {
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
		String userID = (String)session.getAttribute("userID");
		String content = request.getParameter("announce");
		String subject = request.getParameter("announsubject");
		Announcement announcement = new Announcement();
		if (userID == null) {
			userID = "bian";
		}
		announcement.setAdminID(userID);
		announcement.setContent(content);
		announcement.setSubject(subject);
		announcement.setDate();
		try {
			announcement.addAnnouncement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
