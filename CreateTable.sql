USE c_cs108_yuan125;

# BOOLEAN: 0, 1
# DATETIME: 1973-12-30 15:30:00

DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
	UserID      VARCHAR(255),
	Password    VARCHAR(255),
	Name        VARCHAR(255),
	Age         INT,
	Gender      CHAR(5),
	Achievement VARCHAR(255),
	PRIMARY KEY (UserID)
);

DROP TABLE IF EXISTS Friendship;

CREATE TABLE Friendship (
	User1ID     VARCHAR(255),
	User2ID     VARCHAR(255),
	PRIMARY KEY (User1ID, User2ID),
	FOREIGN KEY (User1ID)
		REFERENCES Users deferrable initially deferred,
	FOREIGN KEY (User2ID)
		REFERENCES Users deferrable initially deferred
);

DROP TABLE IF EXISTS Quiz;

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
	PRIMARY KEY (QuizID),
	FOREIGN KEY (AuthorID)
		REFERENCES Users deferrable initially deferred
);

DROP TABLE IF EXISTS SingleChoice;

CREATE TABLE SingleChoice (
	QuestionID VARCHAR(255),
	Question TEXT,
	Choices TEXT,
	Answer TEXT,
	PRIMARY KEY (QuestionID)
);

DROP TABLE IF EXISTS FillBlank;

CREATE TABLE FillBlank (
	QuestionID VARCHAR(255),
	Question TEXT,
	Answer TEXT,
	PRIMARY KEY (QuestionID)
);

DROP TABLE IF EXISTS PictureResponse;

CREATE TABLE PictureResponse (
	QuestionID VARCHAR(255),
	Question TEXT,
	URL TEXT,
	Answer TEXT,
	PRIMARY KEY (QuestionID)
);

DROP TABLE IF EXISTS QuestionResponse;

CREATE TABLE QuestionResponse (
	QuestionID VARCHAR(255),
	Question TEXT,
	Answer TEXT,
	PRIMARY KEY (QuestionID)
);

DROP TABLE IF EXISTS MultiChoice;

CREATE TABLE MultiChoice (
	QuestionID VARCHAR(255),
	Question TEXT,
	Choices TEXT,
	Answer TEXT,
	Count INT,
	PRIMARY KEY (QuestionID)
);

DROP TABLE IF EXISTS MultiResponse;

CREATE TABLE MultiResponse (
	QuestionID VARCHAR(255),
	Question TEXT,
	Answer TEXT,
	Count INT,
	PRIMARY KEY (QuestionID)
);

DROP TABLE IF EXISTS QuizRecord;

CREATE TABLE QuizRecord (
	QuizID VARCHAR(255),
	UserID VARCHAR(255),
	StartTime DATETIME,
	EndTime DATETIME,
	Duration TIME,
	Score DECIMAL(5,2),
	PRIMARY KEY (QuizID, UserID, StartTime),
	FOREIGN KEY (QuizID)
		REFERENCES Quiz deferrable initially deferred,
	FOREIGN KEY (UserID)
		REFERENCES Users deferrable initially deferred
);





