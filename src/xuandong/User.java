package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class User {
	private int age;
	private String name;
	private String gender;
	private String userID;
	private String achievement;
	DBConnection database;
	
	public User(String userID) {
		this.userID = userID;
		database = new DBConnection();
		Statement stmt = database.getStmt();
		try {
			String sql = "SELECT Name, Age, Gender, Achievement FROM Users WHERE UserID = \"" + userID + "\";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.name = res.getString(1);
				this.age = res.getInt(2);
				this.gender = res.getString(3);
				this.achievement = res.getString(4);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getAge() {
		return age;
	}
	
	public String getName() {
		return name;
	}
	
	public String getID() {
		return userID;
	}
	
	public String getGender() {
		return gender;
	}
	
	public String achievement() {
		return achievement;
	}
	
	private void updateSQL(String key, String value) {
		try {
			Statement stmt = database.getStmt();
			String sql = "UPDATE Users SET " + key + " = " + value + " WHERE UserID = \"" + userID + "\";";
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void setAge(int age) {
		this.age = age;
		try {
			Statement stmt = database.getStmt();
			String sql = "UPDATE Users SET Age = " + age + " WHERE UserID = \"" + userID + "\";";
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void setName(String name) {
		this.name = name;
		this.updateSQL("Name", name);
	}
	
	public void setGender(String gender) {
		this.gender = gender;
		this.updateSQL("Gender", gender);
	}
	
	public void setAchievement(String achievement) {
		this.achievement = achievement;
		this.updateSQL("Achievement", achievement);
	}
}
