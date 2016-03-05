package bian;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import xuandong.Quiz;

/**
 * Application Lifecycle Listener implementation class QuizSession
 *
 */
@WebListener
public class QuizSession implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public QuizSession() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
    	Quiz quiz = new Quiz();
    	HttpSession quizsession = arg0.getSession();
    	quizsession.setAttribute("quiz", quiz);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
    	HttpSession quizsession = arg0.getSession();
    	quizsession.removeAttribute("quiz");
    }
	
}
