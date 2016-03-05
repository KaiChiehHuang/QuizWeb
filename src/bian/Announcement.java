package bian;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import xuandong.DBConnection;

public class Announcement {
	String subject;
	String content;
	String date;
	
	public Announcement() {
	}

	public String getContent() {
		return content;
	}
	
	public String getDate() {
		return date;
	}
	
	public String getSubject() {
		return subject;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
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
		ResultSet rs = database.getStmt().executeQuery("SELECT Subject, Content, Time FROM Announcement ORDER BY Time;");
		ArrayList<Announcement> announcements = new ArrayList<Announcement>();
		while (rs.next()) {
			Announcement temp = new Announcement();
			temp.setContent(rs.getString("Content"));
			temp.setSubject(rs.getString("Subject"));
			temp.setDate(rs.getString("Time"));
			announcements.add(temp);
		}
		database.getCon().close();
		return announcements;
	}
}
