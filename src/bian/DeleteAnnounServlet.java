package bian;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xuandong.Administration;

/**
 * Servlet implementation class DeleteAnnounServlet
 */
@WebServlet("/DeleteAnnounServlet")
public class DeleteAnnounServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAnnounServlet() {
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
		ArrayList<Announcement> announ = new ArrayList<Announcement>();
		try {
			announ = Announcement.getAnnouncement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		String index = request.getParameter("announindex");
		
		for (int i = 0; i < announ.size(); i++) {
			if (i == Integer.parseInt(index)) {
	     		Announcement ann = new Announcement();
	     		ann = announ.get(i);
	     		try {
					ann.deleteAnnouncement();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminViewAnnoun.jsp");
		dispatcher.forward(request, response);
	}

}
