package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Quiz {
	// used to count the real number of problems, e.g. a MultiChoice problem
	// can be treated as several problems
	private int pbCount = 0;

	private String name;
	private String quizID;
	private String userID;
	private String authorID;
	private String description;
	private ArrayList<Problem> problems;

	private boolean isOnePage;
	private boolean isRandomQuiz;
	private boolean isPracticeMode;
	private boolean isImmediateCorrection;

	private Long startTime;
	private Long endTime;
	private String duration;
	private String startDate;
	private String endDate;

	boolean creating = false;
	
	private QuizSummary quizSummary;

	static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	static final SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");

	DBConnection database;

	/**
	 * Simple constructor
	 * If you are creating a new quiz which is not in database, please don't use this one
	 */
	public Quiz() {
		database = new DBConnection();
		problems = new ArrayList<Problem>();
	}

	/**
	 * Used to get all the information of a quiz from database
	 * Please just call this method after you use the above constructor
	 * @param quizID
	 */
	public void setQuizID(String quizID) {
		this.quizID = quizID;
		Statement stmt = database.getStmt();
		try {
			String sql = "SELECT Name, Description, AuthorID, ProblemID, IsRandomQuiz, IsOnePage, IsImmediateCorrection, IsPracticeMode FROM Quiz WHERE QuizID = \""
					+ quizID + "\";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.name = res.getString(1);
				this.description = res.getString(2);
				this.authorID = res.getString(3);
				String[] prs = res.getString(4).split("|");
				for (int i = 0; i < prs.length; i++) {
					String type = prs[i].substring(0, 2);
					switch (type) {
					case "FB":
						this.problems.add(new FillBlank(prs[i]));
						break;
					case "MC":
						this.problems.add(new MultiChoice(prs[i]));
						break;
					case "MR":
						this.problems.add(new MultiResponse(prs[i]));
						break;
					case "PR":
						this.problems.add(new PictureResponse(prs[i]));
						break;
					case "QR":
						this.problems.add(new QuestionResponse(prs[i]));
						break;
					case "SC":
						this.problems.add(new SingleChoice(prs[i]));
						break;
					}
					pbCount += problems.get(problems.size() - 1).getAnswer().length;
				}
				this.isRandomQuiz = res.getBoolean(5);
				this.isOnePage = res.getBoolean(6);
				this.isImmediateCorrection = res.getBoolean(7);
				this.isPracticeMode = res.getBoolean(8);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * set the mode to creating mode
	 */
	public void setCreating() {
		this.creating = true;
	}

	/**
	 * set the mode to editing mode
	 */
	public void setEditing() {
		this.creating = false;
	}
	
	/**
	 * @return quizID
	 */
	public String getQuizID() {
		return quizID;
	}
	
	/**
	 * @return userID
	 */
	public String getUserID() {
		return userID;
	}
	
	/**
	 * @return the ArrayList containing the problems
	 * note that the ArrayList contains Object Problem, not Strings
	 */
	public ArrayList<Problem> getProblems() {
		return problems;
	}

	/**
	 * @return quiz name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return quiz description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @return authorID
	 */
	public String getAuthor() {
		return authorID;
	}

	/**
	 * @return whether or not a random quiz
	 */
	public boolean isRandomQuiz() {
		return this.isRandomQuiz;
	}

	/**
	 * @return whether or not a one page quiz
	 */
	public boolean isOnePage() {
		return this.isOnePage;
	}

	/**
	 * @return whether or not an immediate correction quiz
	 */
	public boolean isImmediateCorrection() {
		return this.isImmediateCorrection;
	}

	/**
	 * @return whether or not a practice quiz
	 */
	public boolean isPracticeMode() {
		return this.isPracticeMode;
	}

	/**
	 * Set the quiz name
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Set the quiz description
	 * @param description
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Set the authorID
	 * @param authorID
	 */
	public void setAuthor(String authorID) {
		this.authorID = authorID;
	}
	
	/**
	 * Delete a problem from the quiz
	 * @param problemID
	 */
	public void deleteProblem(String problemID) {
		for (int i = 0; i <= problems.size(); i++) {
			if (problems.get(i).getQuestionID().equals(problemID)) {
				problems.remove(i);
				break;
			}
		}
	}

	/**
	 * Set whether or not this quiz is a random quiz
	 */
	public void setRandomQuiz(boolean value) {
		this.isRandomQuiz = value;
	}

	/**
	 * Set whether or not this quiz is a one page quiz
	 */
	public void setOnePage(boolean value) {
		this.isOnePage = value;
	}

	/**
	 * Set whether or not this quiz is a immediate correction quiz
	 */
	public void setImmediateCorrection(boolean value) {
		this.isImmediateCorrection = value;
	}

	/**
	 * Set whether or not this quiz is a practice quiz
	 */
	public void setPracticeMode(boolean value) {
		this.isPracticeMode = value;
	}

	/**
	 * Set the user
	 * Please specify this right before you fetch QuizSummary
	 * @param userID
	 */
	public void setUser(String userID) {
		this.userID = userID;
	}
	
	/**
	 * Fetch the quiz summary from database
	 */
	public QuizSummary getQuizSummary() {
		this.quizSummary = new QuizSummary(this.quizID, this.userID);
		return this.quizSummary;
	}

	/**
	 * Update or insert the information about this quiz in database
	 * Please call this method as long as you modify the variables of this quiz
	 * @throws SQLException
	 */
	public void updateDatabase() throws SQLException {
		Statement stmt = database.getStmt();
		if (this.creating) {
			String sql = "SELECT QuizID FROM Quiz ORDER BY QuizID DESC LIMIT 1;";
			ResultSet res = stmt.executeQuery(sql);
			if (res.next()) {
				int quizCount = Integer.parseInt(res.getString(1)) + 1;
				quizID = String.format("%064d", quizCount);
			} else {
				int questionCount = 0;
				quizID = String.format("%064d", questionCount);
			}
			stmt.executeUpdate(getInsertSQL());
		} else {
			stmt.executeUpdate(getUpdateSQL());
		}
	}

	/**
	 * return the insert statement to insert this problem into database
	 * used for creating a problem
	 */
	public String getInsertSQL() {
		String pbs = getListToString();
		String sql = "INSERT INTO Quiz" + " VALUES(\"" + this.quizID + "\",\"" + this.name + "\",\"" + this.description
				+ "\",\"" + this.authorID + "\",\"" + pbs + "\"," + this.isRandomQuiz + "," + this.isOnePage + ","
				+ this.isImmediateCorrection + "," + this.isPracticeMode + ");";
		return sql;
	}

	/**
	 * return the update statement to update this problem in the database
	 * used for modifying a problem
	 */
	public String getUpdateSQL() {
		String pbs = getListToString();
		String sql = "UPDATE Quiz SET Name = \"" + this.name + "\" , Description = \"" + this.description
				+ "\" , AuthorID = \"" + this.authorID + "\" , ProblemID = \"" + pbs + "\" , isRandomQuiz = "
				+ this.isRandomQuiz + " , isOnePage = " + this.isOnePage + " , IsImmediateCorrection = "
				+ this.isImmediateCorrection + " , IsPracticeMode = " + this.isPracticeMode + " WHERE QuizID = \""
				+ this.quizID + "\";";
		return sql;
	}

	/**
	 * transfer the ArrayList of problems into a String containing the problemID of each problem
	 * @return
	 */
	public String getListToString() {
		String str = "";
		for (Problem pb : problems) {
			str += pb.getQuestionID() + "|";
		}
		str = str.substring(0, str.length() - 1);
		return str;
	}

	/**
	 * Start the quiz
	 * @return start time
	 */
	public Long quizStart() {
		this.startTime = (new Date()).getTime();
		startDate = df.format(startTime);
		return this.startTime;
	}

	/**
	 * End the quiz and update information in the database
	 * @return end time
	 */
	public String quizEnd() {
		this.endTime = (new Date()).getTime();
		endDate = df.format(endTime);
		Long dura = this.startTime - this.endTime;
		Date tempDate = new Date();
		tempDate.setTime(dura);
		duration = format.format(tempDate);
		double score = this.getScore();
		Statement stmt = database.getStmt();
		try {
			String sql = "INSERT INTO QuizRecord VALUES ('" + quizID + "','" + userID + "','" + startDate + "','"
					+ endDate + "','" + duration + "," + score + "');";
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return duration;
	}

	/**
	 * get the score of the whole quiz
	 * @return score, represented by double, e.g. 9/11
	 */
	public double getScore() {
		int score = 0;
		for (Problem pr : problems) {
			score += pr.getScore();
		}
		return score / pbCount;
	}
}
