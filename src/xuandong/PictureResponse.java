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
	 * Simple constructor, for creating prblem
	 * @param type
	 * @param creating
	 */
	public PictureResponse(String type, boolean creating) {
		super(type, creating);
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
		String sql = "INSERT INTO " + this.type + " VALUES(\"" + this.questionID + "\",\"" + this.question.replace("\"", "\"\"") + "\",\"" + this.url.replace("\"", "\"\"") + "\",\"" + answer + "\");";
		return sql;
	}
	
	
	/**
	 * return the update statement to update this problem in the database
	 * used for modifying a problem
	 */
	@Override
	public String getUpdateSQL() {
		String answer = getArrayToString(answers);
		String sql = "UPDATE " + this.type + " SET Question = \"" + this.question.replace("\"", "\"\"") + "\" , Answer = \"" + answer.replace("\"", "\"\"") + "\", URL = " + this.url.replace("\"", "\"\"") + " WHERE QuestionID = \"" + this.questionID + "\";";
		return sql;
	}
}
