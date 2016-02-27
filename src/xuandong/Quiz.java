package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Quiz {
	private String name;
	private String quizID;
	private String userID;
	private String authorID;
	private String description;
	private ArrayList<Problem> problems;

	private boolean isOnePage;
	private boolean isRandomQuiz;
	private boolean isPracticeMode;
	private boolean isImmediateCorrection;
	
	private Long startTime;
	private Long endTime;
	private Long duration;
	private String date;
	
	static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	DBConnection database;

	public Quiz(String quizID) {
		this.quizID = quizID;
		database = new DBConnection();
		Statement stmt = database.getStmt();
		try {
			String sql = "SELECT Name, Description, AuthorID, ProblemID, IsRandomQuiz, IsOnePage, IsImmediateCorrection, IsPracticeMode FROM Quiz WHERE QuizID = "
					+ quizID + ";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.name = res.getString(1);
				this.description = res.getString(2);
				this.authorID = res.getString(3);
				String[] prs = res.getString(4).split("|");
				for (int i = 0; i < prs.length; i++) {
					
				}
				this.isRandomQuiz = res.getBoolean(5);
				this.isOnePage = res.getBoolean(6);
				this.isImmediateCorrection = res.getBoolean(7);
				this.isPracticeMode = res.getBoolean(8);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String getName() {
		return name;
	}
	
	public String getDescription() {
		return description;
	}
	
	public String getAuthor() {
		return authorID;
	}
	
	public boolean isRandomQuiz() {
		return this.isRandomQuiz;
	}
	
	public boolean isOnePage() {
		return this.isOnePage;
	}
	
	public boolean isImmediateCorrection () {
		return this.isImmediateCorrection;
	}
	
	public boolean isPracticeMode() {
		return this.isPracticeMode;
	}
	
	private void updateString(String key, String value) {
		try {
			Statement stmt = database.getStmt();
			String sql = "UPDATE Users SET " + key + " = " + value + " WHERE QuizID = " + quizID + ";";
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void updateBoolean(String key, boolean value) {
		try {
			Statement stmt = database.getStmt();
			String sql = "UPDATE Users SET " + key + " = " + value + " WHERE QuizID = " + quizID + ";";
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void setName(String name) {
		this.name = name;
		this.updateString("Name", name);
	}
	
	public void setDescription(String description) {
		this.description = description;
		this.updateString("Description", description);
	}
	
	public void setAuthor(String authorID) {
		this.authorID = authorID;
		this.updateString("AuthorID", authorID);
	}
	
	public void setProblem(String[] problems) {
		String value = null;
		for (int i = 0; i < problems.length; i++) {
			value += problems[i] + "|";
		}
		value = value.substring(0, value.length() - 1);
		this.updateString("ProblemID", value);
	}
	
	public void setRandomQuiz(boolean value) {
		this.isRandomQuiz = value;
		this.updateBoolean("isRandomQuiz", value);
	}
	
	public void setOnePage(boolean value) {
		this.isOnePage = value;
		this.updateBoolean("isOnePage", value);
	}
	
	public void setImmediateCorrection(boolean value) {
		this.isImmediateCorrection = value;
		this.updateBoolean("isImmediateCorrection", value);
	}
	
	public void setPracticeMode(boolean value) {
		this.isPracticeMode = value;
		this.updateBoolean("isPracticeMode", value);
	}
	
	public void setUser(String userID) {
		this.userID = userID;
	}
	
	public Long quizStart() {
		this.startTime = System.currentTimeMillis();
		date = df.format(new Date());
		return this.startTime;
	}
	
	public Long quizEnd() {
		this.endTime = System.currentTimeMillis();
		this.duration = this.startTime - this.endTime;
		int score = this.getScore();
		Statement stmt = database.getStmt();
		try {
			String sql = "INSERT INTO QuizRecord VALUES ('" + quizID + "','" + userID + "','" + startTime + "','" + endTime + "','" + score + "');";
			stmt.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return duration;
	}
	
	public int getScore() {
		int score = 0;
		for (Problem pr : problems) {
			score += pr.getScore();
		}
		return score;
	}
}
