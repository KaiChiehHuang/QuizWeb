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
		System.out.println(temp.getCreatedDate());
		assertEquals(Quiz.getRecentQuizzes().size(), 3);
	}

}
