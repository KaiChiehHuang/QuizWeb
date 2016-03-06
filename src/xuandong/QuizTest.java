package xuandong;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.Test;

public class QuizTest {

	@Test
	public void test() throws SQLException {
		System.out.println("Welcome||||||fact||||||fa".split("\\|\\|\\|\\|\\|\\|")[0]);
		Quiz temp = new Quiz();
		temp.setQuizID("0000000000");
		temp.setUser("guest");
		System.out.println(temp.getCreatedDate());
		System.out.println(temp.getProblems().get(0).getQuestion());
		System.out.println(temp.getQuizSummary().getUserPerformance().size());
		assertEquals(temp.getProblems().size(), 5);
	}

}
