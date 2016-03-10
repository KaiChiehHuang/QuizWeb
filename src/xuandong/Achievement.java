package xuandong;

import java.util.ArrayList;
import java.util.HashMap;

public class Achievement {
	String time;
	String userID;
	String quizID;
	String description;
	String achievementName;
	
	
	/**
	 * Store all achievements' descriptions
	 */
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
	
	
	/**
	 * Store all achievements' images
	 */
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
	
	
	/**
	 * Store all achievements' list
	 */
	public static final ArrayList<String> ALLACHIEVEMENTS = new ArrayList<String>();
	static
	{
		ALLACHIEVEMENTS.add("Amateur Author");
		ALLACHIEVEMENTS.add("Prolific Author");
		ALLACHIEVEMENTS.add("Prodigious Author");
		ALLACHIEVEMENTS.add("Practice Makes Perfect");
		ALLACHIEVEMENTS.add("Quiz Machine");
		ALLACHIEVEMENTS.add("I am the Greatest");
	};
	
	
	/**
	 * Simple constructor
	 */
	public Achievement() {
	}
	
	
	/**
	 * Set the user of this achievement
	 * @param userID
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	
	/**
	 * Get the user of this achievement
	 * @return
	 */
	public String getUserID() {
		return this.userID;
	}
	
	
	/**
	 * Set the quiz of this achievement
	 * @param quizID
	 */
	public void setQuizID(String quizID) {
		this.quizID = quizID;
	}
	
	
	/**
	 * Get the quiz of this achievement
	 * @return
	 */
	public String getQuizID() {
		return this.quizID;
	}
	
	
	/**
	 * Get the time of this achievement
	 * @return
	 */
	public String getTime() {
		return this.time.substring(0, this.time.length() - 2);
	}
	
	
	/**
	 * Set the time of this achievement
	 * @param time
	 */
	public void setTime(String time) {
		this.time = time;
	}
	
	
	/**
	 * Set the name of this achievement
	 * @param name
	 */
	public void setAchievementName(String name) {
		this.achievementName = name;
	}
	
	
	/**
	 * Get the name of this achievement
	 * @return
	 */
	public String getAchievementName() {
		return this.achievementName;
	}
	
	
	/**
	 * Set the description of this achievement
	 */
	public void setDescription() {
		this.description = Achievement.ACHIEVEMENTDESCRIPTION.get(this.achievementName);
	}
	
	
	/**
	 * Get the description of this achievement
	 * @return
	 */
	public String getDescription() {
		return Achievement.ACHIEVEMENTDESCRIPTION.get(this.achievementName);
	}
	
	
	/**
	 * Get the description of a specific achievement
	 * @param achievement name
	 * @return
	 */
	public static String getDescription(String achi) {
		return Achievement.ACHIEVEMENTDESCRIPTION.get(achi);
	}
	
	
	/**
	 * Get all achievements
	 * @return a list contains the names of all achievements
	 */
	public static ArrayList<String> getAllAchievement() {
		return Achievement.ALLACHIEVEMENTS;
	}
	
	
	/**
	 * Get the image of an specific achievement
	 * @param achievement name
	 * @return
	 */
	public static String getImage(String achi) {
		return Achievement.ACHIEVEMENTIMAGE.get(achi);
	}
	
	
	/**
	 * Get the image of this achievement
	 * @return
	 */
	public String getImage() {
		return Achievement.ACHIEVEMENTIMAGE.get(this.getAchievementName());
	}
}
