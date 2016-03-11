package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Category {
	/**
	 * search quizzes by a category, exact match
	 * @param category
	 * @return a list of quizzes which belongs to this category
	 * @throws SQLException
	 */
	public static ArrayList<Quiz> searchByCategory(String category) throws SQLException {
		ArrayList<Quiz> quizs = new ArrayList<Quiz>();
		DBConnection database = new DBConnection();
		String sql = "SELECT QuizID FROM Category WHERE Category LIKE \"" + category.replace("\"", "\"\"") + "\";";
		ResultSet res = database.getStmt().executeQuery(sql);
		while (res.next()) {
			Quiz temp = new Quiz();
			temp.setQuizID(res.getString("QuizID"));
			quizs.add(temp);
		}
		database.getCon().close();
		return quizs;
	}
	
	
	/**
	 * Add a category to this quiz
	 * If this Quiz already has a category, ignore this command
	 * @param quizID
	 * @param category
	 */
	public static void addCategory(String quizID, String category) {
		DBConnection database = new DBConnection();
		try {
			ResultSet res = database.getStmt().executeQuery("SELECT * FROM Category WHERE QuizID = \"" + quizID + "\";");
			if (!res.next()) {
				database.getStmt().executeUpdate("INSERT INTO Category(QuizID, Category) VALUES(\"" + quizID + "\",\"" + category + "\");");
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * Edit the category of a specific quiz
	 * Add the category if the the quiz doesn't have a category
	 * @param quizID
	 * @param category
	 */
	public static void editCategory(String quizID, String category) {
		DBConnection database = new DBConnection();
		try {
			ResultSet res = database.getStmt().executeQuery("SELECT * FROM Category WHERE QuizID = \"" + quizID + "\";");
			if (res.next()) {
				database.getStmt().executeUpdate("UPDATE Category SET Category = \"" + category + "\" WHERE QuizID = \"" + quizID + "\";");
			} else {
				database.getStmt().executeUpdate("INSERT INTO Category(QuizID, Category) VALUES(\"" + quizID + "\",\"" + category + "\");");
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * Delete a category for a quiz
	 * @param quizID
	 */
	public static void deleteCategory(String quizID) {
		DBConnection database = new DBConnection();
		try {
			database.getStmt().executeUpdate("DELETE FROM Category WHERE QuizID = \"" + quizID + "\";");
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Get all the tags for a specific quiz
	 */
	public static ArrayList<String> getCategory(String quizID) throws SQLException {
		ArrayList<String> category = new ArrayList<String>();
		DBConnection database = new DBConnection();
		String sql = "SELECT Category FROM Category WHERE QuizID = \"" + quizID + "\";";
		ResultSet res = database.getStmt().executeQuery(sql);
		while (res.next()) {
			category.add(res.getString("Category"));
		}
		database.getCon().close();
		return category;
	}
}
