package KaiChieh;

import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import bian.*;
/**
 * Application Lifecycle Listener implementation class AccountManagerHolder
 *
 */
@WebListener
public class AccountManagerHolder implements ServletContextListener {
	private AccountManager manager;
	private Statement statement;
	private Connection con;
    /**
     * Default constructor. 
     */
    public AccountManagerHolder() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	try {
    		con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	try {
			/// Set up database connection ///
			Class.forName("com.mysql.jdbc.Driver");
			
			String server = WebDBInfo.MYSQL_DATABASE_SERVER;
			String account = WebDBInfo.MYSQL_USERNAME;
			String password = WebDBInfo.MYSQL_PASSWORD;
			String database = WebDBInfo.MYSQL_DATABASE_NAME;
			con = (Connection) DriverManager.getConnection("jdbc:mysql://"+server,account,password);
			statement = (Statement) con.createStatement();
			statement.executeQuery("USE "+database);
		} catch(SQLException e) {
			
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
		}

    	try {
			manager = new AccountManager(statement);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        ServletContext context = arg0.getServletContext();
        context.setAttribute("AccountManager", manager);
    }
	
}
