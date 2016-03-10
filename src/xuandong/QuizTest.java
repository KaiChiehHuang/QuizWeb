package xuandong;

import java.sql.SQLException;

import org.junit.Test;

public class QuizTest {

	@Test
	public void test() throws SQLException {
		String receiverID = "jay";
		String quizID = "0000000004";
		String senderID = "jay";
		Email.challenge(senderID, quizID, receiverID);
		System.out.println("Hi " + receiverID + ",<br>You received a new quiz challenge from your friend " + senderID + ".<br>The quiz is <a href=\"QuizSummary.jsp?quizID=" + quizID + "&userID=" + receiverID + "\">" + "Continents By Population" + "</a ><br>Your friend's highest score on this quiz is: " + "97.8%" + ".");
	}
}
