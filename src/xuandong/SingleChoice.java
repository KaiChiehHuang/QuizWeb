package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SingleChoice extends Problem {
	String[] choices;
	
	public SingleChoice(String id) {
		super(id);
		try {
			Statement stmt = database.getStmt();
			String sql = "SELECT Choices FROM " + Problem.problemType.get(questionID.substring(0,2)) + " WHERE QuestionID = " + questionID + ";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.choices = res.getString(1).split("|");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String[] getChoices() {
		return choices;
	}
}
