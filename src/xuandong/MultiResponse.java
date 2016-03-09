package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MultiResponse extends Problem {
	int count;
	boolean ordered;
	
	/**
	 * Override the constructor of Problem.class
	 * This will fetch the additional values from database
	 * @param id questionID
	 */
	public MultiResponse(String id) {
		super(id);
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT Count, Ordered FROM " + Problem.problemType.get(questionID.substring(0,2)) + " WHERE QuestionID = \"" + questionID + "\";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.count = res.getInt("Count");
				this.ordered = res.getBoolean("Ordered");
			}
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public MultiResponse(String type, boolean creating) {
		super(type, creating);
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
	 * @return is this problem's answer is ordered
	 */
	public boolean getOrdered() {
		return this.ordered;
	}
	
	/**
	 * set the problem's answer is ordered or not
	 * @param TRUE for ordered, FALSE for unordered
	 */
	public void setOrdered(boolean value) {
		this.ordered = value;
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
				if (!ordered) {
					for (int j = 0; j < userAnswers.length; j++) {
						if (temp[k].toLowerCase().equals(userAnswers[j].toLowerCase())) {
							sum++;
							break;
						}
					}
				} else {
					if (temp[k].toLowerCase().equals(userAnswers[k].toLowerCase())) {
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
		String sql = "INSERT INTO " + this.type + " VALUES(\"" + this.questionID + "\",\"" + this.question + "\",\"" + answer + "\"," + count + "," + ordered + ");";
		return sql;
	}
	
	/**
	 * return the update statement to update this problem in the database
	 * used for modifying a problem
	 */
	@Override
	public String getUpdateSQL() {
		String answer = getArrayToString(answers);
		String sql = "UPDATE " + this.type + " SET Question = \"" + this.question + "\", Answer = \"" + answer + "\", Count = " + count + ", Ordered = " + ordered + " WHERE QuestionID = \"" + this.questionID + "\";";
		return sql;
	}
}
