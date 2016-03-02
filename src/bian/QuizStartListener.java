package bian;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import xuandong.Quiz;

/**
 * Application Lifecycle Listener implementation class QuizStartListener
 *
 */
@WebListener
public class QuizStartListener implements ServletContextListener {
	private Quiz quiz;

    /**
     * Default constructor. 
     */
    public QuizStartListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
		quiz = new Quiz();
        ServletContext context = arg0.getServletContext();
        context.setAttribute("quiz", quiz);
    }
	
}
