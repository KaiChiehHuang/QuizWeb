package xuandong;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.time.LocalTime;
import java.util.Date;
import java.util.Random;
import java.util.TimeZone;

import org.junit.Test;

public class QuizTest {

	@Test
	public void test() throws SQLException, InterruptedException {
//		System.out.println(Category.searchByCategory("Food").size());
//		assertEquals(2, Category.searchByCategory("Food").size());
//		MultiChoice temp = new MultiChoice("FB", true);
//		System.out.println(temp.setProblemID());
//		Random rm = new Random();
//		System.out.println(rm.nextInt(XMLParser.DEFAULTIMAGES.size()));
		Quiz temp = new Quiz();
		temp.setQuizID("0000000005");
		System.out.println(temp.getUpdateSQL());
		temp.deleteProblem("QR0000000010");
		System.out.println(temp.getUpdateSQL());
		temp.updateDatabase();
	}

}
