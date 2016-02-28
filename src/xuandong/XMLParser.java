package xuandong;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.*;
import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class XMLParser {
	
	public static void main(String[] args) {
		try {
			File xmlFile = new File("src/quiz-xml/bunny.xml");
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(xmlFile);
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("question");
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					String type = eElement.getAttribute("type");
					switch (type) {
					case "question-response": addQR(eElement);
							break;
					case "fill-in-blank": addFB(eElement);
							break;
					case "multiple-choice": addMC(eElement);
							break;
					case "picture-response": addPR(eElement);
							break;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void addQR(Element ele) {
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT QuestionID FROM QuestionResponse ORDER BY QuestionID DESC LIMIT 1;";
			ResultSet res = stmt.executeQuery(sql);
			String id;
			if (res.next()) {
				int questionCount = Integer.parseInt(res.getString(1).substring(2));
				questionCount++;
				id = "QR" + String.format("%064d", questionCount);
			} else {
				int questionCount = 0;
				id = "QR" + String.format("%064d", questionCount);
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
	}
	
	public static void addFB(Element ele) {
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT QuestionID FROM FillBlank ORDER BY QuestionID DESC LIMIT 1;";
			ResultSet res = stmt.executeQuery(sql);
			String id;
			if (res.next()) {
				int questionCount = Integer.parseInt(res.getString(1).substring(2));
				questionCount++;
				id = "FB" + String.format("%064d", questionCount);
			} else {
				int questionCount = 0;
				id = "FB" + String.format("%064d", questionCount);
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
	}
	
	public static void addMC(Element ele) {
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT QuestionID FROM MultiChoice ORDER BY QuestionID DESC LIMIT 1;";
			ResultSet res = stmt.executeQuery(sql);
			String id;
			if (res.next()) {
				int questionCount = Integer.parseInt(res.getString(1).substring(2));
				questionCount++;
				id = "FB" + String.format("%064d", questionCount);
			} else {
				int questionCount = 0;
				id = "FB" + String.format("%064d", questionCount);
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
	}
	
	public static void addPR(Element ele) {
		try {
			DBConnection database = new DBConnection();
			Statement stmt = database.getStmt();
			String sql = "SELECT QuestionID FROM PictureResponse ORDER BY QuestionID DESC LIMIT 1;";
			ResultSet res = stmt.executeQuery(sql);
			String id;
			if (res.next()) {
				int questionCount = Integer.parseInt(res.getString(1).substring(2));
				questionCount++;
				id = "PR" + String.format("%064d", questionCount);
			} else {
				int questionCount = 0;
				id = "PR" + String.format("%064d", questionCount);
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
	}
}
