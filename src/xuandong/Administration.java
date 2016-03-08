package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Administration {
	/**
	 * promote an user account to administration accounts
	 * @param id the user account you want to promote
	 * @throws SQLException
	 */
	public static void addAdmin(String id) throws SQLException {
		DBConnection database = new DBConnection();
		String sql = "INSERT INTO Administrator(AdminID) VALUES(\"" + id + "\");";
		database.getStmt().executeUpdate(sql);
		database.getCon().close();
	}
	
	/**
	 * remove an user account
	 * @param userID
	 * @throws SQLException
	 */
	public static void removeUser(String userID) throws SQLException {
		DBConnection database = new DBConnection();
		String sql = "DELETE FROM Users WHERE UserID = \"" + userID + "\";";
		database.getStmt().executeUpdate(sql);
		database.getCon().close();
	}
	
	/**
	 * remove a quiz
	 * @param quizID
	 * @throws SQLException
	 */
	public static void removeQuiz(String quizID) throws SQLException {
		DBConnection database = new DBConnection();
		String sql = "DELETE FROM Quiz WHERE QuizID = \"" + quizID + "\";";
		database.getStmt().executeUpdate(sql);
		database.getCon().close();
	}
	
	/**
	 * clear all history information for a particular quiz
	 * @param quizID
	 * @throws SQLException
	 */
	public static void removeQuizHistory(String quizID) throws SQLException {
		DBConnection database = new DBConnection();
		String sql = "DELETE FROM QuizRecord WHERE QuizID = \"" + quizID + "\";";
		database.getStmt().executeUpdate(sql);
		database.getCon().close();
	}
	
	/**
	 * get the number of users
	 * @return
	 * @throws SQLException
	 */
	public static int getUserNumber() throws SQLException {
		DBConnection database = new DBConnection();
		String sql = "SELECT Count(*) FROM Users;";
		ResultSet res = database.getStmt().executeQuery(sql);
		database.getCon().close();
		res.next();
		return res.getInt(1);
	}
	
	/**
	 * get the number of quizzes taken
	 * @return
	 * @throws SQLException
	 */
	public static int getQuizTakenNumber() throws SQLException {
		DBConnection database = new DBConnection();
		String sql = "SELECT COUNT(DISTINCT QuizID) FROM QuizRecord;";
		ResultSet res = database.getStmt().executeQuery(sql);
		database.getCon().close();
		res.next();
		return res.getInt(1);
	}
}
