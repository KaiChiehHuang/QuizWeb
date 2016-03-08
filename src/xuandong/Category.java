package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Category {
	/**
	 * search quizzes by a category, exact match
	 * @param tag
	 * @return a list of quizzes which belongs to this category
	 * @throws SQLException
	 */
	public static ArrayList<Quiz> searchByCategory(String category) throws SQLException {
		ArrayList<Quiz> quizs = new ArrayList<Quiz>();
		DBConnection database = new DBConnection();
		String sql = "SELECT QuizID FROM Category WHERE Category = \"" + category + "\";";
		ResultSet res = database.getStmt().executeQuery(sql);
		while (res.next()) {
			Quiz temp = new Quiz();
			temp.setQuizID(res.getString("QuizID"));
			quizs.add(temp);
		}
		database.getCon().close();
		return quizs;
	}
}
