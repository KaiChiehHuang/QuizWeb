package bian;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

import xuandong.DBConnection;

public class AccountManager {
	private Statement stmt;
	private ResultSet rs;
	private MessageDigest md;
	
	
	public AccountManager(Statement stmt) throws SQLException {
		this.stmt = stmt;
		rs = stmt.executeQuery("SELECT * FROM Users");
	}
	
	
	/**
	 * Check before creating account and login, if this account exist.
	 * @param id
	 * @return if the account exist.
	 */
	public boolean accountExist(String id) {
		try {
			rs = stmt.executeQuery("SELECT * FROM Users WHERE UserID = " + "\"" + id.replace("\"", "\"\"") + "\";");
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	/**
	 * Create account.
	 * @param String id.
	 * @param String password.
	 */
	public void createAccount(String id, String password) {
		password = hashSHAPassword(password);
		try {
			stmt.executeUpdate("INSERT INTO Users(UserID, Password) VALUES(\"" + id.replace("\"", "\"\"") + "\",\"" + password + "\");");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Check if password and id are matched. Used to login.
	 * @param String id.
	 * @param String password.
	 */
	public boolean idPasswordMatch(String id, String password) {
		password = hashSHAPassword(password);
		try {
			rs = stmt.executeQuery("SELECT * FROM Users WHERE UserID = \"" + id.replace("\"", "\"\"") + "\";");
			rs.absolute(1);
			String right_password = rs.getString("Password");
			if (right_password.equals(password)) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * Change password for an id.
	 * @param String id.
	 * @param String password.
	 */
	public void changePassword(String id, String ps_new) {
		String password = hashSHAPassword(ps_new);
		try {
			stmt.executeUpdate("UPDATE Users SET Password = \"" + password 
					+ "\" WHERE UserID = \"" + id.replace("\"", "\"\"") + "\";");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Delete account.
	 * @param String id.
	 */
	public void removeAccount(String id) {
		try {
			stmt.executeUpdate("DELETE FROM Users WHERE UserID = \"" + id.replace("\"", "\"\"") + "\";");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	/*
	 Given a plain text string, produces a SHA coded password.
	*/
	private String hashSHAPassword(String pw) {
		byte[] byte_pw = pw.getBytes();
		try {
			md = MessageDigest.getInstance("SHA");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		md.reset();
		md.update(byte_pw);
		byte[] result = md.digest();
		return hexToString(result);
	}
	
	/*
	 Given a byte[] array, produces a hex String,
	 such as "234a6f". with 2 chars for each byte in the array.
	 (provided code)
	*/
	public static String hexToString(byte[] bytes) {
		StringBuffer buff = new StringBuffer();
		for (int i=0; i<bytes.length; i++) {
			int val = bytes[i];
			val = val & 0xff;  // remove higher bits, sign
			if (val<16) buff.append('0'); // leading 0
			buff.append(Integer.toString(val, 16));
		}
		return buff.toString();
	}
	
	/**
	 * Check if a given userID is a administrator
	 * @param userID
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	public boolean checkAdmin(String userID, String password) {
		boolean result = false;
		try {
			ResultSet res = stmt.executeQuery("SELECT * FROM Administrator WHERE AdminID = \"" + userID + "\";");
			if (res.next()) {
				password = hashSHAPassword(password);
				rs = stmt.executeQuery("SELECT Password FROM Users WHERE UserID = \"" + userID.replace("\"", "\"\"") + "\";");
				rs.next();
				String right_password = rs.getString("Password");
				if (right_password.equals(password)) {
					result = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
