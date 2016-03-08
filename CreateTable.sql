USE c_cs108_xuandong;

# BOOLEAN: 0, 1
# DATETIME: 1973-12-30 15:30:00

# Drop tables
DROP TABLE IF EXISTS Emails;
DROP TABLE IF EXISTS QuizRecord;
DROP TABLE IF EXISTS MultiResponse;
DROP TABLE IF EXISTS MultiChoice;
DROP TABLE IF EXISTS QuestionResponse;
DROP TABLE IF EXISTS PictureResponse;
DROP TABLE IF EXISTS FillBlank;
DROP TABLE IF EXISTS SingleChoice;
DROP TABLE IF EXISTS Quiz;
DROP TABLE IF EXISTS Friendship;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Achievement;
DROP TABLE IF EXISTS Administrator;
DROP TABLE IF EXISTS Announcement;

CREATE TABLE Users (
	UserID      VARCHAR(255) NOT NULL,
	Password    VARCHAR(255) NOT NULL,
	Name        VARCHAR(255),
	Age         INT,
	Gender      CHAR(5),
	Achievement VARCHAR(255),
	PRIMARY KEY (UserID)
);

INSERT INTO Users VALUES("Administration","b8be3d1264310c3b8c848d4b90d5206179a40cc4","Admin",,"unknown","");
INSERT INTO Users VALUES("guest","35675e68f4b5af7b995d9205ad0fc43842f16450","Guest",,"unknown","");
INSERT INTO Users VALUES("jay","f1bfbf317598ea9c3b0fd25a90f4bbd0b434bbc7","Kaijie Huang",25,"Male","");


CREATE TABLE Friendship (
	User1ID     VARCHAR(255),
	User2ID     VARCHAR(255),
	Pending     BOOLEAN,
	PRIMARY KEY (User1ID, User2ID),
	FOREIGN KEY (User1ID)
		REFERENCES Users(UserID)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (User2ID)
		REFERENCES Users(UserID)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Quiz (
	QuizID                VARCHAR(255),
	Name                  VARCHAR(255),
	Description           TEXT,
	AuthorID              VARCHAR(255),
	ProblemID             TEXT,
	IsRandomQuiz          BOOLEAN,
	IsOnePage             BOOLEAN,
	IsImmediateCorrection BOOLEAN,
	IsPracticeMode        BOOLEAN,
	Time                  DATETIME,
	Image                 TEXT,
	PRIMARY KEY (QuizID),
	FOREIGN KEY (AuthorID)
		REFERENCES Users(UserID)
		ON DELETE CASCADE ON UPDATE CASCADE
);

-- DROP TABLE IF EXISTS SingleChoice;

-- CREATE TABLE SingleChoice (
-- 	QuestionID VARCHAR(255),
-- 	Question   TEXT,
-- 	Choices    TEXT,
-- 	Answer     TEXT,
-- 	PRIMARY KEY (QuestionID)
-- );

CREATE TABLE FillBlank (
	QuestionID VARCHAR(255),
	Question   TEXT,
	Answer     TEXT,
	PRIMARY KEY (QuestionID)
);

CREATE TABLE PictureResponse (
	QuestionID VARCHAR(255),
	Question   TEXT,
	URL        TEXT,
	Answer     TEXT,
	PRIMARY KEY (QuestionID)
);

CREATE TABLE QuestionResponse (
	QuestionID VARCHAR(255),
	Question   TEXT,
	Answer     TEXT,
	PRIMARY KEY (QuestionID)
);

CREATE TABLE MultiChoice (
	QuestionID VARCHAR(255),
	Question   TEXT,
	Choices    TEXT,
	Answer     TEXT,
	Count      INT,
	PRIMARY KEY (QuestionID)
);

CREATE TABLE MultiResponse (
	QuestionID VARCHAR(255),
	Question   TEXT,
	Answer     TEXT,
	Count      INT,
	PRIMARY KEY (QuestionID)
);

-- INSERT INTO QuizRecord VALUES("0000000000","Administration","2016-03-05 15:30:57","2016-03-05 15:31:57","00:01:00",97);

CREATE TABLE QuizRecord (
	QuizID    VARCHAR(255),
	UserID    VARCHAR(255),
	StartTime DATETIME,
	EndTime   DATETIME,
	Duration  TIME,
	Score     DECIMAL(5,2),
	PRIMARY KEY (QuizID, UserID, StartTime),
	FOREIGN KEY (QuizID)
		REFERENCES Quiz(QuizID)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (UserID)
		REFERENCES Users(UserID)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Emails (
	SenderID        VARCHAR(255),
	ReceiverID      VARCHAR(255),
	Time            DATETIME,
	Subject         TEXT,
	Content         TEXT,
	Link            TEXT,
	IsRead          BOOLEAN,
	PRIMARY KEY (SenderID, ReceiverID, Time)
);

INSERT INTO Emails(SenderID, ReceiverID, Time, Subject, Content, Link, IsRead) VALUES("Administration","jay","2016-03-05 15:30:57","Testing","If you can see this email, it means our system works! :)","",false);

CREATE TABLE Achievement (
	UserID           VARCHAR(255),
	QuizID           VARCHAR(255),
	Time             DATETIME,
	AchievementName  VARCHAR(255),
	PRIMARY KEY (UserID, Time)
);

CREATE TABLE Administrator (
	AdminID     VARCHAR(255),
	PRIMARY KEY (AdminID)
);

CREATE TABLE Announcement (
	Content   TEXT,
	AdminID   VARCHAR(255),
	Time      DATETIME,
	Subject   Text,
	PRIMARY KEY (AdminID, Time)
);