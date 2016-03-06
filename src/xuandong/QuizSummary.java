package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class QuizSummary {
	
	public static final int TOP_NUM = 10;
	
	private String quizID;
	private String userID;
	private ArrayList<Performance> highestPerformers;
	private ArrayList<Performance> highestPerformersLastDay;
	private ArrayList<Performance> goodPerformers;
	private ArrayList<Performance> badPerformers;
	private ArrayList<Performance> userPerformance;
	private int takeNum;
	private double meanScore;
	private double maxScore;
	private double minScore;
	
	/**
	 * Simple constructor, get the statistics about this quiz
	 * @param quizID
	 * @param userID
	 */
	public QuizSummary(String quizID, String userID) {
		this.quizID = quizID;
		this.userID = userID;
		highestPerformers = new ArrayList<Performance>();
		highestPerformersLastDay = new ArrayList<Performance>();
		goodPerformers = new ArrayList<Performance>();
		badPerformers = new ArrayList<Performance>();
		userPerformance = new ArrayList<Performance>();
		
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT COUNT(UserID), AVG(Score), MAX(Score), MIN(Score) FROM QuizRecord WHERE QuizID = \"" + this.quizID + "\" GROUP BY QuizID;";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				takeNum = Integer.parseInt(res.getString(1));
				meanScore = Double.parseDouble(res.getString(2));
				maxScore = Double.parseDouble(res.getString(3));
				minScore = Double.parseDouble(res.getString(4));
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * Get the performance of this user
	 * @return a Performance Object, it's easy to read
	 */
	public ArrayList<Performance> getUserPerformance() {
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT QuizID, UserID, StartTime, Duration, Score FROM QuizRecord WHERE QuizID = \"" + this.quizID + "\" AND UserID = \"" + this.userID + "\" ORDER BY StartTime DESC;";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				while (res.next()) {
					String curQuizID = res.getString(1);
					String curUserID = res.getString(2);
					String curStartTime = res.getString(3).substring(0, res.getString(3).length() - 2);
					String curDuration = res.getString(4);
					double curScore = Double.parseDouble(res.getString(5));
					Performance perf = new Performance(curQuizID, curUserID, curStartTime, curDuration, curScore);
					userPerformance.add(perf);
				}
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userPerformance;
	}
	
	
	/**
	 * Get the top 10 performance of this quiz 
	 * @return a Performance Object, it's easy to read
	 */
	public ArrayList<Performance> getHighestPerformers() {
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT QuizID, UserID, StartTime, Duration, Score FROM QuizRecord WHERE QuizID = \"" + this.quizID + "\" ORDER BY Score DESC, Duration ASC, StartTime ASC LIMIT " + TOP_NUM + " ;";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				while (res.next()) {
					String curQuizID = res.getString(1);
					String curUserID = res.getString(2);
					String curStartTime = res.getString(3).substring(0, res.getString(3).length() - 2);
					String curDuration = res.getString(4);
					double curScore = Double.parseDouble(res.getString(5));
					Performance perf = new Performance(curQuizID, curUserID, curStartTime, curDuration, curScore);
					highestPerformers.add(perf);
				}
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return highestPerformers;
	}
	
	
	/**
	 * Get the top 10 performance of this quiz during the last 24 hours
	 * @return a Performance Object, it's easy to read
	 */
	public ArrayList<Performance> getHighestPerformersLastDay() {
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String curTime = Quiz.df.format((new Date()).getTime());
			String sql = "SELECT QuizID, UserID, StartTime, Duration, Score FROM QuizRecord WHERE QuizID = \"" + this.quizID + "\" AND TIMESTAMPDIFF(SECOND, " + curTime +", EndTime) <= 86400 ORDER BY Score DESC, Duration ASC, StartTime ASC LIMIT " + TOP_NUM + " ;";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				while (res.next()) {
					String curQuizID = res.getString(1);
					String curUserID = res.getString(2);
					String curStartTime = res.getString(3).substring(0, res.getString(3).length() - 2);
					String curDuration = res.getString(4);
					double curScore = Double.parseDouble(res.getString(5));
					Performance perf = new Performance(curQuizID, curUserID, curStartTime, curDuration, curScore);
					highestPerformersLastDay.add(perf);
				}
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return highestPerformersLastDay;
	}
	
	
	/**
	 * Get the top 10 good performers who scored over 80% of this quiz
	 * @return a Performance Object, it's easy to read
	 */
	public ArrayList<Performance> getGoodPerformers() {
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT QuizID, UserID, StartTime, Duration, Score FROM QuizRecord WHERE QuizID = \"" + this.quizID + "\" AND Score >= 80 ORDER BY EndTime DESC, Score DESC LIMIT " + TOP_NUM + ";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				while (res.next()) {
					String curQuizID = res.getString(1);
					String curUserID = res.getString(2);
					String curStartTime = res.getString(3).substring(0, res.getString(3).length() - 2);
					String curDuration = res.getString(4);
					double curScore = Double.parseDouble(res.getString(5));
					Performance perf = new Performance(curQuizID, curUserID, curStartTime, curDuration, curScore);
					goodPerformers.add(perf);
				}
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goodPerformers;
	}
	
	
	/**
	 * Get the top 10 bad performers who scored bellow 40% of this quiz
	 * @return Performance Object, it's easy to read
	 */
	public ArrayList<Performance> getBadPerformers() {
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT QuizID, UserID, StartTime, Duration, Score FROM QuizRecord WHERE QuizID = \"" + this.quizID + "\" AND Score <= 40 ORDER BY EndTime DESC, Score ASC LIMIT " + TOP_NUM + " ;";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				while (res.next()) {
					String curQuizID = res.getString(1);
					String curUserID = res.getString(2);
					String curStartTime = res.getString(3).substring(0, res.getString(3).length() - 2);
					String curDuration = res.getString(4);
					double curScore = Double.parseDouble(res.getString(5));
					Performance perf = new Performance(curQuizID, curUserID, curStartTime, curDuration, curScore);
					badPerformers.add(perf);
				}
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return badPerformers;
	}
	
	
	/**
	 * @return the number of the quiz been taken
	 */
	public int getTakeNum() {
		return takeNum;
	}
	
	
	/**
	 * @return the average score of all users
	 */
	public double getMeanScore() {
		return meanScore;
	}
	
	
	/**
	 * @return the maximum score of all users
	 */
	public double getMaxScore() {
		return maxScore;
	}
	
	
	/**
	 * @return the minimum score of all users
	 */
	public double getMinScore() {
		return minScore;
	}
	
}
