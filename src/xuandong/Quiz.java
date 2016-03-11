package xuandong;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.TimeZone;


public class Quiz {
	// used to count the real number of problems, e.g. a MultiChoice problem
	// can be treated as several problems
	private double score;

	private Long endTime;
	private Long startTime;
	
	private int popularity;
	private int pbCount = 0;
	
	private String name;
	private String image;
	private String quizID;
	private String userID;
	private String endDate;
	private String authorID;
	private String duration;
	private String startDate;
	private String createdDate;
	private String description;
	private String category = "";
	
	private boolean isOnePage;
	private boolean isRandomQuiz;
	private boolean isPracticeMode;
	private boolean creating = false;
	private boolean isImmediateCorrection;
	private boolean onPracticeMode = false;
	
	private QuizSummary quizSummary;
	
	private ArrayList<Problem> problems;

	public static final TimeZone TIME_ZONE = TimeZone.getTimeZone("UTC");
	public static final SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
	public static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	

	/**
	 * Simple constructor If you are creating a new quiz which is not in
	 * database, please don't use this one
	 */
	public Quiz() {
	}
	

	/**
	 * Used to get all the information of a quiz from database Please just call
	 * this method after you use the above constructor
	 * 
	 * @param quizID
	 */
	public void setQuizID(String quizID) {
		this.quizID = quizID;
		problems = new ArrayList<Problem>();
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT Name, Description, AuthorID, ProblemID, IsRandomQuiz, IsOnePage, IsImmediateCorrection, IsPracticeMode, Time, Image FROM Quiz WHERE QuizID = \"" + quizID + "\";";
			ResultSet res = stmt.executeQuery(sql);
			if (res != null) {
				res.absolute(1);
				this.name = res.getString("Name");
				this.description = res.getString("Description");
				this.authorID = res.getString("AuthorID");
				String[] prs = res.getString("ProblemID").split("\\|");
				for (int i = 0; i < prs.length; i++) {
					String type = prs[i].substring(0, 2);
					switch (type) {
					case "FB":
						FillBlank newFB = new FillBlank(prs[i]);
						pbCount += 1;
						this.problems.add(newFB);
						break;
					case "MC":
						MultiChoice newMC = new MultiChoice(prs[i]);
						pbCount += newMC.getCount();
						this.problems.add(newMC);
						break;
					case "MR":
						MultiResponse newMR = new MultiResponse(prs[i]);
						pbCount += newMR.getCount();
						this.problems.add(newMR);
						break;
					case "PR":
						PictureResponse newPR = new PictureResponse(prs[i]);
						pbCount += 1;
						this.problems.add(newPR);
						break;
					case "QR":
						QuestionResponse newQR = new QuestionResponse(prs[i]);
						pbCount += 1;
						this.problems.add(newQR);
						break;
					}
				}
				this.isRandomQuiz = res.getBoolean("IsRandomQuiz");
				this.isOnePage = res.getBoolean("IsOnePage");
				this.isImmediateCorrection = res.getBoolean("IsImmediateCorrection");
				this.isPracticeMode = res.getBoolean("IsPracticeMode");
				this.createdDate = res.getString("Time");
				this.image = res.getString("Image");
				if (!Category.getCategory(this.quizID).isEmpty()) {
					this.category = Category.getCategory(this.quizID).get(0);
				}
				this.setPopularity();
			}
			database.getCon().close();
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
	 * @return the ArrayList containing the problems note that the ArrayList
	 *         contains Object Problem, not Strings
	 */
	public ArrayList<Problem> getProblems() {
		return problems;
	}
	
	
	/**
	 * Add a problem
	 * @param pro
	 */
	public void addProblem(Problem pro) {
		this.problems.add(pro);
	}

	
	/**
	 * @return quiz name
	 */
	public String getName() {
		return name;
	}
	
	
	/**
	 * Given a quizID, return the name of this quiz
	 * @param quizID
	 * @return quiz name
	 * @throws SQLException
	 */
	public static String getName(String quizID) throws SQLException {
		DBConnection database = new DBConnection();
		ResultSet res = database.getStmt().executeQuery("SELECT Name FROM Quiz WHERE QuizID = \"" + quizID + "\";");
		String quizName = "Not Found";
		if (res.next()) {
			quizName = res.getString("Name");
		}
		database.getCon().close();
		return quizName;
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
	 * Return the category of this quiz
	 * @return
	 */
	public String getCategory() {
		return this.category;
	}
	
	
	/**
	 * @return whether or not a practice quiz
	 */
	public boolean isPracticeMode() {
		return this.isPracticeMode;
	}

	
	/**
	 * Set the quiz name
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	
	/**
	 * Set the quiz description
	 * 
	 * @param description
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	
	/**
	 * Set the authorID
	 * 
	 * @param authorID
	 */
	public void setAuthor(String authorID) {
		this.authorID = authorID;
	}

	
	/**
	 * Delete a problem from the quiz
	 * 
	 * @param problemID
	 * @throws SQLException 
	 */
	public void deleteProblem(String problemID) throws SQLException {
		for (int i = 0; i < problems.size(); i++) {
			if (problems.get(i).getQuestionID().equals(problemID)) {
				problems.remove(i);
				break;
			}
		}
		DBConnection database = new DBConnection();
		String sql = "DELETE FROM " + Problem.problemType.get(problemID.substring(0, 2)) + " WHERE QuestionID = \"" + problemID + "\";";
		database.getStmt().executeUpdate(sql);
		database.con.close();
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
	 * Fetch the popularity from the database for a quiz
	 * @throws SQLException
	 */
	private void setPopularity() throws SQLException {
		DBConnection database = new DBConnection();
		String sql = "SELECT COUNT(*) AS Count FROM QuizRecord WHERE QuizID = \"" + this.quizID + "\";";
		ResultSet res = database.getStmt().executeQuery(sql);
		res.next();
		this.popularity = res.getInt("Count");
		database.con.close();
	}
	
	
	/**
	 * Set the popularity
	 * @param count the number the quiz has been taken
	 */
	private void setPopularity(int count) {
		this.popularity = count;
	}

	
	/**
	 * Set the date to a given date
	 * Used when editing the quiz
	 * @param date
	 */
	public void setCreatedDate(String date) {
		this.createdDate = date;
	}
	
	
	/**
	 * Set the date to current date
	 */
	public void setCreatedDate() {
		this.createdDate = Quiz.df.format((new Date()).getTime());
	}

	
	/**
	 * @return the created date of this quiz
	 */
	public String getCreatedDate() {
		return this.createdDate.substring(0, this.createdDate.length() - 2);
	}

	
	/**
	 * @return the number the quiz has been taken
	 */
	public int getPopularity() {
		return this.popularity;
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
	 * @return image URL
	 */
	public String getImage() {
		return image;
	}

	
	/**
	 * Set the image of this quiz to this url
	 * @param url
	 */
	public void setImage(String url) {
		this.image = url;
	}

	
	/**
	 * Set the user Please specify this right before you fetch QuizSummary
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
	 * Update or insert the information about this quiz in database Please call
	 * this method as long as you modify the variables of this quiz
	 * @throws SQLException
	 */
	public void updateDatabase() throws SQLException {
		DBConnection database = new DBConnection();
		Statement stmt = database.getStmt();
		if (this.creating) {
			String sql = "SELECT QuizID FROM Quiz ORDER BY QuizID DESC LIMIT 1;";
			ResultSet res = stmt.executeQuery(sql);
			if (res.next()) {
				int quizCount = Integer.parseInt(res.getString(1)) + 1;
				quizID = String.format("%010d", quizCount);
			} else {
				int questionCount = 0;
				quizID = String.format("%010d", questionCount);
			}
			stmt.executeUpdate(getInsertSQL());
			updateCreateAchievement();
		} else {
			stmt.executeUpdate(getUpdateSQL());
		}
		database.getCon().close();
	}

	
	/**
	 * return the insert statement to insert this problem into database used for
	 * creating a problem
	 */
	public String getInsertSQL() {
		String pbs = getListToString();
		String sql = "INSERT INTO Quiz (QuizID, Name, Description, AuthorID, ProblemID, IsRandomQuiz, IsOnePage, IsImmediateCorrection, IsPracticeMode, Time, Image) VALUES(\""
				+ this.quizID + "\",\"" + this.name.replace("\"", "\"\"") + "\",\"" + this.description.replace("\"", "\"\"") + "\",\"" + this.authorID.replace("\"", "\"\"") + "\",\""
				+ pbs + "\"," + this.isRandomQuiz + "," + this.isOnePage + "," + this.isImmediateCorrection + ","
				+ this.isPracticeMode + ",\"" + this.createdDate + "\",\"" + this.image.replace("\"", "\"\"") + "\");";
		return sql;
	}

	
	/**
	 * return the update statement to update this problem in the database used
	 * for modifying a problem
	 */
	public String getUpdateSQL() {
		String pbs = getListToString();
		String sql = "UPDATE Quiz SET Name = \"" + this.name.replace("\"", "\"\"") + "\", Description = \"" + this.description.replace("\"", "\"\"")
				+ "\", AuthorID = \"" + this.authorID.replace("\"", "\"\"") + "\", ProblemID = \"" + pbs + "\" , isRandomQuiz = "
				+ this.isRandomQuiz + ", isOnePage = " + this.isOnePage + ", IsImmediateCorrection = "
				+ this.isImmediateCorrection + ", IsPracticeMode = " + this.isPracticeMode + ", Time = \""
				+ this.createdDate + "\", Image = \"" + this.image.replace("\"", "\"\"") + "\" WHERE QuizID = \"" + this.quizID + "\";";
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
	 * 
	 * @return start time
	 */
	public Long quizStart() {
		this.startTime = (new Date()).getTime();
		startDate = df.format(startTime);
		return this.startTime;
	}

	
	/**
	 * Set the quiz is taking on practice mode
	 */
	public void setOnPracticeMode() {
		onPracticeMode = true;
	}
	
	
	/**
	 * Set the quiz is taking on quiz mode
	 */
	public void setOnQuizMode() {
		onPracticeMode = false;
	}
	
	
	/**
	 * End the quiz and update information in the database
	 * @return end time
	 */
	public String quizEnd() {
		if (!onPracticeMode) {
			if (endTime == null) {
				this.endTime = (new Date()).getTime();
			}
			endDate = df.format(endTime);
			Long dura = this.endTime - this.startTime;
			Date tempDate = new Date();
			tempDate.setTime(dura);
			format.setTimeZone(TIME_ZONE);
			duration = format.format(tempDate);
			score = this.calculateScore();
			try {
				DBConnection database = new DBConnection();
				Statement stmt = database.getStmt();
				ResultSet res = stmt.executeQuery("SELECT * FROM QuizRecord WHERE QuizID = \"" + quizID + "\" AND UserID = \"" + userID.replace("\"", "\"\"") + "\" AND StartTime = \"" + startDate + "\";");
				if (!res.next()) {
					String sql = "INSERT INTO QuizRecord VALUES (\"" + quizID + "\",\"" + userID.replace("\"", "\"\"") + "\",\"" + startDate + "\",\""
							+ endDate + "\",\"" + duration + "\"," + score + ");";
					stmt.executeUpdate(sql);
					updateQuizAchievement();
				}
				database.getCon().close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			try {
				updatePracticeAchievement();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return duration;
	}

	
	/**
	 * Add the practice achievement to the database
	 * @throws SQLException
	 */
	private void updatePracticeAchievement() throws SQLException {
		DBConnection database = new DBConnection();
		String time = Quiz.df.format((new Date()).getTime());
		ResultSet test1 = database.getStmt().executeQuery("SELECT * FROM Achievement WHERE UserID = \"" + this.userID.replace("\"", "\"\"") + "\" AND AchievementName = \"Practice Makes Perfect\";");
		if (!test1.next()) {
			database.getStmt().executeUpdate("INSERT INTO Achievement(UserID, QuizID, Time, AchievementName) VALUES(\"" + this.userID.replace("\"", "\"\"") + "\",\"" + this.quizID + "\",\"" + time + "\",\"Practice Makes Perfect\");");
		}
		database.getCon().close();
	}

	
	/**
	 * Add the quiz achievement to the database
	 * @throws SQLException
	 */
	private void updateQuizAchievement() throws SQLException {
		String time = Quiz.df.format((new Date()).getTime());
		DBConnection database = new DBConnection();
		ResultSet res = database.getStmt().executeQuery("SELECT COUNT(DISTINCT QuizID) AS Count FROM QuizRecord WHERE UserID = \"" + this.userID.replace("\"", "\"\"") + "\";");
		res.next();
		int quizTaken = res.getInt("Count");
		if (quizTaken == 10) {
			ResultSet test1 = database.getStmt().executeQuery("SELECT * FROM Achievement WHERE UserID = \"" + this.userID.replace("\"", "\"\"") + "\" AND AchievementName = \"Quiz Machine\";");
			if (!test1.next()) {
				database.getStmt().executeUpdate("INSERT INTO Achievement(UserID, QuizID, Time, AchievementName) VALUES(\"" + this.userID.replace("\"", "\"\"") + "\",\"" + this.quizID + "\",\"" + time + "\",\"Quiz Machine\");");
			}
		}
		ResultSet highest = database.getStmt().executeQuery("SELECT UserID FROM QuizRecord WHERE QuizID = \"" + this.quizID + "\" ORDER BY Score DESC, Duration ASC, EndTime ASC LIMIT 1;");
		highest.next();
		if (this.userID.equals(highest.getString("UserID"))) {
			ResultSet test2 = database.getStmt().executeQuery("SELECT * FROM Achievement WHERE UserID = \"" + this.userID.replace("\"", "\"\"") + "\" AND AchievementName = \"I am the Greatest\";");
			if (!test2.next()) {
				database.getStmt().executeUpdate("INSERT INTO Achievement(UserID, QuizID, Time, AchievementName) VALUES(\"" + this.userID.replace("\"", "\"\"") + "\",\"" + this.quizID + "\",\"" + time + "\",\"I am the Greatest\");");
			}
		}
		database.getCon().close();
	}
	
	
	/**
	 * update created quiz achievement
	 * @throws SQLException
	 */
	private void updateCreateAchievement() throws SQLException {
		DBConnection database = new DBConnection();
		String time = Quiz.df.format((new Date()).getTime());
		ResultSet res = database.getStmt().executeQuery("SELECT COUNT(*) AS Count FROM Quiz WHERE AuthorID = \"" + this.authorID.replace("\"", "\"\"") + "\";");
		res.next();
		int quizCreated = res.getInt("Count");
		if (quizCreated == 1) {
			ResultSet test1 = database.getStmt().executeQuery("SELECT * FROM Achievement WHERE UserID = \"" + this.authorID.replace("\"", "\"\"") + "\" AND AchievementName = \"Amateur Author\";");
			if (!test1.next()) {
				database.getStmt().executeUpdate("INSERT INTO Achievement(UserID, QuizID, Time, AchievementName) VALUES(\"" + this.authorID.replace("\"", "\"\"") + "\",\"" + this.quizID + "\",\"" + time + "\",\"Amateur Author\");");
			}
		} else if (quizCreated == 5) {
			ResultSet test2 = database.getStmt().executeQuery("SELECT * FROM Achievement WHERE UserID = \"" + this.authorID.replace("\"", "\"\"") + "\" AND AchievementName = \"Prolific Author\";");
			if (!test2.next()) {
				database.getStmt().executeUpdate("INSERT INTO Achievement(UserID, QuizID, Time, AchievementName) VALUES(\"" + this.authorID.replace("\"", "\"\"") + "\",\"" + this.quizID + "\",\"" + time + "\",\"Prolific Author\");");
			}
		} else if (quizCreated == 10) {
			ResultSet test3 = database.getStmt().executeQuery("SELECT * FROM Achievement WHERE UserID = \"" + this.authorID.replace("\"", "\"\"") + "\" AND AchievementName = \"Prodigious Author\";");
			if (!test3.next()) {
				database.getStmt().executeUpdate("INSERT INTO Achievement(UserID, QuizID, Time, AchievementName) VALUES(\"" + this.authorID.replace("\"", "\"\"") + "\",\"" + this.quizID + "\",\"" + time + "\",\"Prodigious Author\");");
			}
		}
		database.getCon().close();
	}
	
	
	/**
	 * update created quiz achievement
	 * only called when using XML parsing
	 * @throws SQLException
	 */
	public static int updateCreateAchievement(String authorID, String quizID) throws SQLException {
		DBConnection database = new DBConnection();
		String time = Quiz.df.format((new Date()).getTime());
		ResultSet res = database.getStmt().executeQuery("SELECT COUNT(*) AS Count FROM Quiz WHERE AuthorID = \"" + authorID.replace("\"", "\"\"") + "\";");
		res.next();
		int quizCreated = res.getInt("Count");
		if (quizCreated == 1) {
			ResultSet test1 = database.getStmt().executeQuery("SELECT * FROM Achievement WHERE UserID = \"" + authorID.replace("\"", "\"\"") + "\" AND AchievementName = \"Amateur Author\";");
			if (!test1.next()) {
				database.getStmt().executeUpdate("INSERT INTO Achievement(UserID, QuizID, Time, AchievementName) VALUES(\"" + authorID.replace("\"", "\"\"") + "\",\"" + quizID + "\",\"" + time + "\",\"Amateur Author\");");
			}
		} else if (quizCreated == 5) {
			ResultSet test2 = database.getStmt().executeQuery("SELECT * FROM Achievement WHERE UserID = \"" + authorID.replace("\"", "\"\"") + "\" AND AchievementName = \"Prolific Author\";");
			if (!test2.next()) {
				database.getStmt().executeUpdate("INSERT INTO Achievement(UserID, QuizID, Time, AchievementName) VALUES(\"" + authorID.replace("\"", "\"\"") + "\",\"" + quizID + "\",\"" + time + "\",\"Prolific Author\");");
			}
		} else if (quizCreated == 10) {
			ResultSet test3 = database.getStmt().executeQuery("SELECT * FROM Achievement WHERE UserID = \"" + authorID.replace("\"", "\"\"") + "\" AND AchievementName = \"Prodigious Author\";");
			if (!test3.next()) {
				database.getStmt().executeUpdate("INSERT INTO Achievement(UserID, QuizID, Time, AchievementName) VALUES(\"" + authorID.replace("\"", "\"\"") + "\",\"" + quizID + "\",\"" + time + "\",\"Prodigious Author\");");
			}
		}
		database.getCon().close();
		return quizCreated;
	}

	
	/**
	 * @return The duration time
	 */
	public String getDuration() {
		return duration;
	}

	
	/**
	 * get the score of the whole quiz
	 * @return score, represented by double, e.g. 9/11
	 */
	public double calculateScore() {
		double score = 0.0;
		for (Problem pr : problems) {
			score += pr.getScore();
		}
		return score / pbCount * 100;
	}
	
	
	/**
	 * @return user score with two decimal digits
	 */
	public String getScore() {
		return String.format("%.2f", this.score) + "%";
	}

	
	/**
	 * Get the most 16 popularity quizzes, ordered by the number the quiz has been taken
	 * @return a list contains those quizzes
	 * @throws SQLException
	 */
	static public ArrayList<Quiz> getPopularQuizzes() throws SQLException {
		ArrayList<Quiz> popularQuizs = new ArrayList<Quiz>();
		DBConnection database = new DBConnection();
		String sql = "SELECT QuizID, COUNT(*) FROM QuizRecord GROUP BY QuizID ORDER BY COUNT(*) DESC LIMIT 16";
		ResultSet res = database.getStmt().executeQuery(sql);
		while (res.next()) {
			Quiz temp = new Quiz();
			temp.setQuizID(res.getString("QuizID"));
			temp.setPopularity(res.getInt(2));
			popularQuizs.add(temp);
		}
		database.con.close();
		return popularQuizs;
	}

	
	/**
	 * Get the most 16 popularity quizzes, ordered by the number the quiz has been taken
	 * @return a list contains those quizzes
	 * @throws SQLException
	 */
	static public ArrayList<Quiz> getRecentQuizzes() throws SQLException {
		ArrayList<Quiz> recentQuizs = new ArrayList<Quiz>();
		DBConnection database = new DBConnection();
		String sql = "SELECT QuizID, Time FROM Quiz Order BY Time DESC LIMIT 12";
		ResultSet res = database.getStmt().executeQuery(sql);
		while (res.next()) {
			Quiz temp = new Quiz();
			temp.setQuizID(res.getString("QuizID"));
			temp.setCreatedDate(res.getString("Time"));
			recentQuizs.add(temp);
		}
		database.con.close();
		return recentQuizs;
	}
	
	
	/**
	 * Get the highest score of this quiz
	 * @throws SQLException 
	 */
	public String getHighestScore() throws SQLException {
		String highest;
		DBConnection database = new DBConnection();
		ResultSet res = database.getStmt().executeQuery("SELECT Score FROM QuizRecord WHERE QuizID = \"" + this.quizID + "\" ORDER BY Score DESC LIMIT 1;");
		if (res.next()) {
			highest = Double.toString(res.getDouble("Score"));
		} else {
			highest = "Untaken";
		}
		database.getCon().close();
		return highest;
	}
	
	
	/**
	 * Search a quiz by name or description or tag or category
	 * @param keyword
	 * @return
	 * @throws SQLException
	 */
	public static ArrayList<Quiz> serachQuiz(String keyword) throws SQLException {
		ArrayList<Quiz> quizzes = new ArrayList<Quiz>();
		HashSet<String> results = new HashSet<String>();
		DBConnection database = new DBConnection();
		ResultSet res1 = database.getStmt().executeQuery("SELECT DISTINCT QuizID FROM Quiz WHERE Name LIKE \"%" + keyword.replace("\"", "\"\"") + "%\" OR Description LIKE \"%" + keyword.replace("\"", "\"\"") + "%\";");
		while (res1.next()) {
			String temp = res1.getString("QuizID");
			results.add(temp);
		}
		ResultSet res2 = database.getStmt().executeQuery("SELECT DISTINCT QuizID FROM Tags WHERE Tag LIKE \"%" + keyword.replace("\"", "\"\"") + "%\";");
		while (res2.next()) {
			String temp = res2.getString("QuizID");
			results.add(temp);
		}
		ResultSet res3 = database.getStmt().executeQuery("SELECT DISTINCT QuizID FROM Category WHERE Category LIKE \"%" + keyword.replace("\"", "\"\"") + "%\";");
		while (res3.next()) {
			String temp = res3.getString("QuizID");
			results.add(temp);
		}
		for (String str : results) {
			Quiz temp = new Quiz();
			temp.setQuizID(str);
			quizzes.add(temp);
		}
		database.getCon().close();
		return quizzes;
	}
}
