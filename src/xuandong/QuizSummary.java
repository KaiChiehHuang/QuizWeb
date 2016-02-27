package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class QuizSummary {
	
	public static final int TOP_NUM = 10;
	
	String quizID;
	String userID;
	Performance[] highestPerformers;
	DBConnection database;
	Statement stmt;
	
	public QuizSummary(String quizID, String userID) {
		this.quizID = quizID;
		this.userID = userID;
		highestPerformers = new Performance[TOP_NUM];
		database = new DBConnection();
		stmt = database.getStmt();
	}
	
	public Performance[] getHighestPerformance() {
		try {
			String sql = "SELECT QuizID, UserID, StartTime, Duration, Score FROM QuizRecord ORDER BY Score, LIMIT " + TOP_NUM + " ;";
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
				highestPerformers[0] = perf;
				index++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return highestPerformers;
	}
	
	
}
