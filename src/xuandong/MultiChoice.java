package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MultiChoice extends Problem {
	String[] choices;
	int count;
	
	public MultiChoice(String id) {
		super(id);
		try {
			Statement stmt = database.getStmt();
			String sql = "SELECT Choices, Count FROM " + Problem.problemType.get(questionID.substring(0,2)) + " WHERE QuestionID = \"" + questionID + "\";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.choices = res.getString(1).split("|");
				this.count = res.getInt(2);
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
			String[] temp = answers[i].split("#");
			for (int k = 0; k < temp.length; k++) {
				for (int j = 0; j < userAnswers.length; j++) {
					if (temp[k].toLowerCase().equals(userAnswers[j].toLowerCase())) {
						count++;
						break;
					}
				}
			}
		}
		return count;	
	}
	
	public String[] getChoices() {
		return choices;
	}
	
	public void setChoices(String choice) {
		this.choices = choice.split("|");
	}
	
	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String getInsertSQL() {
		String answer = getArrayToString(answers);
		String choice = getArrayToString(choices);
		String sql = "INSERT INTO " + Problem.problemType.get(type) + " VALUES(\"" + this.questionID + "\",\"" + this.question + "\",\"" + choice + "\",\"" + answer + "\"," + count + "\");";
		return sql;
	}
	
	@Override
	public String getUpdateSQL() {
		String answer = getArrayToString(answers);
		String choice = getArrayToString(choices);
		String sql = "UPDATE " + Problem.problemType.get(type) + " SET Question = \"" + this.question + "\" , Answer = \"" + answer + "\" , Choices = \"" + choice + "\", Count = " + count + " WHERE QuestionID = \"" + this.questionID + "\";";
		return sql;
	}
}
