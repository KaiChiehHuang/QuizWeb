package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MultiChoice extends Problem {
	String[] choices;
	int count;
	
	/**
	 * Override the constructor of Problem.class
	 * This will fetch the additional values from database
	 * @param id questionID
	 */
	public MultiChoice(String id) {
		super(id);
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT Choices, Count FROM " + Problem.problemType.get(questionID.substring(0,2)) + " WHERE QuestionID = \"" + questionID + "\";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.choices = res.getString(1).split("\\|");
				this.count = res.getInt(2);
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * This constructor is used to create a new problem that is not in the database
	 * @param type Please pass me the abbreviation of the problem type
	 * e.g. for "QuestionResponse", pass in "QR"; for "MultiChoice", pass in "MC"
	 * each type contains exactly 2 characters, you can refer to Problem.problemType
	 * @param creating TRUE for creating a new problem, FALSE if not
	 * Please always pass true if you are creating a new problem instead of modifying one
	 */
	public MultiChoice(String type, boolean creating) {
		super(type, creating);
	}
	
	/**
	 * Override the getScore() method
	 * returns how many sub-problems are answered right
	 * the result is up to count
	 */
	@Override
	public int getScore() {
		int total = 0;
		String[] userAnswers = userAnswer.split("\\|");
		for (int i = 0; i < answers.length; i++) {
			String[] temp = answers[i].split("#");
			for (int k = 0; k < temp.length; k++) {
				for (int j = 0; j < userAnswers.length; j++) {
					if (temp[k].toLowerCase().equals(userAnswers[j].toLowerCase())) {
						total++;
					}
				}
			}
		}
		return total;	
	}
	
	/**
	 * @return a array of String containing all the possible choices
	 */
	public String[] getChoices() {
		return choices;
	}
	
	/**
	 * set the choices of this problem to be the input String
	 * @param choice each choice is separated by "|" and then be concatenated
	 */
	public void setChoices(String choice) {
		this.choices = choice.split("\\|");
	}
	
	/**
	 * @return the number of right answers
	 */
	public int getCount() {
		return count;
	}
	
	/**
	 * set the number of right answers
	 * @param count the number of right answers
	 */
	public void setCount(int count) {
		this.count = count;
	}
	
	/**
	 * return the insert statement to insert this problem into database
	 * used for creating a problem
	 */
	@Override
	public String getInsertSQL() {
		String answer = getArrayToString(answers);
		String choice = getArrayToString(choices);
		String sql = "INSERT INTO " + this.type + " VALUES(\"" + this.questionID + "\",\"" + this.question.replace("\"", "\"\"") + "\",\"" + choice.replace("\"", "\"\"") + "\",\"" + answer.replace("\"", "\"\"") + "\"," + count + ");";
		return sql;
	}
	
	/**
	 * return the update statement to update this problem in the database
	 * used for modifying a problem
	 */
	@Override
	public String getUpdateSQL() {
		String answer = getArrayToString(answers);
		String choice = getArrayToString(choices);
		String sql = "UPDATE " + this.type+ " SET Question = \"" + this.question.replace("\"", "\"\"") + "\", Answer = \"" + answer.replace("\"", "\"\"") + "\", Choices = \"" + choice.replace("\"", "\"\"") + "\", Count = " + count + " WHERE QuestionID = \"" + this.questionID + "\";";
		return sql;
	}
}
