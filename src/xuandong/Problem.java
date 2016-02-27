package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class Problem {
	String question;
	String[] answers;
	String userAnswer;
	String questionID;
	
	DBConnection database;
	
	public Problem(String questionID) {
		database = new DBConnection();
		this.questionID = questionID;
		try {
			Statement stmt = database.getStmt();
			String sql = "SELECT Question, Answer FROM " + Problem.problemType.get(questionID.substring(0,2)) + " WHERE QuestionID = \"" + questionID + "\";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.question = res.getString(1);
				this.answers = res.getString(2).split("|");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static final HashMap<String, String> problemType = new HashMap<String, String>() {
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		{
			problemType.put("QR", "QuestionResponse");
			problemType.put("SC", "SingleChoice");
			problemType.put("FB", "FillBlank");
			problemType.put("PR", "PictureResponse");
			problemType.put("MC", "MultiChoice");
			problemType.put("MR", "MultiResponse");
		}
	};
	
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
	
	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}
	
	public String getQuestion() {
		return question;
	}
	
	public String[] getAnswer() {
		return answers;
	}
	
	public String getQuestionID() {
		return questionID;
	}
}