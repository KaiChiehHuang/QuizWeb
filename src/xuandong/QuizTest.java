package xuandong;

import static org.junit.Assert.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.Date;
import java.util.Random;
import java.util.TimeZone;

import org.junit.Test;

import com.mysql.fabric.xmlrpc.base.Data;
import com.mysql.jdbc.DatabaseMetaData;

import bian.User;

public class QuizTest {

	@Test
	public void test() throws SQLException, InterruptedException {
		String aa="fasdf\"\"asdf\"";
		System.out.println(aa.replace("\"", "\"\""));
		DBConnection dabatase = new DBConnection();
		ResultSet res = dabatase.getStmt().executeQuery("SELECT Question From FillBlank WHERE QuestionID = \"FB0000000002\";");
		res.next();
		System.out.println(res.getString(1));
		dabatase.getCon().close();
	}

}
