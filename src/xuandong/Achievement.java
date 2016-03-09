package xuandong;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;


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
	
	public static final HashMap<String, String> ACHIEVEMENTIMAGE = new HashMap<String, String>();
	static
	{
		ACHIEVEMENTIMAGE.put("Amateur Author", "badges/Amateur Author.png");
		ACHIEVEMENTIMAGE.put("Prolific Author", "badges/Prolific Author.png");
		ACHIEVEMENTIMAGE.put("Prodigious Author", "badges/Prodigious Author.png");
		ACHIEVEMENTIMAGE.put("Quiz Machine", "badges/Quiz Machine.png");
		ACHIEVEMENTIMAGE.put("I am the Greatest", "badges/I am the Greatest.png");
		ACHIEVEMENTIMAGE.put("Practice Makes Perfect", "badges/Practice Makes Perfect.png");
	};
	
	public static final ArrayList<String> ALLACHIEVEMENTS = new ArrayList<String>();
	static
	{
		ALLACHIEVEMENTS.add("Amateur Author");
		ALLACHIEVEMENTS.add("Prolific Author");
		ALLACHIEVEMENTS.add("Prodigious Author");
		ALLACHIEVEMENTS.add("Quiz Machine");
		ALLACHIEVEMENTS.add("I am the Greatest");
		ALLACHIEVEMENTS.add("Practice Makes Perfect");
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
		return Achievement.ACHIEVEMENTDESCRIPTION.get(this.achievementName);
	}
	
	public static String getDescription(String achi) {
		return Achievement.ACHIEVEMENTDESCRIPTION.get(achi);
	}
	
//	public static Set<String> getAllAchievement() {
//		return Achievement.ACHIEVEMENTDESCRIPTION.keySet();
//	}
	public static ArrayList<String> getAllAchievement() {
		return Achievement.ALLACHIEVEMENTS;
	}
	
	public static String getImage(String achi) {
		return Achievement.ACHIEVEMENTIMAGE.get(achi);
	}
	
	public String getImage() {
		return Achievement.ACHIEVEMENTIMAGE.get(this.getAchievementName());
	}
}
