package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Quiz {
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

	static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	static final SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");

	DBConnection database;

	public Quiz() {
		database = new DBConnection();
		problems = new ArrayList<Problem>();
	}

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

	public void setCreating() {
		this.creating = true;
	}

	public void setEditing() {
		this.creating = false;
	}
	
	public String getQuizID() {
		return quizID;
	}
	
	public String getUserID() {
		return userID;
	}
	
	public ArrayList<Problem> getProblems() {
		return problems;
	}

	public String getName() {
		return name;
	}

	public String getDescription() {
		return description;
	}

	public String getAuthor() {
		return authorID;
	}

	public boolean isRandomQuiz() {
		return this.isRandomQuiz;
	}

	public boolean isOnePage() {
		return this.isOnePage;
	}

	public boolean isImmediateCorrection() {
		return this.isImmediateCorrection;
	}

	public boolean isPracticeMode() {
		return this.isPracticeMode;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setAuthor(String authorID) {
		this.authorID = authorID;
	}

	public void setProblem(String[] problems) {
		String value = null;
		for (int i = 0; i < problems.length; i++) {
			value += problems[i] + "|";
		}
		value = value.substring(0, value.length() - 1);
	}

	public void setRandomQuiz(boolean value) {
		this.isRandomQuiz = value;
	}

	public void setOnePage(boolean value) {
		this.isOnePage = value;
	}

	public void setImmediateCorrection(boolean value) {
		this.isImmediateCorrection = value;
	}

	public void setPracticeMode(boolean value) {
		this.isPracticeMode = value;
	}

	public void setUser(String userID) {
		this.userID = userID;
	}

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

	public String getInsertSQL() {
		String pbs = getListToString();
		String sql = "INSERT INTO Quiz" + " VALUES(\"" + this.quizID + "\",\"" + this.name + "\",\"" + this.description
				+ "\",\"" + this.authorID + "\",\"" + pbs + "\"," + this.isRandomQuiz + "," + this.isOnePage + ","
				+ this.isImmediateCorrection + "," + this.isPracticeMode + ");";
		return sql;
	}

	public String getUpdateSQL() {
		String pbs = getListToString();
		String sql = "UPDATE Quiz SET Name = \"" + this.name + "\" , Description = \"" + this.description
				+ "\" , AuthorID = \"" + this.authorID + "\" , ProblemID = \"" + pbs + "\" , isRandomQuiz = "
				+ this.isRandomQuiz + " , isOnePage = " + this.isOnePage + " , IsImmediateCorrection = "
				+ this.isImmediateCorrection + " , IsPracticeMode = " + this.isPracticeMode + " WHERE QuizID = \""
				+ this.quizID + "\";";
		return sql;
	}

	public String getListToString() {
		String str = "";
		for (Problem pb : problems) {
			str += pb.getQuestionID() + "|";
		}
		str = str.substring(0, str.length() - 1);
		return str;
	}

	public Long quizStart() {
		this.startTime = (new Date()).getTime();
		startDate = df.format(startTime);
		return this.startTime;
	}

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

	public double getScore() {
		int score = 0;
		for (Problem pr : problems) {
			score += pr.getScore();
		}
		return score / pbCount;
	}
}
