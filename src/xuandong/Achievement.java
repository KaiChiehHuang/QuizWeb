package xuandong;

import java.util.HashMap;


public class Achievement {
	String userID;
	String quizID;
	String time;
	String achievementName;
	String description;
	
	public static final HashMap<String, String> ACHIEVEMENTDESCRIPTION = new HashMap<String, String>();
	static
	{
		ACHIEVEMENTDESCRIPTION.put("Amateur Author", " have created a quiz.");
		ACHIEVEMENTDESCRIPTION.put("Prolific Author", " have created five quizzes!");
		ACHIEVEMENTDESCRIPTION.put("Prodigious Author", " have created ten quizzes!!");
		ACHIEVEMENTDESCRIPTION.put("Quiz Machine", " have taken ten quizzes!");
		ACHIEVEMENTDESCRIPTION.put("I am the Greatest", " had the highest score on a quiz!!");
		ACHIEVEMENTDESCRIPTION.put("Practice Makes Perfect", " have taken a quiz in practice mode.");
	};
	
	public Achievement() {
	}
	
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getUserID() {
		return this.userID;
	}
	
	public void setQuizID(String quizID) {
		this.quizID = quizID;
	}
	
	public String getQuizID() {
		return this.quizID;
	}
	
	public String getTime() {
		return this.time.substring(0, this.time.length() - 2);
	}
	
	public void setTime(String time) {
		this.time = time;
	}
	
	public void setAchievementName(String name) {
		this.achievementName = name;
	}
	
	public String getAchievementName() {
		return this.achievementName;
	}
	
	public void setDescription() {
		this.description = Achievement.ACHIEVEMENTDESCRIPTION.get(this.achievementName);
	}
	
	public String getDescription() {
		return this.description;
	}
}
