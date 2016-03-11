USE c_cs108_kaichieh;

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
DROP TABLE IF EXISTS Achievement;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Tags;
DROP TABLE IF EXISTS Quiz;
DROP TABLE IF EXISTS Friendship;
DROP TABLE IF EXISTS Announcement;
DROP TABLE IF EXISTS Administrator;
DROP TABLE IF EXISTS Users;


CREATE TABLE Users (
	UserID      VARCHAR(255) NOT NULL,
	Password    VARCHAR(255) NOT NULL,
	Name        VARCHAR(255),
	Age         INT,
	Gender      CHAR(7),
	Achievement VARCHAR(255),
	PRIMARY KEY (UserID)
);

INSERT INTO Users VALUES("Administration","b8be3d1264310c3b8c848d4b90d5206179a40cc4","Admin",0,"unknown","");
INSERT INTO Users VALUES("guest","35675e68f4b5af7b995d9205ad0fc43842f16450","Guest",0,"unknown","");
INSERT INTO Users VALUES("jay","f1bfbf317598ea9c3b0fd25a90f4bbd0b434bbc7","Kaijie Huang",25,"Male","");
INSERT INTO Users VALUES("xuandong","e26c25174fc72c4e3f9073342eec938ec27b1887","Xuandong Lei",23,"Male","");
INSERT INTO Users VALUES("bian","fd9959b8097a0363d19da68eea7b97f8a6ae6f6d","Lu Bian",23,"Female","");
INSERT INTO Users VALUES("yuan","35015dd23b25a435592d3418396d595f5ef2cbb1","Yuan Yuan",24,"Female","");


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

INSERT INTO Friendship VALUES("xuandong","bian",false);
INSERT INTO Friendship VALUES("xuandong","jay",false);
INSERT INTO Friendship VALUES("xuandong","yuan",false);
INSERT INTO Friendship VALUES("jay","xuandong",false);
INSERT INTO Friendship VALUES("jay","yuan",false);
INSERT INTO Friendship VALUES("jay","bian",false);
INSERT INTO Friendship VALUES("bian","jay",false);
INSERT INTO Friendship VALUES("bian","xuandong",false);
INSERT INTO Friendship VALUES("bian","yuan",false);
INSERT INTO Friendship VALUES("yuan","xuandong",false);
INSERT INTO Friendship VALUES("yuan","jay",false);
INSERT INTO Friendship VALUES("yuan","bian",false);

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
	Ordered    BOOLEAN,
	PRIMARY KEY (QuestionID)
);

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

-- INSERT INTO QuizRecord VALUES("0000000000","jay","2016-03-05 15:30:57","2016-03-05 15:31:57","00:01:00",97.1);

CREATE TABLE Emails (
	SenderID        VARCHAR(255),
	ReceiverID      VARCHAR(255),
	Time            DATETIME,
	Subject         TEXT,
	Content         TEXT,
	Link            TEXT,
	IsRead          BOOLEAN,
	PRIMARY KEY (SenderID, ReceiverID, Time),
	FOREIGN KEY (SenderID)
		REFERENCES Users(UserID)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (ReceiverID)
		REFERENCES Users(UserID)
		ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Emails(SenderID, ReceiverID, Time, Subject, Content, Link, IsRead) VALUES("Administration","jay","2016-03-04 15:30:57","Testing1","If you can see this email, it means our system works! :)","",false);
INSERT INTO Emails(SenderID, ReceiverID, Time, Subject, Content, Link, IsRead) VALUES("Administration","jay","2016-03-05 15:30:57","Testing2","If you can see this email, it means our system works! :)","",false);
INSERT INTO Emails(SenderID, ReceiverID, Time, Subject, Content, Link, IsRead) VALUES("Administration","jay","2016-03-06 15:30:57","Testing3","If you can see this email, it means our system works! :)","",false);
INSERT INTO Emails(SenderID, ReceiverID, Time, Subject, Content, Link, IsRead) VALUES("Administration","jay","2016-03-07 15:30:57","Testing4","If you can see this email, it means our system works! :)","",false);


CREATE TABLE Achievement (
	UserID           VARCHAR(255),
	QuizID           VARCHAR(255),
	Time             DATETIME,
	AchievementName  VARCHAR(255),
	PRIMARY KEY (UserID, AchievementName),
	FOREIGN KEY (UserID)
		REFERENCES Users(UserID)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (QuizID)
		REFERENCES Quiz(QuizID)
);

CREATE TABLE Administrator (
	AdminID     VARCHAR(255),
	PRIMARY KEY (AdminID),
	FOREIGN KEY (AdminID)
		REFERENCES Users(UserID)
		ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Administrator(AdminID) VALUES ("Administration");

CREATE TABLE Announcement (
	Content   TEXT,
	AdminID   VARCHAR(255),
	Time      DATETIME,
	Subject   Text,
	PRIMARY KEY (AdminID, Time),
	FOREIGN KEY (AdminID)
		REFERENCES Administrator(AdminID)
		ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Announcement(Content, AdminID, Time, Subject) VALUES ("Welcome to QuizWeb! :)","Administration","2016-03-04 15:30:57","Welcome");

CREATE TABLE Category (
	QuizID       VARCHAR(255),
	Category     VARCHAR(255),
	PRIMARY KEY  (QuizID),
	FOREIGN KEY  (QuizID)
		REFERENCES Quiz(QuizID)
		ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Tags (
	QuizID		VARCHAR(255),
	Tag         VARCHAR(255),
	PRIMARY KEY  (QuizID, Tag),
	FOREIGN KEY  (QuizID)
		REFERENCES Quiz(QuizID)
		ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Reviews (
	QuizID		VARCHAR(255),
	UserID      VARCHAR(255),
	Review      TEXT,
	Time        DATETIME,
	Anonymous   BOOLEAN,
	PRIMARY KEY (QuizID, UserID, Time),
	FOREIGN KEY  (QuizID)
		REFERENCES Quiz(QuizID)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY  (UserID)
		REFERENCES Users(UserID)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Ratings(
	QuizID      VARCHAR(255),
	UserID      VARCHAR(255),
	Rating      DECIMAL(2,1),
	Time        DATETIME,
	PRIMARY KEY (QuizID, UserID, Time),
	FOREIGN KEY  (QuizID)
		REFERENCES Quiz(QuizID)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY  (UserID)
		REFERENCES Users(UserID)
		ON DELETE CASCADE ON UPDATE CASCADE
);


