package bian;

import java.sql.*;
import java.util.*;


public class User {
	private Statement stmt;
	private ResultSet rs;
	private String id;
	private String name;
	private String gender;
	private String age;
	private LinkedList<String> friends;
	private String[] achievements;
	
	User(String id, Statement stmt) {
		this.id = id;
		try {
			rs = stmt.executeQuery("SELECT * FROM users WHERE id = " + "\"" + id + "\";");
			name = rs.getString("name");
			gender = rs.getString("gender");
			age = rs.getString("age");
			achievements = rs.getString("achievements").split(",");
			
			// Select from friends table.
			friends = new LinkedList<String>();
			rs = stmt.executeQuery("SELECT * FROM friendship WHERE user1 = " + "\"" + id + "\";");
			while (rs.next()) {
				String friend = rs.getString("use2");
				friends.add(friend);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Get user's id
	 * @return id
	 */
	public String getID() {
		return id;
	}
	
	/**
	 * Get user's gender
	 * @return gender
	 */
	public String getGender() {
		return gender;
	}
	
	/**
	 * Get user's name
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * Get user's age
	 * @return age
	 */
	public String getAge() {
		return name;
	}
	
	/**
	 * Get user's achievements
	 * @return String[] achievements
	 */
	public String[] getAchievements() {
		return achievements;
	}
	
	/**
	 * Get user's friends
	 * @return LinkedList friends。
	 */
	public LinkedList<String> getFriends() {
		return friends;
	}
	
	/**
	 * Set user's gender
	 * @param gender
	 */
	public void setGender(String gender) {
		try {
			stmt.executeUpdate("UPDATE users SET gender = \"" + gender 
					+ "\" WHERE id = \"" + id + "\";");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Set user's name
	 * @param name
	 */
	public void setName(String name) {
		try {
			stmt.executeUpdate("UPDATE users SET name = \"" + name 
					+ "\" WHERE id = \"" + id + "\";");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Add user's achievement
	 * @param a new achievement
	 */
	public void addAchievement(String achievement) {
		try {
			rs = stmt.executeQuery("SELECT * FROM users WHERE id = " + "\"" + id + "\";");
			String original = rs.getString("achievements");
			String new_ach;
			if (original.equals("")) {
				new_ach = achievement;
			} else {
				new_ach = original + "," + achievement;
			}
			stmt.executeUpdate("UPDATE users SET achievements = \"" + new_ach 
					+ "\" WHERE id = \"" + id + "\";");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Add friend to friends table.
	 * @param friendID
	 */
	public void addFriend(String friendID) {
		try {
			stmt.executeUpdate("INSERT INTO friendship(user1, user2) VALUES(\"" + id + "\",\"" + friendID + "\");");
			stmt.executeUpdate("INSERT INTO friendship(user1, user2) VALUES(\"" + friendID + "\",\"" + id + "\");");
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
			stmt.executeUpdate("DELETE FROM friendship WHERE user1 = \"" + id + "\";");
			stmt.executeUpdate("DELETE FROM friendship WHERE user2 = \"" + id + "\";");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void getHistory() {
		
	}
}
