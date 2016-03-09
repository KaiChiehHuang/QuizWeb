package xuandong;

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
		ACHIEVEMENTIMAGE.put("Amateur Author", "http://vignette4.wikia.nocookie.net/leagueoflegends/images/b/b4/BronzeBadgeSeason2.png/revision/latest?cb=20130928162132");
		ACHIEVEMENTIMAGE.put("Prolific Author", "http://vignette2.wikia.nocookie.net/leagueoflegends/images/3/3f/SilverBadgeSeason2.png/revision/latest?cb=20130928162033");
		ACHIEVEMENTIMAGE.put("Prodigious Author", "http://vignette1.wikia.nocookie.net/leagueoflegends/images/7/77/GoldBadgeSeason2.png/revision/latest?cb=20130928162204");
		ACHIEVEMENTIMAGE.put("Quiz Machine", "http://vignette2.wikia.nocookie.net/leagueoflegends/images/0/03/DiamondBadge.png/revision/latest?cb=20130928162320");
		ACHIEVEMENTIMAGE.put("I am the Greatest", "http://vignette4.wikia.nocookie.net/leagueoflegends/images/d/d2/MasterBadge.png/revision/latest?cb=20150418014845");
		ACHIEVEMENTIMAGE.put("Practice Makes Perfect", "http://vignette2.wikia.nocookie.net/leagueoflegends/images/5/5f/PlatinumBadgeSeason2.png/revision/latest?cb=20130928162240");
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
		this.setDescription();
		return this.description;
	}
	
	public static Set<String> getAllAchievement() {
		return Achievement.ACHIEVEMENTDESCRIPTION.keySet();
	}
	
	public static String getImage(String achi) {
		return Achievement.ACHIEVEMENTIMAGE.get(achi);
	}
	
	public String getImage() {
		return Achievement.ACHIEVEMENTIMAGE.get(this.getAchievementName());
	}
}
