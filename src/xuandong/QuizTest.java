package xuandong;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.Test;

public class QuizTest {

	@Test
	public void test() throws SQLException {
		assertEquals(Quiz.getRecentQuizzes().size(), 2);
	}

}
