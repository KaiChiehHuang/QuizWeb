package xuandong;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;

import org.w3c.dom.*;

import java.io.File;
import java.io.FileWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

public class XMLParser {
	
//	public static final String DEFAULTIMAGE = "http://blog.beeliked.com/wp-content/uploads/2015/08/1-Dollarphotoclub_54825547.jpg";
	
	public static final ArrayList<String> DEFAULTIMAGES = new ArrayList<String>();
	static
	{
			DEFAULTIMAGES.add("http://blog.beeliked.com/wp-content/uploads/2015/08/1-Dollarphotoclub_54825547.jpg");
			DEFAULTIMAGES.add("https://www.drupal.org/files/project-images/quiz-image_0.jpg");
			DEFAULTIMAGES.add("http://www.yadavdilse.com/wp-content/uploads/2015/08/Optimized-quiz.jpg");
			DEFAULTIMAGES.add("http://gonitsora.com/wp-content/uploads/2015/03/quiz.jpg");
			DEFAULTIMAGES.add("http://www.satollo.net/wp-content/uploads/2015/03/quiz.jpg");
	};

	/**
	 * Main method in XMLParser
	 * @param args the relative path of the file you want to parse
	 * e.g. src/quiz-xml/chinese_food.xml
	 */
	public static void main(String[] args) {
		try {
			String path = "src/quiz-xml/test.xml";
			if (args.length == 1) {
				path = "src/quiz-xml/testxml.xml";
				File file = new File(path);
				FileWriter fw = new FileWriter(file, true);
				if (file.exists()) {
					fw.write(args[0]);
				} else {
					file.createNewFile();
					fw.write(args[0]);
				}
				fw.flush();
				fw.close();
				file.delete();
			}
			File xmlFile = new File(path);
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(xmlFile);
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("question");
			String questions = "";
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					String type = eElement.getAttribute("type");
					switch (type) {
					case "question-response": questions += addQR(eElement) + "|";
							break;
					case "fill-in-blank": questions += addFB(eElement) + "|";
							break;
					case "multiple-choice": questions += addMC(eElement) + "|";
							break;
					case "picture-response": questions += addPR(eElement) + "|";
							break;
					case "multiple-response": questions += addMR(eElement) + "|";
							break;
					}
				}
			}
			questions = questions.substring(0, questions.length() - 1);
			addQuiz(doc, questions);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	/**
	 * Add the quiz to database
	 * @param doc
	 * @param questions
	 * @return quizID
	 * @throws SQLException
	 */
	public static String addQuiz(Document doc, String questions) throws SQLException {
		DBConnection database = new DBConnection();
		Statement stmt = database.getStmt();
		
		String sql = "SELECT QuizID FROM Quiz ORDER BY QuizID DESC LIMIT 1;";
		ResultSet res = stmt.executeQuery(sql);
		String quizID = "";
		if (res.next()) {
			int quizCount = Integer.parseInt(res.getString(1)) + 1;
			quizID = String.format("%010d", quizCount);
		} else {
			int questionCount = 0;
			quizID = String.format("%010d", questionCount);
		}
		String name = doc.getElementsByTagName("title").item(0).getTextContent();
		String description = doc.getElementsByTagName("description").item(0).getTextContent();
		Element quiz = (Element) doc.getElementsByTagName("quiz").item(0);
		boolean random = false;
		if (quiz.getAttribute("random") != null) {
			random = Boolean.parseBoolean(quiz.getAttribute("random"));
		}
		boolean onePage = false;
		if (quiz.getAttribute("one-page") != null) {
			onePage = Boolean.parseBoolean(quiz.getAttribute("one-page"));
		}
		boolean immediateCorrection = false;
		if (quiz.getAttribute("immediate-correction") != null) {
			immediateCorrection = Boolean.parseBoolean(quiz.getAttribute("immediate-correction"));
		}
		boolean practiceMode = false;
		if (quiz.getAttribute("practice-mode") != null) {
			practiceMode = Boolean.parseBoolean(quiz.getAttribute("practice-mode"));
		}
		String authorID = "xuandong";
		String time = Quiz.df.format(new Date().getTime());
		Random rm = new Random();
		String image = DEFAULTIMAGES.get(rm.nextInt(DEFAULTIMAGES.size()));
		if (doc.getElementsByTagName("quiz-image").item(0) != null) {
			image = doc.getElementsByTagName("quiz-image").item(0).getTextContent();
		}
		String insert = "INSERT INTO Quiz (QuizID, Name, Description, AuthorID, ProblemID, IsRandomQuiz, IsOnePage, IsImmediateCorrection, IsPracticeMode, Time, Image) VALUES(\"" + quizID + "\",\"" + name + "\",\"" + description + "\",\"" + authorID + "\",\"" + questions + "\"," + random + "," + onePage + "," + immediateCorrection + "," + practiceMode + ",\"" + time + "\",\"" + image + "\");";
		stmt.executeUpdate(insert);
		if (doc.getElementsByTagName("category").item(0) != null) {
			String category = doc.getElementsByTagName("category").item(0).getTextContent();
			stmt.executeUpdate("INSERT INTO Category(QuizID, Category) VALUES(\"" + quizID + "\",\"" + category + "\");");
		}
		database.getCon().close();
		return quizID;
	}
	
	
	private static String addMR(Element ele) {
		String id = "";
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT QuestionID FROM MultiResponse ORDER BY QuestionID DESC LIMIT 1;";
			ResultSet res = stmt.executeQuery(sql);
			if (res.next()) {
				int questionCount = Integer.parseInt(res.getString(1).substring(2));
				questionCount++;
				id = "MR" + String.format("%010d", questionCount);
			} else {
				int questionCount = 0;
				id = "MR" + String.format("%010d", questionCount);
			}
			String question = ele.getElementsByTagName("query").item(0).getTextContent();
			String answer = "";
			int count = 0;
			NodeList nList = ele.getElementsByTagName("answer-list");
			for (int i = 0; i < nList.getLength(); i++) {
				Node nNode = nList.item(i);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eEle = (Element) nNode;
					NodeList nList2 = eEle.getElementsByTagName("answer");
					for (int j = 0; j < nList2.getLength(); j++) {
						Node nNode2 = nList2.item(j);
						if (nNode2.getNodeType() == Node.ELEMENT_NODE) {
							Element eEle2 = (Element) nNode2;
							answer += eEle2.getTextContent() + "#";
						}
					}
					answer = answer.substring(0, answer.length() - 1);
					answer += "|";
					count++;
				}
			}
			boolean ordered = false;
			if (ele.getAttribute("answer-ordered") != null) {
				ordered = Boolean.parseBoolean(ele.getAttribute("answer-ordered"));
			}
			answer = answer.substring(0, answer.length() - 1);
			String insert = "INSERT INTO MultiResponse VALUES(\"" + id + "\",\"" + question + "\",\"" + answer + "\"," + count + "," + ordered + ");";
			stmt.executeUpdate(insert);
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	
	
	/**
	 * add a QuestionResponse problem into database
	 * @param ele
	 * @return problemID
	 */
	public static String addQR(Element ele) {
		String id = "";
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT QuestionID FROM QuestionResponse ORDER BY QuestionID DESC LIMIT 1;";
			ResultSet res = stmt.executeQuery(sql);
			if (res.next()) {
				int questionCount = Integer.parseInt(res.getString(1).substring(2));
				questionCount++;
				id = "QR" + String.format("%010d", questionCount);
			} else {
				int questionCount = 0;
				id = "QR" + String.format("%010d", questionCount);
			}
			String question = ele.getElementsByTagName("query").item(0).getTextContent();
			NodeList nList = ele.getElementsByTagName("answer");
			String answer = "";
			for (int i = 0; i < nList.getLength(); i++) {
				Node nNode = nList.item(i);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eEle = (Element) nNode;
					answer += eEle.getTextContent() + "|";
				}
			}
			answer = answer.substring(0, answer.length() - 1);
			String insert = "INSERT INTO QuestionResponse VALUES(\"" + id + "\",\"" + question + "\",\"" + answer + "\");";
			stmt.executeUpdate(insert);
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	
	
	/**
	 * add an FillBlank problem into database
	 * @param ele
	 * @return problemID
	 */
	public static String addFB(Element ele) {
		String id = "";
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT QuestionID FROM FillBlank ORDER BY QuestionID DESC LIMIT 1;";
			ResultSet res = stmt.executeQuery(sql);
			if (res.next()) {
				int questionCount = Integer.parseInt(res.getString(1).substring(2));
				questionCount++;
				id = "FB" + String.format("%010d", questionCount);
			} else {
				int questionCount = 0;
				id = "FB" + String.format("%010d", questionCount);
			}
			String question = ele.getElementsByTagName("pre").item(0).getTextContent();
			question += " |||||| ";
			question += ele.getElementsByTagName("post").item(0).getTextContent();
			NodeList nList = ele.getElementsByTagName("answer");
			String answer = "";
			for (int i = 0; i < nList.getLength(); i++) {
				Node nNode = nList.item(i);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eEle = (Element) nNode;
					answer += eEle.getTextContent() + "|";
				}
			}
			answer = answer.substring(0, answer.length() - 1);
			String insert = "INSERT INTO FillBlank VALUES(\"" + id + "\",\"" + question + "\",\"" + answer + "\");";
			stmt.executeUpdate(insert);
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	
	
	/**
	 * add a MultiChoice problem into database
	 * @param ele
	 * @return problemID
	 */
	public static String addMC(Element ele) {
		String id = "";
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT QuestionID FROM MultiChoice ORDER BY QuestionID DESC LIMIT 1;";
			ResultSet res = stmt.executeQuery(sql);
			if (res.next()) {
				int questionCount = Integer.parseInt(res.getString(1).substring(2));
				questionCount++;
				id = "MC" + String.format("%010d", questionCount);
			} else {
				int questionCount = 0;
				id = "MC" + String.format("%010d", questionCount);
			}
			String question = ele.getElementsByTagName("query").item(0).getTextContent();
			NodeList nList = ele.getElementsByTagName("option");
			String choices = "";
			String answer = "";
			int count = 0;
			for (int i = 0; i < nList.getLength(); i++) {
				Node nNode = nList.item(i);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eEle = (Element) nNode;
					if (eEle.getAttribute("answer").equals("answer")) {
						answer += eEle.getTextContent() + "|";
						count++;
					}
					choices += eEle.getTextContent() + "|";
				}
			}
			answer = answer.substring(0, answer.length() - 1);
			choices = choices.substring(0, choices.length() - 1);
			String insert = "INSERT INTO MultiChoice VALUES(\"" + id + "\",\"" + question + "\",\"" + choices + "\",\"" + answer + "\"," + count + ");";
			stmt.executeUpdate(insert);
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	
	
	/**
	 * add a PictureResponse problem into database
	 * @param ele
	 * @return problemID
	 */
	public static String addPR(Element ele) {
		String id = "";
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT QuestionID FROM PictureResponse ORDER BY QuestionID DESC LIMIT 1;";
			ResultSet res = stmt.executeQuery(sql);
			if (res.next()) {
				int questionCount = Integer.parseInt(res.getString(1).substring(2));
				questionCount++;
				id = "PR" + String.format("%010d", questionCount);
			} else {
				int questionCount = 0;
				id = "PR" + String.format("%010d", questionCount);
			}
			String url = ele.getElementsByTagName("image-location").item(0).getTextContent();
			NodeList nList = ele.getElementsByTagName("answer");
			String answer = "";
			String question = "Please identify the person/city/item in the picture.";
			for (int i = 0; i < nList.getLength(); i++) {
				Node nNode = nList.item(i);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eEle = (Element) nNode;
					answer += eEle.getTextContent() + "|";
				}
			}
			answer = answer.substring(0, answer.length() - 1);
			String insert = "INSERT INTO PictureResponse VALUES(\"" + id + "\",\"" + question + "\",\"" + url + "\",\"" + answer + "\");";
			stmt.executeUpdate(insert);
			database.getCon().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

}
