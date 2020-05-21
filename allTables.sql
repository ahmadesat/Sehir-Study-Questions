CREATE TABLE if not exists Courses (
  id int NOT NULL AUTO_INCREMENT,
  course_code varchar(15) unique,
  course_name varchar(41),
  course_prof varchar(118),
  PRIMARY KEY (id)
)DEFAULT CHARSET=utf8mb4;

create table if not exists Instructor(
id int NOT NULL auto_increment,
name varchar(30) NOT NULL,
email varchar(35) NOT NULL unique,
password varchar(20) NOT NULL,
PRIMARY KEY (id)
);

create table if not exists Student(
id int NOT NULL auto_increment,
name varchar(30) NOT NULL,
email varchar(35) NOT NULL unique,
password varchar(20) NOT NULL,
score int DEFAULT 0,
PRIMARY KEY (id)
);


CREATE TABLE if not exists Question (
  id int NOT NULL AUTO_INCREMENT,
  course_id int NOT NULL,
  posted_by int NOT NULL,
  description varchar(500) DEFAULT NULL,
  input varchar(200),
  output varchar(200) NOT NULL,
  difficulty int DEFAULT 1,
  p_value int DEFAULT 0,
  postingDate date,
  PRIMARY KEY (id),
  FOREIGN KEY (course_id) REFERENCES courses (id) ON DELETE CASCADE,
  FOREIGN KEY (posted_by) REFERENCES instructor (id)
);

CREATE TABLE if not exists Answer (
posted_by int NOT NULL,
q_id int NOT NULL,
description varchar(1000) DEFAULT NULL,
status int(1) DEFAULT -1,
postingDate date,
FOREIGN KEY (q_id) REFERENCES question (id) ON DELETE CASCADE,
FOREIGN KEY (posted_by) REFERENCES student (id)
);
CREATE UNIQUE INDEX uniqueCombination ON answer (posted_by, q_id);


create table if not exists rated_by(
rate int(1),
student_id int,
question_id int not null,
foreign key (student_id) REFERENCES Student(id),
foreign key (question_id) REFERENCES Question(id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX uniqueCombination2 ON rated_by (student_id, question_id);
