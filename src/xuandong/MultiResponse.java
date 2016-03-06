package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MultiResponse extends Problem {
	int count;
	
	/**
	 * Override the constructor of Problem.class
	 * This will fetch the additional values from database
	 * @param id questionID
	 */
	public MultiResponse(String id) {
		super(id);
		try {
			Statement stmt = database.getStmt();
			String sql = "SELECT Count FROM " + Problem.problemType.get(questionID.substring(0,2)) + " WHERE QuestionID = \"" + questionID + "\";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.count = res.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
	 * Override the getScore() method
	 * returns how many sub-problems are answered right
	 * the result is up to count
	 */
	@Override
	public int getScore() {
		int sum = 0;
		String[] userAnswers = userAnswer.split("\\|");
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
	
	/**
	 * return the insert statement to insert this problem into database
	 * used for creating a problem
	 */
	@Override
	public String getInsertSQL() {
		String answer = getArrayToString(answers);
		String sql = "INSERT INTO " + Problem.problemType.get(type) + " VALUES(\"" + this.questionID + "\",\"" + this.question + "\",\"" + answer + "\"," + count + "\");";
		return sql;
	}
	
	/**
	 * return the update statement to update this problem in the database
	 * used for modifying a problem
	 */
	@Override
	public String getUpdateSQL() {
		String answer = getArrayToString(answers);
		String sql = "UPDATE " + Problem.problemType.get(type) + " SET Question = \"" + this.question + "\" , Answer = \"" + answer + "\", Count = " + count + " WHERE QuestionID = \"" + this.questionID + "\";";
		return sql;
	}
}
