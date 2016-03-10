package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class Tag {
	/**
	 * search quizzes by a tag, exact match
	 * @param tag
	 * @return a list of quizzes which has this tag
	 * @throws SQLException
	 */
	public static ArrayList<Quiz> searchByTag(String tag) throws SQLException {
		ArrayList<Quiz> quizs = new ArrayList<Quiz>();
		DBConnection database = new DBConnection();
		String sql = "SELECT QuizID FROM Tags WHERE Tag = \"" + tag.replace("\"", "\"\"") + "\";";
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
	 * Add a tag to a specific quiz
	 * @param quizID
	 * @param tag
	 * @throws SQLException
	 */
	public static void addTag(String quizID, String tag) throws SQLException {
		DBConnection database = new DBConnection();
		database.getStmt().executeUpdate("INSERT INTO Tags(QuizID, Tag) VALUES(\"" + quizID + "\",\"" + tag.replace("\"", "\"\"") + "\");");
		database.getCon().close();
	}
	
	/**
	 * Delete a tag for a specific quiz
	 * @param quizID
	 * @param tag
	 * @throws SQLException
	 */
	public static void removeTag(String quizID, String tag) throws SQLException {
		DBConnection database = new DBConnection();
		database.getStmt().executeUpdate("DELETE FROM Tags WHERE QuizID = \"" + quizID + "\" AND Tag = \"" + tag.replace("\"", "\"\"") + "\";");
		database.getCon().close();
	}
	
	/**
	 * Remove all tags for a specific quiz
	 * @param quizID
	 * @param tag
	 * @throws SQLException
	 */
	public static void removeAllTag(String quizID, String tag) throws SQLException {
		DBConnection database = new DBConnection();
		database.getStmt().executeUpdate("DELETE FROM Tags WHERE QuizID = \"" + quizID + "\";");
		database.getCon().close();
	}
	
	/**
	 * Get all the tags for a specific quiz
	 */
	public static ArrayList<String> getTags(String quizID) throws SQLException {
		ArrayList<String> tags = new ArrayList<String>();
		DBConnection database = new DBConnection();
		String sql = "SELECT Tag FROM Tags WHERE QuizID = \"" + quizID + "\";";
		ResultSet res = database.getStmt().executeQuery(sql);
		while (res.next()) {
			tags.add(res.getString("Tag"));
		}
		database.getCon().close();
		return tags;
	}
}
