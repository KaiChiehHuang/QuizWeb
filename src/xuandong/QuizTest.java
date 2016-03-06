package xuandong;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.time.LocalTime;
import java.util.Date;
import java.util.TimeZone;

import org.junit.Test;

import com.mysql.jdbc.util.TimezoneDump;

public class QuizTest {

	@Test
	public void test() throws SQLException, InterruptedException {
		Quiz temp = new Quiz();
		temp.setQuizID("0000000000");
		temp.setUser("guest");
		System.out.println(temp.getCreatedDate());
		System.out.println(temp.getProblems().get(0).getQuestion());
		Thread.sleep(1000);
//		System.out.println(Quiz.format.format((temp.quizStart()-(new Date()).getTime())));
		Long a = temp.quizStart();
		System.out.println(a);
		Thread.sleep(1000);
		System.out.println((new Date()).getTime());
		System.out.println((new Date()).getTime()-a);
		TimeZone tz = TimeZone.getTimeZone("UTC");
		Quiz.format.setTimeZone(tz);
		System.out.println(Quiz.format.format((86401000)));
		assertEquals(temp.getProblems().size(), 5);
	}

}
