package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class QuizSummary {
	
	public static final int TOP_NUM = 10;
	
	private String quizID;
	private String userID;
	private Performance[] highestPerformers;
	private Performance[] highestPerformersLastDay;
	private Performance[] goodPerformers;
	private Performance[] badPerformers;
	private int takeNum;
	private double meanScore;
	private double maxScore;
	private double minScore;
	
	private DBConnection database;
	private Statement stmt;
	
	public QuizSummary(String quizID, String userID) {
		this.quizID = quizID;
		this.userID = userID;
		highestPerformers = new Performance[TOP_NUM];
		highestPerformersLastDay = new Performance[TOP_NUM];
		goodPerformers = new Performance[TOP_NUM];
		badPerformers = new Performance[TOP_NUM];
		database = new DBConnection();
		stmt = database.getStmt();
		
		try {
			String sql = "SELECT COUNT(UserID), AVG(Score), MAX(Score), MIN(Score) FROM QuizRecord WHERE QuizID = \"" + quizID + "\" GROUP BY QuizID;";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				takeNum = Integer.parseInt(res.getString(1));
				meanScore = Double.parseDouble(res.getString(2));
				maxScore = Double.parseDouble(res.getString(3));
				minScore = Double.parseDouble(res.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public Performance[] getHighestPerformers() {
		try {
			String sql = "SELECT QuizID, UserID, StartTime, Duration, Score FROM QuizRecord ORDER BY Score DESC, Duration ASC, StartTime ASC LIMIT " + TOP_NUM + " ;";
			ResultSet res = stmt.executeQuery(sql);
			int index = 0;
			if (res != null) {
				res.absolute(1);
				String curQuizID = res.getString(1);
				String curUserID = res.getString(2);
				String curStartTime = res.getString(3);
				String curDuration = res.getString(4);
				double curScore = Double.parseDouble(res.getString(5));
				Performance perf = new Performance(curQuizID, curUserID, curStartTime, curDuration, curScore);
				highestPerformers[index] = perf;
				index++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return highestPerformers;
	}
	
	public Performance[] getHighestPerformersLastDay() {
		try {
			String curTime = Quiz.df.format((new Date()).getTime());
			String sql = "SELECT QuizID, UserID, StartTime, Duration, Score FROM QuizRecord WHERE TIMESTAMPDIFF(SECOND, " + curTime +", EndTime) <= 86400 ORDER BY Score DESC, Duration ASC, StartTime ASC LIMIT " + TOP_NUM + " ;";
			ResultSet res = stmt.executeQuery(sql);
			int index = 0;
			if (res != null) {
				res.absolute(1);
				String curQuizID = res.getString(1);
				String curUserID = res.getString(2);
				String curStartTime = res.getString(3);
				String curDuration = res.getString(4);
				double curScore = Double.parseDouble(res.getString(5));
				Performance perf = new Performance(curQuizID, curUserID, curStartTime, curDuration, curScore);
				highestPerformersLastDay[index] = perf;
				index++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return highestPerformersLastDay;
	}
	
	public Performance[] getGoodPerformers() {
		try {
			String sql = "SELECT QuizID, UserID, StartTime, Duration, Score FROM QuizRecord WHERE Score >= 80 ORDER BY EndTime DESC, Score DESC LIMIT " + TOP_NUM + " ;";
			ResultSet res = stmt.executeQuery(sql);
			int index = 0;
			if (res != null) {
				res.absolute(1);
				String curQuizID = res.getString(1);
				String curUserID = res.getString(2);
				String curStartTime = res.getString(3);
				String curDuration = res.getString(4);
				double curScore = Double.parseDouble(res.getString(5));
				Performance perf = new Performance(curQuizID, curUserID, curStartTime, curDuration, curScore);
				goodPerformers[index] = perf;
				index++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goodPerformers;
	}
	
	public Performance[] getBadPerformers() {
		try {
			String sql = "SELECT QuizID, UserID, StartTime, Duration, Score FROM QuizRecord WHERE Score <= 40 ORDER BY EndTime DESC, Score ASC LIMIT " + TOP_NUM + " ;";
			ResultSet res = stmt.executeQuery(sql);
			int index = 0;
			if (res != null) {
				res.absolute(1);
				String curQuizID = res.getString(1);
				String curUserID = res.getString(2);
				String curStartTime = res.getString(3);
				String curDuration = res.getString(4);
				double curScore = Double.parseDouble(res.getString(5));
				Performance perf = new Performance(curQuizID, curUserID, curStartTime, curDuration, curScore);
				badPerformers[index] = perf;
				index++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return badPerformers;
	}
	
	public int getTakeNum() {
		return takeNum;
	}
	
	public double getMeanScore() {
		return meanScore;
	}
	
	public double getMaxScore() {
		return maxScore;
	}
	
	public double getMinScore() {
		return minScore;
	}
	
}
