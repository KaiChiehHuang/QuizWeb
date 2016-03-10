package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class Email {
	String link;
	String time;
	String content;
	String subject;
	String senderID;
	String receiverID;

	boolean read;
	
	
	/**
	 * Simple Constructor
	 */
	public Email() {
	}
	
	
	/**
	 * @return senderID
	 */
	public String getSenderID() {
		return this.senderID;
	}
	
	
	/**
	 * @return receiverID
	 */
	public String getReceiverID() {
		return this.receiverID;
	}
	
	
	/**
	 * @return email content
	 */
	public String getContent() {
		return this.content;
	}
	
	
	/**
	 * @return the quiz link
	 */
	public String getLink() {
		return this.link;
	}
	
	
	/**
	 * @return email subject
	 */
	public String getSubject() {
		return this.subject;
	}
	
	
	/**
	 * @return email time
	 */
	public String getTime() {
		return this.time.substring(0, this.time.length() - 2);
	}
	
	
	/**
	 * @return TRUE for already read, FALSE if not
	 */
	public boolean getRead() {
		return this.read;
	}
	
	
	/**
	 * Set the senderID
	 * @param sender
	 */
	public void setSender(String sender) {
		senderID = sender;
	}
	
	
	/**
	 * Set the receiverID
	 * @param receiver
	 */
	public void setReceiver(String receiver) {
		receiverID = receiver;
	}
	
	
	/**
	 * Set the content
	 * @param content
	 */
	public void setContent(String content) {
		this.content = content;
	}
	
	
	/**
	 * Set the link
	 * @param link
	 */
	public void setLink(String link) {
		this.link = link;
	}
	
	
	/**
	 * Set the subject
	 * @param subject
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	
	/**
	 * Set the time of this email
	 * @param time
	 */
	public void setTime() {
		this.time = Quiz.df.format(new Date().getTime());
	}
	
	
	/**
	 * Set the time of this email to a given time
	 * used for fetch email from database
	 */
	public void setTime(String time) {
		this.time = time;
	}
	
	
	/**
	 * Set whether or not this email has been read
	 * @param value TRUE for already read, FALSE if not
	 */
	public void setRead(boolean value) {
		this.read = value;
		updateDatabase();
	}
	
	
	/**
	 * Delete an email from the database
	 */
	public void deleteEmail() {
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "DELETE FROM Emails WHERE SenderID = \"" + this.senderID.replace("\"", "\"\"") + "\" AND ReceiverID = \"" + this.receiverID.replace("\"", "\"\"") + "\" AND Time = \"" + this.time + "\";";
			stmt.executeUpdate(sql);
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * Insert this email into database
	 * Notice that we only insert an new email into database when it is being sent by someone
	 */
	public void insertToDatabse() {
		try {
			DBConnection database = new DBConnection();
			ResultSet test = database.getStmt().executeQuery("SELECT * FROM Emails WHERE SenderID = \"" + this.senderID.replace("\"", "\"\"") + "\" AND ReceiverID = \"" + this.receiverID.replace("\"", "\"\"") + "\" AND Time = \"" + this.time + "\";");
			if (!test.next()) {
				String sql = "INSERT INTO Emails(SenderID, ReceiverID, Time, Subject, Content, Link, IsRead)" + " VALUES(\"" + this.senderID.replace("\"", "\"\"") + "\",\"" + this.receiverID.replace("\"", "\"\"") + "\",\"" + this.time + "\",\"" + this.subject.replace("\"", "\"\"") + "\",\"" + this.content.replace("\"", "\"\"") + "\",\"" + this.link.replace("\"", "\"\"") + "\"," + this.read + ");";
				database.getStmt().executeUpdate(sql);
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * Update the isRead Attribute in the database for this email
	 */
	private void updateDatabase() {
		try {
			DBConnection database = new DBConnection();
			String sql = "UPDATE Emails SET IsRead = " + this.read + " WHERE SenderID = \"" + this.senderID.replace("\"", "\"\"") + "\" AND ReceiverID = \"" + this.receiverID.replace("\"", "\"\"") + "\" AND Time = \"" + this.time + "\";";
			database.getStmt().executeUpdate(sql);
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * Challenge a friend, this method will insert an email to database
	 * Ignore this challenge if one of the input parameter is not in the database
	 * @param senderID
	 * @param quizID
	 * @param receiverID
	 * @throws SQLException
	 */
	public static void challenge(String senderID, String quizID, String receiverID) throws SQLException {
		DBConnection database = new DBConnection();
		try {
			Statement stmt = database.getStmt();
			ResultSet test1 = database.getStmt().executeQuery("SELECT * FROM Users WHERE UserID = \"" + senderID + "\";");
			if (test1.next()) {
				ResultSet test2 = database.getStmt().executeQuery("SELECT * FROM Users WHERE UserID = \"" + receiverID + "\";");
				if (test2.next()) {
					ResultSet test3 = database.getStmt().executeQuery("SELECT * FROM Quiz WHERE QuizID = \"" + quizID + "\";");
					if (test3.next()) {
						String time = Quiz.df.format((new Date()).getTime());
						String subject = "You Received a New Quiz Challenge!";
						String content = "Hi " + receiverID + ",<br>You received a new quiz challenge from your friend " + senderID + ".<br>The quiz is <a href=\"QuizSummary.jsp?quizID=" + quizID + "&userID=" + receiverID + "\">" + Quiz.getName(quizID) + "</a ><br>Your friend's highest score on this quiz is: " + Performance.getHightestScoreOfUser(senderID, quizID) + ".";
						String link = "";
						String sql = "INSERT INTO Emails(SenderID, ReceiverID, Time, Subject, Content, Link, IsRead) VALUES(\"" + senderID.replace("\"", "\"\"") + "\",\"" + receiverID.replace("\"", "\"\"") + "\",\"" + time + "\",\"" + subject.replace("\"", "\"\"") + "\",\"" + content.replace("\"", "\"\"") + "\",\"" + link + "\"," + false + ");";
						stmt.executeUpdate(sql);
					}
				}
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
			database.getCon().close();
		}
	}
}
