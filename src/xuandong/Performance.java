package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Performance {
	private String quizID;
	private String userID;
	private String startTime;
	private String duration;
	private double score;
	
	/**
	 * Simple constructor
	 * @param quizID
	 * @param userID
	 * @param startTime
	 * @param duration
	 * @param score
	 */
	public Performance(String quizID, String userID, String startTime, String duration, double score) {
		this.quizID = quizID;
		this.userID = userID;
		this.startTime = startTime;
		this.duration = duration;
		this.score = score;
	}
	
	/**
	 * @return quizID
	 */
	public String getQuizID() {
		return quizID;
	}
	
	/**
	 * @return quizID
	 * @throws SQLException 
	 */
	public String getQuizName() throws SQLException {
		DBConnection database = new DBConnection();
		ResultSet res = database.getStmt().executeQuery("SELECT Name FROM Quiz WHERE QuizID = \"" + this.quizID + "\";");
		res.next();
		String name = res.getString("Name");
		return name;
	}
	
	/**
	 * @return userID
	 */
	public String getUserID() {
		return userID;
	}
	
	/**
	 * @return startTime
	 */
	public String getStartTime() {
		return startTime.substring(0, startTime.length() - 2);
	}
	
	/**
	 * @return duration
	 */
	public String getDuration() {
		return duration;
	}
	
	/**
	 * @return score
	 */
	public String getScore() {
		return String.format("%.2f", this.score) + "%";
	}
}
