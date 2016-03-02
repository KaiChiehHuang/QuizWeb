package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PictureResponse extends Problem {
	String url;
	
	public PictureResponse(String questionID) {
		super(questionID);
		try {
			Statement stmt = database.getStmt();
			String sql = "SELECT URL FROM " + Problem.problemType.get(questionID.substring(0,2)) + " WHERE QuestionID = \"" + questionID + "\";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.url = res.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String getURL() {
		return url;
	}
	
	public void setURL(String url) {
		this.url = url;
	}
	
	@Override
	public String getInsertSQL() {
		String answer = getArrayToString(answers);
		String sql = "INSERT INTO " + Problem.problemType.get(type) + " VALUES(\"" + this.questionID + "\",\"" + this.question + "\",\"" + this.url + "\",\"" + answer + "\");";
		return sql;
	}
	
	@Override
	public String getUpdateSQL() {
		String answer = getArrayToString(answers);
		String sql = "UPDATE " + Problem.problemType.get(type) + " SET Question = \"" + this.question + "\" , Answer = \"" + answer + "\", URL = " + this.url + " WHERE QuestionID = \"" + this.questionID + "\";";
		return sql;
	}
}
