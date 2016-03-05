package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class EmailManager {
	String userID;
	ArrayList<Email> toEmails;
	ArrayList<Email> fromEmails;

	/**
	 * Simple Constructor
	 */
	public EmailManager() {
		toEmails = new ArrayList<Email>();
		fromEmails = new ArrayList<Email>();
	}

	/**
	 * Set the user
	 * Please call setUser first before you call getFromUserEmail() or getToUserEmail()
	 * @param userID
	 */
	public void setUser(String userID) {
		this.userID = userID;
	}

	/**
	 * Get all the emails that are sent to this user
	 */
	public void getToUserEmail() {
		DBConnection database = new DBConnection();
		Statement stmt = database.getStmt();
		try {
			String sql = "SELECT SenderID, Time, Subject, Content, Link, IsRead FROM Emails WHERE ReceiverID = \""
					+ userID + "\";";
			ResultSet res = stmt.executeQuery(sql);
			while (res.next()) {
				Email newEmail = new Email();
				newEmail.setReceiver(userID);
				newEmail.setSender(res.getString(1));
				newEmail.setTime(res.getString(2));
				newEmail.setSubject(res.getString(3));
				newEmail.setContent(res.getString(4));
				newEmail.setLink(res.getString(5));
				newEmail.setRead(res.getBoolean(6));
				toEmails.add(newEmail);
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Get all the emails that are sent from this user
	 */
	public void getFromUserEmail() {
		DBConnection database = new DBConnection();
		Statement stmt = database.getStmt();
		try {
			String sql = "SELECT ReceiverID, Time, Subject, Content, Link, IsRead FROM Emails WHERE SenderID = \""
					+ userID + "\";";
			ResultSet res = stmt.executeQuery(sql);
			while (res.next()) {
				Email newEmail = new Email();
				newEmail.setSender(userID);
				newEmail.setReceiver(res.getString(1));
				newEmail.setTime(res.getString(2));
				newEmail.setSubject(res.getString(3));
				newEmail.setContent(res.getString(4));
				newEmail.setLink(res.getString(5));
				newEmail.setRead(res.getBoolean(6));
				toEmails.add(newEmail);
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @return an ArrayList of emails that are sent to this user
	 */
	public ArrayList<Email> getToEmailList() {
		return toEmails;
	}
	
	/**
	 * @return an ArrayList of emails that are sent from this user
	 */
	public ArrayList<Email> getFromEmailList() {
		return fromEmails;
	}
	
	/**
	 * @return get the userID
	 */
	public String getUser() {
		return userID;
	}
	
	/**
	 * Delete an email from the ArrayList and delete it from database
	 * @param index the position of the email in the ArrayList
	 */
	public void deleteToEmail(int index) {
		toEmails.get(index).deleteEmail();
		toEmails.remove(index);
	}
	
	/**
	 * Delete an email from the ArrayList and delete it from database
	 * @param index the position of the email in the ArrayList
	 */
	public void deleteFromEmail(int index) {
		fromEmails.get(index).deleteEmail();
		fromEmails.remove(index);
	}
}