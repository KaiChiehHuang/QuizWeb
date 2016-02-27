package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MultiResponse extends Problem {
	int count;
	
	String[] choices;
	
	public MultiResponse(String id) {
		super(id);
		try {
			Statement stmt = database.getStmt();
			String sql = "SELECT Count FROM " + Problem.problemType.get(questionID.substring(0,2)) + " WHERE QuestionID = " + questionID + ";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.count = res.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int getScore() {
		int sum = 0;
		String[] userAnswers = userAnswer.split("|");
		for (int i = 0; i < answers.length; i++) {
			String[] temp = answers[i].split("#");
			for (int k = 0; k < temp.length; k++) {
				for (int j = 0; j < userAnswers.length; j++) {
					if (temp[k].toLowerCase().equals(userAnswers[j].toLowerCase())) {
						sum++;
						break;
					}
				}
			}
		}
		return sum;	
	}
}
