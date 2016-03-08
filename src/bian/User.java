package bian;

import java.sql.*;
import java.util.*;

import xuandong.*;

public class User {
	private Statement stmt;
	private ResultSet rs;
	private String id;
	private String name;
	private String gender;
	private int age;
	private ArrayList<String> friends;
	private ArrayList<Achievement> achievements;

	public User(String id) {
		this.id = id;
		try {
			DBConnection database = new DBConnection();
			rs = database.getStmt().executeQuery(
					"SELECT Name, Age, Gender FROM Users WHERE UserID = " + "\"" + id + "\";");
			name = rs.getString("Name");
			age = rs.getInt("Age");
			gender = rs.getString("Gender");
//			achievements = rs.getString("Achievement").split("\\|");
			fetchAchievement();
			// Select from friends table.
			friends = new ArrayList<String>();
			rs = database.getStmt().executeQuery("SELECT User2ID FROM Friendship WHERE User1ID = \"" + id + "\";");
			while (rs.next()) {
				String friend = rs.getString("User2ID");
				friends.add(friend);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Simple constructor Will fetch the name, age, gender, achievement, friend
	 * information from the database
	 * 
	 * @param id
	 *            UserID
	 * @param stmt
	 *            Database statement
	 */
	User(String id, Statement stmt) {
		this.id = id;
		try {
			rs = stmt.executeQuery(
					"SELECT Name, Age, Gender FROM Users WHERE UserID = " + "\"" + id + "\";");
			name = rs.getString("Name");
			age = rs.getInt("Age");
			gender = rs.getString("Gender");
//			achievements = rs.getString("Achievement").split("\\|");
			fetchAchievement();
			// Select from friends table.
			friends = new ArrayList<String>();
			rs = stmt.executeQuery("SELECT User2ID FROM Friendship WHERE User1ID = \"" + id + "\";");
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
		this.age = age;
	}
	
	/**
	 * @return a list of this user's achievements
	 */
	public ArrayList<Achievement> getAchievement() {
		return this.achievements;
	}

	/**
	 * Get user's achievements
	 * 
	 * @return String[] achievements
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
			stmt.executeUpdate("UPDATE Users SET Gender = \"" + gender + "\" WHERE UserID = \"" + id + "\";");
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
			stmt.executeUpdate("UPDATE Users SET Name = \"" + name + "\" WHERE UserID = \"" + id + "\";");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Add user's achievement
	 * @param achievement
	 */
	public void addAchievement(String achievement) {
		try {
			rs = stmt.executeQuery("SELECT * FROM Users WHERE UserID = \"" + id + "\";");
			String original = rs.getString("achievements");
			String new_ach;
			if (original.equals("")) {
				new_ach = achievement;
			} else {
				new_ach = original + "|" + achievement;
			}
			stmt.executeUpdate("UPDATE Users SET Achievement = \"" + new_ach + "\" WHERE UserID = \"" + id + "\";");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Add friend to friends table.
	 * 
	 * @param friendID
	 */
	public void addFriend(String friendID) {
		try {
			stmt.executeUpdate("INSERT INTO Friendship(User1ID, User2ID) VALUES(\"" + id + "\",\"" + friendID + "\");");
			stmt.executeUpdate("INSERT INTO Friendship(User1ID, User2ID) VALUES(\"" + friendID + "\",\"" + id + "\");");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Remove friend in friends table.
	 * 
	 * @param friendID
	 */
	public void removeFriend(String friendID) {
		try {
			stmt.executeUpdate(
					"DELETE FROM Friendship WHERE User1ID = \"" + id + "\" AND User2ID = \"" + friendID + "\";");
			stmt.executeUpdate(
					"DELETE FROM Friendship WHERE User2ID = \"" + id + "\" AND User1ID = \"" + friendID + "\";");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Send a friend request to a user
	 * 
	 * @param User2ID
	 */
	public void sendFriendRequest(String User2ID) {
		try {
			stmt.executeUpdate("INSERT INTO Friendship (User1ID, User2ID, Pending) VALUES (\"" + id + "\",\"" + User2ID
					+ "\"," + true + ");");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Accept a friend request and update the database
	 * 
	 * @param pendingUserID
	 */
	public void acceptFriendRequest(String pendingUserID) {
		try {
			stmt.executeUpdate("UPDATE Friendship SET Pending = " + false + " WHERE User1ID = \"" + pendingUserID
					+ "\" AND User2ID = \"" + id + "\";");
			stmt.executeUpdate("INSERT INTO Friendship (User1ID, User2ID, Pending) VALUES (\"" + id + "\",\""
					+ pendingUserID + "\"," + false + ");");
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
			String sql = "SELECT User2ID FROM Friendship WHERE User1ID = \"" + this.id + "\" AND Pending = " + true + ";";
			ResultSet res = database.getStmt().executeQuery(sql);
			while (res.next()) {
				User temp = new User(res.getString("User2ID"));
				pendingFriends.add(temp);
			}
			database.getCon().close();
		} catch (SQLException e) {
			// TODO: handle exception
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
			String sql = "SELECT UserID, QuizID, Time, AchievementName FROM Achievement WHERE UserID = \"" + id + "\";";
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
					+ id + "\" AND A.UserID = F.User2ID ORDER BY A.Time LIMIT 6;";
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
		String sql = "SELECT QuizID, Score, StartTime, Duration FROM QuizRecord WHERE UserID = \"" + id
				+ "\" ORDER BY StartTime LIMIT 6";
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
		String sql = "SELECT R.UserID AS UserID, R.QuizID AS QuizID, R.Score AS Score, R.StartTime AS StartTime, R.Duration AS Duration FROM QuizRecord AS R, Friendship AS F WHERE F.User1ID = \"" + id
				+ "\" AND F.User2ID = R.UserID ORDER BY R.StartTime LIMIT 6;";
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
		String sql = "SELECT QuizID FROM Quiz WHERE AuthorID = \"" + id + "\" ORDER BY Time LIMIT 6";
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
		String sql = "SELECT Q.QuizID AS QuizID FROM Quiz AS Q, Friendship AS F WHERE Q.AuthorID = F.User2ID AND F.User1ID = \"" + id + "\" ORDER BY Q.Time LIMIT 6";
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
}
