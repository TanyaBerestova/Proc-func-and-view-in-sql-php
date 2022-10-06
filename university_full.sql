--
-- Скрипт сгенерирован Devart dbForge Studio 2019 for MySQL, Версия 8.1.22.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 02.05.2019 10:37:57
-- Версия сервера: 5.7.25
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Удалить таблицу `group_student`
--
DROP TABLE IF EXISTS group_student;

--
-- Удалить таблицу `teach_course_facul_gr`
--
DROP TABLE IF EXISTS teach_course_facul_gr;

--
-- Удалить таблицу `group`
--
DROP TABLE IF EXISTS `group`;

--
-- Удалить таблицу `student_marks`
--
DROP TABLE IF EXISTS student_marks;

--
-- Удалить таблицу `student_study`
--
DROP TABLE IF EXISTS student_study;

--
-- Удалить таблицу `student`
--
DROP TABLE IF EXISTS student;

--
-- Удалить таблицу `teacher_course_faculty`
--
DROP TABLE IF EXISTS teacher_course_faculty;

--
-- Удалить таблицу `term`
--
DROP TABLE IF EXISTS term;

--
-- Удалить таблицу `faculty_course`
--
DROP TABLE IF EXISTS faculty_course;

--
-- Удалить таблицу `teacher_course`
--
DROP TABLE IF EXISTS teacher_course;

--
-- Удалить таблицу `course`
--
DROP TABLE IF EXISTS course;

--
-- Удалить таблицу `faculty`
--
DROP TABLE IF EXISTS faculty;

--
-- Удалить таблицу `teacher`
--
DROP TABLE IF EXISTS teacher;

--
-- Удалить таблицу `university`
--
DROP TABLE IF EXISTS university;

--
-- Создать таблицу `university`
--
CREATE TABLE university (
  university_id int(11) NOT NULL AUTO_INCREMENT,
  university_name varchar(100) NOT NULL,
  university_abbrevation varchar(50) NOT NULL,
  PRIMARY KEY (university_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `university_name` для объекта типа таблица `university`
--
ALTER TABLE university
ADD UNIQUE INDEX university_name (university_name);

--
-- Создать таблицу `teacher`
--
CREATE TABLE teacher (
  teacher_id int(11) NOT NULL AUTO_INCREMENT,
  last_name varchar(50) NOT NULL,
  midle_name varchar(50) DEFAULT NULL,
  first_name varchar(50) NOT NULL,
  birthday datetime NOT NULL,
  university_id int(11) DEFAULT NULL,
  curator_id int(11) DEFAULT NULL,
  PRIMARY KEY (teacher_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 11,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_teacher` для объекта типа таблица `teacher`
--
ALTER TABLE teacher
ADD UNIQUE INDEX UK_teacher (last_name, first_name);

--
-- Создать внешний ключ
--
ALTER TABLE teacher
ADD CONSTRAINT FK_teacher_teacher_teacher_id FOREIGN KEY (curator_id)
REFERENCES teacher (teacher_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE teacher
ADD CONSTRAINT FK_teacher_university_university_id FOREIGN KEY (university_id)
REFERENCES university (university_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `faculty`
--
CREATE TABLE faculty (
  faculty_id int(11) NOT NULL,
  faculty_name varchar(100) NOT NULL,
  faculty_abbrevation varchar(50) DEFAULT NULL,
  university_id int(11) DEFAULT NULL,
  PRIMARY KEY (faculty_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_faculty_faculty_name` для объекта типа таблица `faculty`
--
ALTER TABLE faculty
ADD UNIQUE INDEX UK_faculty_faculty_name (faculty_name);

--
-- Создать внешний ключ
--
ALTER TABLE faculty
ADD CONSTRAINT FK_faculty_university_university_id FOREIGN KEY (university_id)
REFERENCES university (university_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `course`
--
CREATE TABLE course (
  course_id int(11) NOT NULL AUTO_INCREMENT,
  course_name varchar(50) NOT NULL,
  PRIMARY KEY (course_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `course_name` для объекта типа таблица `course`
--
ALTER TABLE course
ADD UNIQUE INDEX course_name (course_name);

--
-- Создать таблицу `teacher_course`
--
CREATE TABLE teacher_course (
  teacher_course_id int(11) NOT NULL AUTO_INCREMENT,
  teacher_id int(11) NOT NULL,
  course_id int(11) NOT NULL,
  PRIMARY KEY (teacher_course_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 20,
AVG_ROW_LENGTH = 862,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_teacher_course` для объекта типа таблица `teacher_course`
--
ALTER TABLE teacher_course
ADD UNIQUE INDEX UK_teacher_course (teacher_id, course_id);

--
-- Создать внешний ключ
--
ALTER TABLE teacher_course
ADD CONSTRAINT FK_teacher_course_course_course_id FOREIGN KEY (course_id)
REFERENCES course (course_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE teacher_course
ADD CONSTRAINT FK_teacher_course_teacher_teacher_id FOREIGN KEY (teacher_id)
REFERENCES teacher (teacher_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `faculty_course`
--
CREATE TABLE faculty_course (
  faculty_course_id int(11) NOT NULL AUTO_INCREMENT,
  faculty_id int(11) NOT NULL,
  course_id int(11) NOT NULL,
  min_duration varchar(50) DEFAULT NULL,
  PRIMARY KEY (faculty_course_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 15,
AVG_ROW_LENGTH = 1170,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_faculty_course` для объекта типа таблица `faculty_course`
--
ALTER TABLE faculty_course
ADD UNIQUE INDEX UK_faculty_course (faculty_id, course_id);

--
-- Создать внешний ключ
--
ALTER TABLE faculty_course
ADD CONSTRAINT FK_faculty_course_course_course_id FOREIGN KEY (course_id)
REFERENCES course (course_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE faculty_course
ADD CONSTRAINT FK_faculty_course_faculty_faculty_id FOREIGN KEY (faculty_id)
REFERENCES faculty (faculty_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `term`
--
CREATE TABLE term (
  term_id int(11) NOT NULL AUTO_INCREMENT,
  start_date datetime NOT NULL,
  end_date datetime NOT NULL,
  PRIMARY KEY (term_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_term` для объекта типа таблица `term`
--
ALTER TABLE term
ADD UNIQUE INDEX UK_term (start_date, end_date);

--
-- Создать таблицу `teacher_course_faculty`
--
CREATE TABLE teacher_course_faculty (
  tcf_id int(11) NOT NULL,
  teacher_id int(11) NOT NULL,
  faculty_course_id int(11) NOT NULL,
  term_id int(11) NOT NULL,
  duration varchar(50) DEFAULT NULL,
  PRIMARY KEY (tcf_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 630,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_teacher_course_faculty` для объекта типа таблица `teacher_course_faculty`
--
ALTER TABLE teacher_course_faculty
ADD UNIQUE INDEX UK_teacher_course_faculty (teacher_id, faculty_course_id, term_id);

--
-- Создать внешний ключ
--
ALTER TABLE teacher_course_faculty
ADD CONSTRAINT FK_teacher_course_faculty_faculty_course_faculty_course_id FOREIGN KEY (faculty_course_id)
REFERENCES faculty_course (faculty_course_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE teacher_course_faculty
ADD CONSTRAINT FK_teacher_course_faculty_teacher_teacher_id FOREIGN KEY (teacher_id)
REFERENCES teacher (teacher_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE teacher_course_faculty
ADD CONSTRAINT FK_teacher_course_faculty_term_term_id FOREIGN KEY (term_id)
REFERENCES term (term_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `student`
--
CREATE TABLE student (
  student_id int(11) NOT NULL,
  last_name varchar(50) NOT NULL,
  midle_name varchar(50) NOT NULL,
  first_name varchar(50) NOT NULL,
  sex int(11) DEFAULT NULL,
  birthday datetime NOT NULL,
  PRIMARY KEY (student_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1092,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_student` для объекта типа таблица `student`
--
ALTER TABLE student
ADD UNIQUE INDEX UK_student (last_name, first_name, birthday);

--
-- Создать таблицу `student_study`
--
CREATE TABLE student_study (
  student_study_id int(11) NOT NULL AUTO_INCREMENT,
  student_id int(11) NOT NULL,
  student_number int(11) NOT NULL,
  start_date datetime NOT NULL,
  end_date datetime NOT NULL,
  PRIMARY KEY (student_study_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 18,
AVG_ROW_LENGTH = 963,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_student_study` для объекта типа таблица `student_study`
--
ALTER TABLE student_study
ADD UNIQUE INDEX UK_student_study (student_id, student_number, start_date);

--
-- Создать внешний ключ
--
ALTER TABLE student_study
ADD CONSTRAINT FK_student_study_student_student_id FOREIGN KEY (student_id)
REFERENCES student (student_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `student_marks`
--
CREATE TABLE student_marks (
  student_mark_id int(11) NOT NULL AUTO_INCREMENT,
  student_id int(11) NOT NULL,
  course_id int(11) NOT NULL,
  mark int(11) DEFAULT NULL,
  term_id int(11) DEFAULT NULL,
  PRIMARY KEY (student_mark_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 46,
AVG_ROW_LENGTH = 364,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_student_marks` для объекта типа таблица `student_marks`
--
ALTER TABLE student_marks
ADD UNIQUE INDEX UK_student_marks (student_id, course_id, mark, term_id);

--
-- Создать внешний ключ
--
ALTER TABLE student_marks
ADD CONSTRAINT FK_student_marks_course_course_id FOREIGN KEY (course_id)
REFERENCES course (course_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE student_marks
ADD CONSTRAINT FK_student_marks_student_student_id FOREIGN KEY (student_id)
REFERENCES student (student_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `group`
--
CREATE TABLE `group` (
  group_id int(11) NOT NULL AUTO_INCREMENT,
  group_number int(11) NOT NULL,
  faculty_id int(11) NOT NULL,
  PRIMARY KEY (group_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_group` для объекта типа таблица `group`
--
ALTER TABLE `group`
ADD UNIQUE INDEX UK_group (group_number, faculty_id);

--
-- Создать таблицу `teach_course_facul_gr`
--
CREATE TABLE teach_course_facul_gr (
  tcfg_id int(11) NOT NULL,
  tcf_id int(11) NOT NULL,
  group_id int(11) NOT NULL,
  PRIMARY KEY (tcfg_id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE teach_course_facul_gr
ADD CONSTRAINT FK_teach_course_facul_gr_group_group_id FOREIGN KEY (group_id)
REFERENCES `group` (group_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE teach_course_facul_gr
ADD CONSTRAINT FK_teach_course_facul_gr_teacher_course_faculty_tcf_id FOREIGN KEY (tcf_id)
REFERENCES teacher_course_faculty (tcf_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `group_student`
--
CREATE TABLE group_student (
  group_student_id int(11) NOT NULL AUTO_INCREMENT,
  group_id int(11) NOT NULL,
  student_id int(11) NOT NULL,
  is_head int(11) DEFAULT NULL,
  PRIMARY KEY (group_student_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 16,
AVG_ROW_LENGTH = 1092,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_group_student` для объекта типа таблица `group_student`
--
ALTER TABLE group_student
ADD UNIQUE INDEX UK_group_student (group_id, student_id);

--
-- Создать внешний ключ
--
ALTER TABLE group_student
ADD CONSTRAINT FK_group_student_group_group_id FOREIGN KEY (group_id)
REFERENCES `group` (group_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE group_student
ADD CONSTRAINT FK_group_student_student_student_id FOREIGN KEY (student_id)
REFERENCES student (student_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Вывод данных для таблицы university
--
INSERT INTO university VALUES
(1, 'Санкт-Петербургский Государственный Университет', 'СПбГУ'),
(2, 'Санкт-Петербургский Политехнический Университет Петра Великого', 'Политех');

-- 
-- Вывод данных для таблицы faculty
--
INSERT INTO faculty VALUES
(1, 'Математико-механический факультет', 'Мат-мех', 1),
(2, 'Физический факультет', 'Физ-фак', 1),
(3, 'Экономический факультет', NULL, 1),
(4, 'Факультет прикладной математики и процессов управления', 'ПМ-ПУ', 1);

-- 
-- Вывод данных для таблицы course
--
INSERT INTO course VALUES
(1, 'Алгебра'),
(3, 'Высшая математика'),
(2, 'Геометрия'),
(5, 'История'),
(4, 'Оптика'),
(6, 'Теория вероятностей'),
(7, 'Экономическая теория');

-- 
-- Вывод данных для таблицы term
--
INSERT INTO term VALUES
(1, '2005-09-01 00:00:00', '2006-01-31 00:00:00'),
(2, '2006-02-10 00:00:00', '2006-06-30 00:00:00');

-- 
-- Вывод данных для таблицы teacher
--
INSERT INTO teacher VALUES
(1, 'Петров', 'Алексеевич', 'Иван', '1964-04-13 00:00:00', 1, NULL),
(2, 'Никитин', 'Петрович', 'Сергей', '1961-06-23 00:00:00', 1, NULL),
(3, 'Иванов', 'Юрьевич', 'Олег', '1945-10-01 00:00:00', 1, NULL),
(4, 'Носов', 'Андреевич', 'Максим', '1972-12-25 00:00:00', 1, 2),
(5, 'Алексеев', 'Сергеевич', 'Алексей', '1969-03-12 00:00:00', 1, NULL),
(6, 'Данилов', 'Иванович', 'Александр', '1979-04-22 00:00:00', 1, 1),
(7, 'Сидоров', 'Игоревич', 'Денис', '1975-05-02 00:00:00', 1, 1),
(8, 'Лаптев', 'Сергеевич', 'Андрей', '1971-07-19 00:00:00', 1, NULL),
(9, 'Стеклов', 'Валерьевич', 'Никита', '1950-08-20 00:00:00', 1, 2),
(10, 'Оленев', 'Андреевич', 'Игорь', '1940-10-25 00:00:00', 1, 3);

-- 
-- Вывод данных для таблицы faculty_course
--
INSERT INTO faculty_course VALUES
(1, 1, 1, '80.00'),
(2, 1, 2, '80.00'),
(3, 1, 5, '32.00'),
(4, 1, 6, '24.00'),
(5, 2, 3, '64.00'),
(6, 2, 4, '80.00'),
(7, 2, 5, '32.00'),
(8, 3, 3, '82.00'),
(9, 3, 6, '54.00'),
(10, 3, 7, '94.00'),
(11, 4, 1, '64.00'),
(12, 4, 2, '32.00'),
(13, 4, 5, '24.00'),
(14, 4, 7, '32.00');

-- 
-- Вывод данных для таблицы teacher_course_faculty
--
INSERT INTO teacher_course_faculty VALUES
(1, 1, 1, 1, '80.00'),
(2, 1, 1, 2, '80.00'),
(3, 1, 11, 1, '68.00'),
(4, 5, 11, 2, '68.00'),
(6, 5, 2, 1, '82.00'),
(7, 1, 8, 1, '82.00'),
(8, 10, 8, 2, '82.00'),
(9, 2, 9, 1, '60.00'),
(10, 2, 9, 2, '60.00'),
(11, 4, 10, 1, '94.00'),
(12, 7, 10, 2, '100.00'),
(13, 3, 3, 2, '30.00'),
(14, 8, 1, 2, '90.00'),
(15, 2, 4, 1, '26.00'),
(16, 8, 4, 1, '28.00'),
(17, 1, 12, 1, '30.00'),
(18, 5, 12, 1, '28.00'),
(19, 4, 14, 2, '32.00'),
(20, 7, 14, 2, '34.00'),
(21, 1, 5, 1, '64.00'),
(22, 1, 5, 2, '64.00'),
(23, 6, 5, 1, '100.00'),
(24, 3, 7, 2, '32.00'),
(25, 6, 6, 1, '80.00'),
(26, 10, 6, 1, '80.00'),
(27, 10, 6, 2, '82.00');

-- 
-- Вывод данных для таблицы student
--
INSERT INTO student VALUES
(1, 'Дмитриев', 'Андреевич', 'Максим', 1, '1989-12-12 00:00:00'),
(2, 'Жуков', 'Иванович', 'Андрей', 1, '1989-10-23 00:00:00'),
(3, 'Шарапова', 'Сергеевна', 'Анна', 0, '1986-01-07 00:00:00'),
(4, 'Власова', 'Алексеевна', 'Светлана', 0, '1986-03-08 00:00:00'),
(5, 'Алиев', 'Петрович', 'Искандер', 1, '1986-04-27 00:00:00'),
(6, 'Кузнецов', 'Игоревич', 'Павел', 1, '1985-05-02 00:00:00'),
(7, 'Кузнецова', 'Игоревна', 'Алла', 0, '1985-05-07 00:00:00'),
(8, 'Миронов', 'Петрович', 'Андрей', 1, '1985-05-28 00:00:00'),
(9, 'Голубева', 'Павловна', 'Полина', 0, '1985-05-07 00:00:00'),
(10, 'Орлов', 'Максимович', 'Андрей', 1, '1985-09-17 00:00:00'),
(11, 'Толстой', 'Юрьевич', 'Стас', 1, '1989-06-06 00:00:00'),
(12, 'Иванов', 'Сергеевич', 'Сергей', 1, '1985-12-07 00:00:00'),
(13, 'Сидорова', 'Сергеевна', 'Анастасия', 0, '1984-11-24 00:00:00'),
(14, 'Кузнецова', 'Андреевна', 'Ольга', 0, '1986-10-10 00:00:00'),
(15, 'Кузнецов', 'Олегович', 'Андрей', 1, '1989-09-12 00:00:00');

-- 
-- Вывод данных для таблицы `group`
--
INSERT INTO `group` VALUES
(1, 13, 1),
(3, 13, 2),
(4, 13, 3),
(2, 14, 1),
(5, 15, 4),
(6, 21, 4);

-- 
-- Вывод данных для таблицы teach_course_facul_gr
--
-- Таблица university_full.teach_course_facul_gr не содержит данных

-- 
-- Вывод данных для таблицы teacher_course
--
INSERT INTO teacher_course VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 3),
(5, 2, 6),
(6, 3, 5),
(8, 4, 6),
(7, 4, 7),
(9, 5, 1),
(10, 5, 2),
(12, 6, 3),
(11, 6, 4),
(13, 7, 7),
(14, 8, 1),
(15, 8, 3),
(16, 8, 6),
(17, 9, 5),
(19, 10, 3),
(18, 10, 4);

-- 
-- Вывод данных для таблицы student_study
--
INSERT INTO student_study VALUES
(1, 1, 12, '2001-09-01 00:00:00', '2006-06-30 00:00:00'),
(2, 2, 13, '2001-09-01 00:00:00', '2006-06-30 00:00:00'),
(3, 3, 14, '2001-09-01 00:00:00', '2003-06-30 00:00:00'),
(4, 3, 34, '2004-09-01 00:00:00', '2007-06-30 00:00:00'),
(5, 4, 122, '2001-09-01 00:00:00', '2006-06-30 00:00:00'),
(6, 5, 232, '2001-09-01 00:00:00', '2006-06-30 00:00:00'),
(7, 6, 44, '2001-09-01 00:00:00', '2003-06-30 00:00:00'),
(8, 7, 52, '2001-09-01 00:00:00', '2002-06-30 00:00:00'),
(9, 7, 52, '2002-09-01 00:00:00', '2007-06-30 00:00:00'),
(10, 8, 345, '2001-09-01 00:00:00', '2006-06-30 00:00:00'),
(11, 9, 456, '2001-09-01 00:00:00', '2006-06-30 00:00:00'),
(12, 10, 567, '2001-09-01 00:00:00', '2003-06-30 00:00:00'),
(13, 11, 678, '2001-09-01 00:00:00', '2006-06-30 00:00:00'),
(14, 12, 789, '2002-09-01 00:00:00', '2006-06-30 00:00:00'),
(15, 13, 890, '2000-09-01 00:00:00', '2003-06-30 00:00:00'),
(16, 14, 89, '2001-09-01 00:00:00', '2006-01-31 00:00:00'),
(17, 15, 2334, '2001-09-01 00:00:00', '2006-01-31 00:00:00');

-- 
-- Вывод данных для таблицы student_marks
--
INSERT INTO student_marks VALUES
(1, 1, 1, 4, 1),
(2, 1, 1, 5, 2),
(3, 1, 2, 4, 1),
(4, 1, 3, 4, 2),
(5, 1, 4, 3, 2),
(6, 1, 7, 5, 2),
(7, 2, 1, 4, 1),
(8, 2, 3, 5, 1),
(9, 2, 6, 3, 1),
(10, 2, 6, 5, 2),
(11, 2, 7, 5, 2),
(12, 3, 2, 4, 1),
(13, 3, 3, 4, 2),
(14, 3, 5, 3, 1),
(15, 3, 6, 4, 1),
(16, 4, 1, 4, 1),
(17, 4, 1, 5, 2),
(18, 4, 6, 4, 2),
(20, 5, 4, 4, 1),
(19, 5, 7, 5, 1),
(21, 6, 2, 3, 1),
(22, 6, 3, 5, 2),
(23, 6, 7, 4, 1),
(24, 7, 3, 4, 1),
(25, 7, 3, 4, 2),
(27, 7, 4, 4, 1),
(26, 7, 7, 5, 2),
(28, 8, 2, 3, 1),
(30, 8, 3, 5, 2),
(29, 8, 7, 4, 1),
(31, 9, 2, 4, 1),
(32, 10, 1, 5, 1),
(33, 10, 3, 4, 2),
(34, 10, 6, 3, 2),
(35, 12, 3, 4, 1),
(36, 14, 2, 4, 1),
(37, 14, 3, 3, 2),
(38, 14, 5, 5, 2),
(39, 14, 6, 4, 2),
(40, 14, 7, 3, 1),
(41, 15, 1, 4, 1),
(42, 15, 2, 3, 1),
(43, 15, 3, 4, 2),
(44, 15, 5, 5, 1),
(45, 15, 7, 4, 1);

-- 
-- Вывод данных для таблицы group_student
--
INSERT INTO group_student VALUES
(1, 1, 1, 1),
(2, 1, 2, 0),
(3, 1, 3, 0),
(4, 2, 4, 1),
(5, 2, 5, 0),
(6, 2, 6, 0),
(7, 2, 7, 0),
(8, 3, 8, 1),
(9, 3, 9, 0),
(10, 4, 10, 1),
(11, 4, 11, 0),
(12, 4, 12, 0),
(13, 5, 13, 1),
(14, 6, 14, 1),
(15, 6, 15, 0);

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;