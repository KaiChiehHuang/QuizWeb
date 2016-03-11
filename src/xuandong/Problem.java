package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;


public class Problem {
	String type;
	String question;
	String userAnswer;
	String questionID;
	
	String[] answers;
	
	boolean creating = false;
	
	
	/**
	 * Save all the problem types for future use
	 */
	public static final HashMap<String, String> problemType = new HashMap<String, String>();
	static
	{
			problemType.put("QR", "QuestionResponse");
			problemType.put("SC", "SingleChoice");
			problemType.put("FB", "FillBlank");
			problemType.put("PR", "PictureResponse");
			problemType.put("MC", "MultiChoice");
			problemType.put("MR", "MultiResponse");
			problemType.put("QuestionResponse", "QR");
			problemType.put("SingleChoice", "SC");
			problemType.put("FillBlank", "FB");
			problemType.put("PictureResponse", "PR");
			problemType.put("MultiChoice", "MC");
			problemType.put("MultiResponse", "MR");
			problemType.put("question-response", "QR");
			problemType.put("fill-in-blank", "FB");
			problemType.put("multiple-choice", "MC");
			problemType.put("picture-response", "PR");
	};
	
	
	/**
	 * This constructor is used to fetch the information of a problem
	 * that is already in the database
	 * @param questionID
	 */
	public Problem(String questionID) {
		this.type = Problem.problemType.get(questionID.substring(0, 2));
		this.questionID = questionID;
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT Question, Answer FROM " + Problem.problemType.get(questionID.substring(0,2)) + " WHERE QuestionID = \"" + questionID + "\";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.question = res.getString(1);
				this.answers = res.getString(2).split("\\|");
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
	public Problem(String type, boolean creating) {
		this.type = Problem.problemType.get(type);
		this.creating = creating;
	}
	
	
	/**
	 * Set the mode to creating a new problem
	 */
	public void setCreating() {
		this.creating = true;
	}
	
	
	/**
	 * Set the mode to modifying an existing problem
	 */
	public void setEditing() {
		this.creating = false;
	}
	
	
	/**
	 * Set the question statement as input String
	 * @param question
	 */
	public void setQuestion(String question) {
		this.question = question;
	}
	
	
	/**
	 * Set the answers as input String
	 * @param answer please separate different answers by "|" and then concatenate them
	 */
	public void setAnswers(String answer) {
		this.answers = answer.split("\\|");
	}
	
	/**
	 * The percent this problem got right
	 * @param  
	 * @return right number/question number
	 */
	public String getCorrectAnswerNumber() {
		int count = getScore();
		return Integer.toString(count) + "/1";
	}
	
	
	/**
	 * Set the problemID, only works if in creating mode
	 * @throws SQLException
	 */
	public String setProblemID() throws SQLException {
		DBConnection database = new DBConnection();
		Statement stmt = database.getStmt(); 
		if (this.creating) {
			String sql = "SELECT QuestionID FROM " + type + " ORDER BY QuestionID DESC LIMIT 1;";
			ResultSet res = stmt.executeQuery(sql);
			if (res.next()) {
				int questionCount = Integer.parseInt(res.getString(1).substring(2));
				questionCount++;
				this.questionID = Problem.problemType.get(this.type) + String.format("%010d", questionCount);
			} else {
				int questionCount = 0;
				this.questionID = Problem.problemType.get(this.type) + String.format("%010d", questionCount);
			}
		}
		database.getCon().close();
		return this.questionID;
	}
	
	
	/**
	 * Update the database to insert a newly created problem or update an existing problem
	 * Please always call this method if you modified any variables of the problem
	 * @throws SQLException
	 */
	public void updateDatabase() throws SQLException {
		DBConnection database = new DBConnection();
		Statement stmt = database.getStmt(); 
		if (this.creating) {
			setProblemID();
			stmt.executeUpdate(getInsertSQL());
		} else {
			stmt.executeUpdate(getUpdateSQL());
		}
		database.getCon().close();
	}
	
	
	/**
	 * return the insert statement to insert this problem into database
	 * used for creating a problem
	 */
	public String getInsertSQL() {
		String answer = getArrayToString(answers);
		String sql = "INSERT INTO " + type + " VALUES(\"" + this.questionID + "\",\"" + this.question.replace("\"", "\"\"") + "\",\"" + answer.replace("\"", "\"\"") + "\");";
		return sql;
	}
	
	
	/**
	 * return the update statement to update this problem in the database
	 * used for modifying a problem
	 */
	public String getUpdateSQL() {
		String answer = getArrayToString(answers);
		String sql = "UPDATE " + type + " SET Question = \"" + this.question.replace("\"", "\"\"") + "\" , Answer = \"" + answer.replace("\"", "\"\"") + "\" WHERE QuestionID = \"" + this.questionID + "\";";
		return sql;
	}
	
	
	/**
	 * Transfer a array of String to a String, elements are concatenated by "|"
	 * @param arr array of String to be concatenated
	 * @return the result String
	 */
	public String getArrayToString(String[] arr) {
		String str = "";
		for (int i = 0; i < arr.length; i++) {
			str += arr[i] + "|";
		}
		str = str.substring(0, str.length() - 1);
		return str;
	}
	

	/**
	 * returns how many sub-problems are answered right
	 * the result is up to count
	 * If there are parallel answers for one problem, this method only one of them
	 */
	public int getScore() {
		int score = 0;
		for (int i = 0; i < answers.length; i++) {
			String[] temp = answers[i].split("#");
			for (int j = 0; j < temp.length; j++) {
				if (temp[j].toLowerCase().equals(userAnswer)) {
					score++;
					break;
				}
			}
		}
		return score;
	}
	
	
	/**
	 * Set the user answer to the input String
	 * If the user has multiple answers, please separate them by "|" and then concatenate them
	 */
	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer.toLowerCase();
	}
	
	
	/**
	 * @return question statement
	 */
	public String getQuestion() {
		return question;
	}
	
	
	/** 
	 * @return problem type
	 */
	public String getType() {
		return type;
	}

	
	/**
	 * @return array of right answers
	 */
	public String[] getAnswer() {
		return answers;
	}
	
	
	/**
	 * @return questionID
	 */
	public String getQuestionID() {
		return questionID;
	}
}