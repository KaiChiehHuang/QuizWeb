package bian;

import xuandong.*;
import java.sql.*;
import java.util.*;

public class User {
	private Statement stmt;
	private ResultSet rs;
	private String id;
	private String name;
	private String gender;
	private int age;
	private ArrayList<String> friends;
	private String[] achievements;

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
					"SELECT Name, Age, Gender, Achievement FROM Users WHERE UserID = " + "\"" + id + "\";");
			name = rs.getString("Name");
			age = rs.getInt("Age");
			gender = rs.getString("Gender");
			achievements = rs.getString("Achievement").split("|");

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
	public String getAge() {
		return name;
	}

	/**
	 * Get user's achievements
	 * 
	 * @return String[] achievements
	 */
	public String[] getAchievements() {
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
	 * 
	 * @param a
	 *            new achievement
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
			stmt.executeUpdate("DELETE FROM Friendship WHERE User1ID = \"" + id + "\";");
			stmt.executeUpdate("DELETE FROM Friendship WHERE User2ID = \"" + id + "\";");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
