CREATE TABLE [Questions] (
  [questionID] nvarchar(4),
  [question] nvarchar(20),
  [correctAnswer] nvarchar(20),
  [choice1] nvarchar(20),
  [choice2] nvarchar(20),
  [choice3] nvarchar(20),
  [choice4] nvarchar(20),
  PRIMARY KEY ([questionID])
);

CREATE TABLE [Exams] (
  [examID] nvarchar(4),
  [examName] nvarchar(20),
  [examDate] nvarchar(20),
  [examPoints] nvarchar(20),
  PRIMARY KEY ([examID])
);

CREATE TABLE [ExamQuestions] (
  [examQuestionID] nvarchar(4),
  [questionID] nvarchar(4),
  [examID] nvarchar(4),
  PRIMARY KEY ([examQuestionID]),
  CONSTRAINT [FK_ExamQuestions.questionID]
    FOREIGN KEY ([questionID])
      REFERENCES [Questions]([questionID]),
  CONSTRAINT [FK_ExamQuestions.examID]
    FOREIGN KEY ([examID])
      REFERENCES [Exams]([examID])
);

insert into Questions values('Q101','Question 1','A','A','B','C','D')
insert into Questions values('Q102','Question 2','B','A','B','C','D')
insert into Questions values('Q103','Question 3','C','A','B','C','D')
insert into Questions values('Q104','Question 4','D','A','B','C','D')
insert into Questions values('Q105','Question 5','A','A','B','C','D')

insert into Exams values('E101','Person 1','8/21/23','30')
insert into Exams values('E102','Person 2','8/21/23','30')
insert into Exams values('E103','Person 3','8/21/23','30')
insert into Exams values('E104','Person 4','8/21/23','30')
insert into Exams values('E105','Person 5','8/21/23','30')

insert into ExamQuestions values('EQ01','Q101','E101')
insert into ExamQuestions values('EQ02','Q102','E101')
insert into ExamQuestions values('EQ03','Q103','E102')
insert into ExamQuestions values('EQ04','Q104','E103')
insert into ExamQuestions values('EQ05','Q105','E104')