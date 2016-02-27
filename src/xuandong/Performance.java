package xuandong;

public class Performance {
	private String quizID;
	private String userID;
	private String startTime;
	private String duration;
	private double score;
	
	public Performance(String quizID, String userID, String startTime, String duration, double score) {
		this.quizID = quizID;
		this.userID = userID;
		this.startTime = startTime;
		this.duration = duration;
		this.score = score;
	}
	
	public String getQuizID() {
		return quizID;
	}
	
	public String getUserID() {
		return userID;
	}
	
	public String getStartTime() {
		return startTime;
	}
	
	public String getDuration() {
		return duration;
	}
	
	public double getScore() {
		return score;
	}
}
