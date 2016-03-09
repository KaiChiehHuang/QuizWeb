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
//		System.out.println(Category.searchByCategory("Food").size());
//		assertEquals(2, Category.searchByCategory("Food").size());
		MultiChoice temp = new MultiChoice("FB", true);
		System.out.println(temp.setProblemID());
	}

}
