package bian;

import java.sql.*;
import java.util.*;
import xuandong.*;

public class User {
	private int age;
	
	private String id;
	private String name;
	private String gender;
	
	private ResultSet rs;
	
	private Statement stmt;
	
	private ArrayList<String> friends;
	private ArrayList<Achievement> achievements;

	/**
	 * Simple constructor, used for not passing a statement
	 * @param id
	 */
	public User(String id) {
		this.id = id;
		try {
			DBConnection database = new DBConnection();
			rs = database.getStmt().executeQuery(
					"SELECT Name, Age, Gender FROM Users WHERE UserID = " + "\"" + id.replace("\"", "\"\"") + "\";");
			rs.next();
			name = rs.getString("Name");
			age = rs.getInt("Age");
			gender = rs.getString("Gender");
			fetchAchievement();
			friends = new ArrayList<String>();
			rs = database.getStmt().executeQuery("SELECT User2ID FROM Friendship WHERE User1ID = \"" + id.replace("\"", "\"\"") + "\" AND Pending = " + false + ";");
			while (rs.next()) {
				String friend = rs.getString("User2ID");
				friends.add(friend);
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * Simple constructor Will fetch the name, age, gender, achievement, friend
	 * information from the database
	 * @param id UserID
	 * @param stmt Database statement
	 */
	User(String id, Statement stmt) {
		this.id = id;
		try {
			rs = stmt.executeQuery(
					"SELECT Name, Age, Gender FROM Users WHERE UserID = \"" + id.replace("\"", "\"\"") + "\";");
			rs.next();
			name = rs.getString("Name");
			age = rs.getInt("Age");
			gender = rs.getString("Gender");
			fetchAchievement();
			friends = new ArrayList<String>();
			rs = stmt.executeQuery("SELECT User2ID FROM Friendship WHERE User1ID = \"" + id.replace("\"", "\"\"") + "\" AND Pending = " + false + ";");
			while (rs.next()) {
				String friend = rs.getString("User2ID");
				friends.add(friend);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * Get UserID
	 */
	public String getID() {
		return id;
	}

	
	/**
	 * Get user's gender
	 * 
	 * @return gender
	 */
	public String getGender() {
		return gender;
	}

	
	/**
	 * Get user's name
	 */
	public String getName() {
		return name;
	}

	
	/**
	 * Get user's age
	 */
	public int getAge() {
		return age;
	}

	
	/**
	 * Set User's age
	 * 
	 * @param age
	 */
	public void setAge(int age) {
		try{
			DBConnection database = new DBConnection();
			database.getStmt().executeUpdate("UPDATE Users SET Age = " + age + " WHERE UserID = \"" + id.replace("\"", "\"\"") + "\";");
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * Get user's achievements
	 * 
	 * @return
	 */
	public ArrayList<Achievement> getAchievements() {
		return achievements;
	}

	
	/**
	 * Get user's friends
	 * 
	 * @return LinkedList friends。
	 */
	public ArrayList<String> getFriends() {
		return friends;
	}

	
	/**
	 * Set user's gender
	 */
	public void setGender(String gender) {
		try {
			DBConnection database = new DBConnection();
			database.getStmt().executeUpdate("UPDATE Users SET Gender = \"" + gender + "\" WHERE UserID = \"" + id.replace("\"", "\"\"") + "\";");
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * Set user's name
	 * 
	 * @param name
	 */
	public void setName(String name) {
		try {
			DBConnection database = new DBConnection();
			database.getStmt().executeUpdate("UPDATE Users SET Name = \"" + name.replace("\"", "\"\"") + "\" WHERE UserID = \"" + id.replace("\"", "\"\"") + "\";");
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * Remove friend in friends table.
	 * @param friendID
	 */
	public void removeFriend(String friendID) {
		try {
			DBConnection database = new DBConnection();
			database.getStmt().executeUpdate("DELETE FROM Friendship WHERE User1ID = \"" + id.replace("\"", "\"\"") + "\" AND User2ID = \"" + friendID.replace("\"", "\"\"") + "\";");
			database.getStmt().executeUpdate("DELETE FROM Friendship WHERE User2ID = \"" + id.replace("\"", "\"\"") + "\" AND User1ID = \"" + friendID.replace("\"", "\"\"") + "\";");
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * Send a friend request to a user
	 * @param User2ID
	 */
	public void sendFriendRequest(String User2ID) {
		try {
			DBConnection database = new DBConnection();
			ResultSet res = database.getStmt().executeQuery("SELECT * FROM Friendship WHERE User1ID = \"" + this.id.replace("\"", "\"\"") + "\" AND User2ID = \"" + User2ID.replace("\"", "\"\"") + "\";");
			if (!res.next()) {
				database.getStmt().executeUpdate("INSERT INTO Friendship (User1ID, User2ID, Pending) VALUES (\"" + id.replace("\"", "\"\"") + "\",\"" + User2ID.replace("\"", "\"\"") + "\"," + true + ");");
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * Accept a friend request and update the database
	 * @param pendingUserID
	 */
	public void acceptFriendRequest(String pendingUserID) {
		try {
			DBConnection database = new DBConnection();
			database.getStmt().executeUpdate("DELETE FROM Friendship WHERE User1ID = \"" + this.id.replace("\"", "\"\"") + "\" AND User2ID = \"" + pendingUserID.replace("\"", "\"\"") + "\";");
			database.getStmt().executeUpdate("DELETE FROM Friendship WHERE User2ID = \"" + this.id.replace("\"", "\"\"") + "\" AND User1ID = \"" + pendingUserID.replace("\"", "\"\"") + "\";");
			database.getStmt().executeUpdate("INSERT INTO Friendship (User1ID, User2ID, Pending) VALUES (\"" + id.replace("\"", "\"\"") + "\",\"" + pendingUserID.replace("\"", "\"\"") + "\"," + false + ");");
			database.getStmt().executeUpdate("INSERT INTO Friendship (User1ID, User2ID, Pending) VALUES (\"" + pendingUserID.replace("\"", "\"\"") + "\",\"" + id.replace("\"", "\"\"") + "\"," + false + ");");
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * Decline a friend request and update the database
	 * @param pendingUserID
	 */
	public void declineFriendRequest(String pendingUserID) {
		try {
			DBConnection database = new DBConnection();
			database.getStmt().executeUpdate("DELETE FROM Friendship WHERE User1ID = \"" + pendingUserID.replace("\"", "\"\"") + "\" AND User2ID = \"" + this.id.replace("\"", "\"\"") + "\" AND Pending = " + true + ";");
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * return a list of users who has requested friendship to current user
	 * @return
	 */
	public ArrayList<User> getFriendRequests() {
		ArrayList<User> pendingFriends = new ArrayList<User>();
		try {
			DBConnection database = new DBConnection();
			String sql = "SELECT User1ID FROM Friendship WHERE User2ID = \"" + this.id.replace("\"", "\"\"") + "\" AND Pending = " + true + ";";
			ResultSet res = database.getStmt().executeQuery(sql);
			while (res.next()) {
				User temp = new User(res.getString("User1ID"));
				pendingFriends.add(temp);
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pendingFriends;
	}

	
	/**
	 * Get all the achievements of this user
	 * @return A list of achievements
	 */
	private void fetchAchievement() {
		achievements = new ArrayList<Achievement>();
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT UserID, QuizID, Time, AchievementName FROM Achievement WHERE UserID = \"" + id.replace("\"", "\"\"") + "\" ORDER BY Time ASC;";
			ResultSet res = stmt.executeQuery(sql);
			while (res.next()) {
				Achievement temp = new Achievement();
				temp.setUserID(id);
				temp.setQuizID(res.getString("QuizID"));
				temp.setAchievementName(res.getString("AchievementName"));
				temp.setTime(res.getString("Time"));
				temp.setDescription();
				achievements.add(temp);
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * Get 6 most recently attained achievements of this user's friends
	 * @return A list of achievements
	 */
	public ArrayList<Achievement> getFriendAchievement() {
		ArrayList<Achievement> achis = new ArrayList<Achievement>();
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT F.User2ID AS UserID, A.QuizID AS QuizID, A.Time AS Time, A.AchievementName FROM Achievement AS A, Friendship AS F WHERE F.User1ID = \""
					+ id.replace("\"", "\"\"") + "\" AND A.UserID = F.User2ID ORDER BY A.Time DESC LIMIT 6;";
			ResultSet res = stmt.executeQuery(sql);
			while (res.next()) {
				Achievement temp = new Achievement();
				temp.setUserID(res.getString("UserID"));
				temp.setQuizID(res.getString("QuizID"));
				temp.setAchievementName(res.getString("AchievementName"));
				temp.setTime(res.getString("Time"));
				temp.setDescription();
				achis.add(temp);
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return achis;
	}

	
	/**
	 * get 6 quizzes that the user recently took if you want to get the quiz
	 * name, please call Quiz.getName(quizID)
	 * @return a list of performance
	 * @throws SQLException
	 */
	public ArrayList<Performance> getRecentTakenQuiz() throws SQLException {
		ArrayList<Performance> recentQuizs = new ArrayList<Performance>();
		DBConnection database = new DBConnection();
		String sql = "SELECT QuizID, Score, StartTime, Duration FROM QuizRecord WHERE UserID = \"" + id.replace("\"", "\"\"")
				+ "\" ORDER BY StartTime DESC LIMIT 6";
		ResultSet res = database.getStmt().executeQuery(sql);
		while (res.next()) {
			String quizID = res.getString("QuizID");
			double score = res.getDouble("Score");
			String startTime = res.getString("StartTime");
			String duration = res.getString("Duration");
			Performance temp = new Performance(quizID, this.id, startTime, duration, score);
			recentQuizs.add(temp);
		}
		database.getCon().close();
		return recentQuizs;
	}
	
	
	/**
	 * get 6 quizzes that the user's friends recently took
	 * if you want to get the quiz name, please call Quiz.getName(quizID)
	 * @return a list of performance
	 * @throws SQLException
	 */
	public ArrayList<Performance> getFriendRecentTakenQuiz() throws SQLException {
		ArrayList<Performance> recentQuizs = new ArrayList<Performance>();
		DBConnection database = new DBConnection();
		String sql = "SELECT R.UserID AS UserID, R.QuizID AS QuizID, R.Score AS Score, R.StartTime AS StartTime, R.Duration AS Duration FROM QuizRecord AS R, Friendship AS F WHERE F.User1ID = \"" + id.replace("\"", "\"\"")
				+ "\" AND F.User2ID = R.UserID ORDER BY R.StartTime DESC LIMIT 6;";
		ResultSet res = database.getStmt().executeQuery(sql);
		while (res.next()) {
			String userID = res.getString("UserID");
			String quizID = res.getString("QuizID");
			double score = res.getDouble("Score");
			String startTime = res.getString("StartTime");
			String duration = res.getString("Duration");
			Performance temp = new Performance(quizID, userID, startTime, duration, score);
			recentQuizs.add(temp);
		}
		database.getCon().close();
		return recentQuizs;
	}

	
	/**
	 * get 6 quizzes that the user recently created
	 * @return a list of quizzes
	 * @throws SQLException
	 */
	public ArrayList<Quiz> getRecentCreatedQuiz() throws SQLException {
		ArrayList<Quiz> recentQuizs = new ArrayList<Quiz>();
		DBConnection database = new DBConnection();
		String sql = "SELECT QuizID FROM Quiz WHERE AuthorID = \"" + id.replace("\"", "\"\"") + "\" ORDER BY Time DESC LIMIT 6";
		ResultSet res = database.getStmt().executeQuery(sql);
		while (res.next()) {
			String quizID = res.getString("QuizID");
			Quiz temp = new Quiz();
			temp.setQuizID(quizID);
			recentQuizs.add(temp);
		}
		database.getCon().close();
		return recentQuizs;
	}
	
	
	/**
	 * get 6 quizzes that the user's friends recently created
	 * @return a list of quizzes
	 * @throws SQLException
	 */
	public ArrayList<Quiz> getFriendRecentCreatedQuiz() throws SQLException {
		ArrayList<Quiz> recentQuizs = new ArrayList<Quiz>();
		DBConnection database = new DBConnection();
		String sql = "SELECT Q.QuizID AS QuizID FROM Quiz AS Q, Friendship AS F WHERE Q.AuthorID = F.User2ID AND F.User1ID = \"" + id.replace("\"", "\"\"") + "\" ORDER BY Q.Time DESC LIMIT 6";
		ResultSet res = database.getStmt().executeQuery(sql);
		while (res.next()) {
			String quizID = res.getString("QuizID");
			Quiz temp = new Quiz();
			temp.setQuizID(quizID);
			recentQuizs.add(temp);
		}
		database.getCon().close();
		return recentQuizs;
	}
	
	
	/**
	 * Return a list of all performance on quizzes
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<Performance> getQuizHistory() throws SQLException {
		ArrayList<Performance> result = new ArrayList<Performance>();
		DBConnection database = new DBConnection();
		String sql = "SELECT QuizID, StartTime, Duration, Score FROM QuizRecord WHERE UserID = \"" + this.id.replace("\"", "\"\"") + "\";";
		ResultSet res = database.getStmt().executeQuery(sql);
		while (res.next()) {
			String quizID = res.getString("QuizID");
			double score = res.getDouble("Score");
			String startTime = res.getString("StartTime");
			String duration = res.getString("Duration");
			Performance temp = new Performance(quizID, this.id, startTime, duration, score);
			result.add(temp);
		}
		database.getCon().close();
		return result;
	}
	
	
	/**
	 * Search a user by his name or his id
	 * @param keyword
	 * @return
	 * @throws SQLException
	 */
	public static ArrayList<User> serachUser(String keyword) throws SQLException {
		ArrayList<User> users = new ArrayList<User>();
		DBConnection database = new DBConnection();
		ResultSet res = database.getStmt().executeQuery("SELECT DISTINCT UserID FROM Users WHERE (UserID LIKE \"%" + keyword.replace("\"", "\"\"") + "%\" OR Name LIKE \"%" + keyword.replace("\"", "\"\"") + "%\") AND UserID <> \"Guest\" AND UserID <> \"Administration\";");
		while (res.next()) {
			User temp = new User(res.getString("UserID"));
			users.add(temp);
		}
		database.getCon().close();
		return users;
	}
	
	
	/**
	 * Check if two person is friend or not, the order doesn't matter
	 * @param user1ID
	 * @param user2ID
	 * @return TRUE for friends, FALSE for not friends
	 * @throws SQLException
	 */
	public static boolean checkFriend(String user1ID, String user2ID) throws SQLException {
		boolean result = false;
		DBConnection database = new DBConnection();
		ResultSet res1 = database.getStmt().executeQuery("SELECT * FROM Friendship WHERE User1ID = \"" + user1ID.replace("\"", "\"\"") + "\" AND User2ID = \"" + user2ID.replace("\"", "\"\"") + "\" AND Pending = " + false + ";");
		if (res1.next()) {
			ResultSet res2 = database.getStmt().executeQuery("SELECT * FROM Friendship WHERE User2ID = \"" + user1ID.replace("\"", "\"\"") + "\" AND User1ID = \"" + user2ID.replace("\"", "\"\"") + "\" AND Pending = " + false + ";");
			if (res2.next()) {
				result = true;
			}
		}
		database.getCon().close();
		return result;
	}
	
	
	/**
	 * Check if user has sent a friend request to a person
	 * @param userID
	 * @param personYouWantToAdd
	 * @return TRUE for already sent, FALSE for not sent yet
	 * @throws SQLException
	 */
	public static boolean checkFriendRequest(String userID, String personYouWantToAdd) throws SQLException {
		boolean result = false;
		DBConnection database = new DBConnection();
		ResultSet res = database.getStmt().executeQuery("SELECT * FROM Friendship WHERE User1ID = \"" + userID.replace("\"", "\"\"") + "\" AND User2ID = \"" + personYouWantToAdd.replace("\"", "\"\"") + "\" AND Pending = " + true + ";");
		if (res.next()) {
			result = true;
		}
		database.getCon().close();
		return result;
	}
}
