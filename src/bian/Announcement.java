package bian;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import xuandong.DBConnection;
import xuandong.Quiz;

public class Announcement {
	String subject;
	String content;
	String date;
	String adminID;
	
	/**
	 * simple constructor, don't do anything
	 */
	public Announcement() {
	}

	/**
	 * @return the content of the announcement
	 */
	public String getContent() {
		return content;
	}
	
	/**
	 * @return the date of the announcement
	 */
	public String getDate() {
		return date;
	}
	
	/**
	 * @return the subject of the announcement
	 */
	public String getSubject() {
		return subject;
	}
	
	/**
	 * get the administratorID of the announcement
	 * @return
	 */
	public String getAdminID() {
		return adminID;
	}
	
	/**
	 * set the administratorID of the announcement
	 * @param adminID
	 */
	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}
	
	/**
	 * set the content of the announcement
	 * @param content
	 */
	public void setContent(String content) {
		this.content = content;
	}
	
	/**
	 * set the date of the announcement to the current time
	 * usually used when creating a new announcement
	 */
	public void setDate() {
		this.date = Quiz.df.format(new Date().getTime());
	}
	
	/**
	 * set the date of the announcement to a given date
	 * usually used when fetch information from the database
	 * @param date
	 */
	public void setDate(String date) {
		this.date = date;
	}
	
	/**
	 * set the subject of the announcement
	 * @param subject
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	/**
	 * Fetch the announcements from database
	 * @return A list of announcements
	 * @throws SQLException
	 */
	public static ArrayList<Announcement> getAnnouncement() throws SQLException {
		DBConnection database = new DBConnection();
		ResultSet rs = database.getStmt().executeQuery("SELECT Subject, Content, Time, AdminID FROM Announcement ORDER BY Time;");
		ArrayList<Announcement> announcements = new ArrayList<Announcement>();
		while (rs.next()) {
			Announcement temp = new Announcement();
			temp.setContent(rs.getString("Content"));
			temp.setSubject(rs.getString("Subject"));
			temp.setDate(rs.getString("Time"));
			temp.setAdminID(rs.getString("AdminID"));
			announcements.add(temp);
		}
		database.getCon().close();
		return announcements;
	}
	
	/**
	 * add an announcement to the database
	 * @throws SQLException
	 */
	public void addAnnouncement() throws SQLException {
		DBConnection database = new DBConnection();
		String sql = "INSERT INTO Announcement(Content, AdminID, Time, Subject) VALUES(\"" + this.content + "\",\"" + this.adminID + "\",\"" + this.date + "\",\"" + this.subject + "\");";
		database.getStmt().executeUpdate(sql);
		database.getCon().close();
	}
	
	/**
	 * delete an announcement from the database
	 * @throws SQLException
	 */
	public void deleteAnnouncement() throws SQLException {
		DBConnection database = new DBConnection();
		String sql = "DELETE FROM Announcement WHERE AdminID = \"" + this.adminID + "\", AND Time = \"" + this.date + "\";";
		database.getStmt().executeUpdate(sql);
		database.getCon().close();
	}
}
