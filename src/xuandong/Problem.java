package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import sun.nio.cs.ext.TIS_620;

public class Problem {
	String question;
	String[] answers;
	String userAnswer;
	String questionID;
	String type;
	
	boolean creating = false;
	
	DBConnection database;
	
	public Problem(String questionID) {
		this.type = Problem.problemType.get(questionID.substring(0, 2));
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
	
	public Problem(String type, boolean creating) {
		this.type = type;
		this.creating = creating;
	}
	
	public void setCreating() {
		this.creating = true;
	}
	
	public void setEditing() {
		this.creating = false;
	}
	
	public void setQuestion(String question) {
		this.question = question;
	}
	
	public void setAnswers(String answer) {
		this.answers = answer.split("|");
	}
	
	public void updateDatabase() throws SQLException {
		DBConnection database = new DBConnection();
		Statement stmt = database.getStmt();
		if (this.creating) {
			String sql = "SELECT QuestionID FROM " + Problem.problemType.get(this.type) + " ORDER BY QuizID DESC LIMIT 1;";
			ResultSet res = stmt.executeQuery(sql);
			if (res.next()) {
				int questionCount = Integer.parseInt(res.getString(1).substring(2));
				questionCount++;
				this.questionID = this.type + String.format("%064d", questionCount);
			} else {
				int questionCount = 0;
				this.questionID = this.type + String.format("%064d", questionCount);
			}
			stmt.executeUpdate(getInsertSQL());
		} else {
			stmt.executeUpdate(getUpdateSQL());
		}
	}
	
	public String getInsertSQL() {
		String answer = getArrayToString(answers);
		String sql = "INSERT INTO " + Problem.problemType.get(type) + " VALUES(\"" + this.questionID + "\",\"" + this.question + "\",\"" + answer + "\");";
		return sql;
	}
	
	public String getUpdateSQL() {
		String answer = getArrayToString(answers);
		String sql = "UPDATE " + Problem.problemType.get(type) + " SET Question = \"" + this.question + "\" , Answer = \"" + answer + "\" WHERE QuestionID = \"" + this.questionID + "\";";
		return sql;
	}
	
	public String getArrayToString(String[] arr) {
		String str = "";
		for (int i = 0; i < arr.length; i++) {
			str += arr[i] + "|";
		}
		str = str.substring(0, str.length() - 1);
		return str;
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
			problemType.put("question-response", "QR");
			problemType.put("fill-in-blank", "FB");
			problemType.put("multiple-choice", "MC");
			problemType.put("picture-response", "PR");
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