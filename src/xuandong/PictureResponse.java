package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PictureResponse extends Problem {
	String url;
	
	/**
	 * Override the constructor of Problem.class
	 * This will fetch the additional values from database
	 * @param id questionID
	 */
	public PictureResponse(String questionID) {
		super(questionID);
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT URL FROM " + Problem.problemType.get(questionID.substring(0,2)) + " WHERE QuestionID = \"" + questionID + "\";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.url = res.getString(1);
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @return the url of the image
	 */
	public String getURL() {
		return url;
	}
	
	/**
	 * set the url of this image
	 */
	public void setURL(String url) {
		this.url = url;
	}
	
	/**
	 * return the insert statement to insert this problem into database
	 * used for creating a problem
	 */
	@Override
	public String getInsertSQL() {
		String answer = getArrayToString(answers);
		String sql = "INSERT INTO " + Problem.problemType.get(type) + " VALUES(\"" + this.questionID + "\",\"" + this.question + "\",\"" + this.url + "\",\"" + answer + "\");";
		return sql;
	}
	
	/**
	 * return the update statement to update this problem in the database
	 * used for modifying a problem
	 */
	@Override
	public String getUpdateSQL() {
		String answer = getArrayToString(answers);
		String sql = "UPDATE " + Problem.problemType.get(type) + " SET Question = \"" + this.question + "\" , Answer = \"" + answer + "\", URL = " + this.url + " WHERE QuestionID = \"" + this.questionID + "\";";
		return sql;
	}
}
