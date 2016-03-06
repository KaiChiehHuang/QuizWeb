package xuandong;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;


import org.w3c.dom.*;
import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class XMLParser {
	
	/**
	 * Main method in XMLParser
	 * @param args the relative path of the file you want to parse
	 * e.g. src/quiz-xml/chinese_food.xml
	 */
	public static void main(String[] args) {
		try {
			File xmlFile = new File("src/quiz-xml/bunny.xml");
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
		String authorID = "Administration";
		String time = Quiz.df.format(new Date().getTime());
		String image = "";
		String insert = "INSERT INTO Quiz (QuizID, Name, Description, AuthorID, ProblemID, IsRandomQuiz, IsOnePage, IsImmediateCorrection, IsPracticeMode, Time, Image) VALUES(\"" + quizID + "\",\"" + name + "\",\"" + description + "\",\"" + authorID + "\",\"" + questions + "\"," + random + "," + onePage + "," + immediateCorrection + "," + practiceMode + ",\"" + time + "\",\"" + image + "\");";
		stmt.executeUpdate(insert);
		return quizID;
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
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

}
