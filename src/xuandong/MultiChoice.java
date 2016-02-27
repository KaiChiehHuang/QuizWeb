package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MultiChoice extends Problem {
	String[] choices;
	
	public MultiChoice(String id) {
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
	
	@Override
	public int getScore() {
		int count = 0;
		String[] userAnswers = userAnswer.split("|");
		for (int i = 0; i < answers.length; i++) {
			for (int j = 0; j < userAnswers.length; j++) {
				if (answers[i].toLowerCase().equals(userAnswers[j].toLowerCase())) {
					count++;
				}
			}
		}
		return count;	
	}
	
	public String[] getChoices() {
		return choices;
	}
}
