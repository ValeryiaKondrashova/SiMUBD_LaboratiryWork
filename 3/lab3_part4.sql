use University;

/* 1 - 2 запроса с использованием функции COUNT */
SELECT COUNT(*) AS 'Средняя оценка' FROM reportCard;
SELECT COUNT(*) AS 'Результат' FROM students WHERE city_student = 'Гомель';

/* 2 - 2 запроса с использованием функции SUM */
SELECT SUM(mark)/COUNT(*) AS 'Средний балл' FROM reportCard;
SELECT SUM(quantity_hours) AS 'Количество часов учебных дисциплин' FROM discipline;

/* 3 - 2 запроса с использованием функций UPPER, LOWER */
SELECT LOWER(first_name) AS 'Фамилия преподавателй' FROM teachers;
SELECT UPPER(first_name) AS 'Фамилия преподавателй' FROM teachers;

/* 4 - 2 запроса с использованием временных функций */
SELECT first_name, last_name, experience, date_of_birthday FROM teachers WHERE DATENAME(YEAR, date_of_birthday) = 1975;
SELECT GETDATE();

/* 5 - 2 запроса с использованием группировки по одному столбцу */
SELECT first_name_student FROM students GROUP BY first_name_student;
SELECT first_name FROM teachers GROUP BY first_name;

/* 6 - 2 запроса на использование группировки по нескольким столбцам */
SELECT first_name AS 'Фамилия преподавателя', last_name AS 'Имя преподавателя' FROM teachers GROUP BY first_name, last_name;
SELECT first_name_student AS 'Фамилия студента', last_name_student AS 'Имя студента' FROM students GROUP BY first_name_student, last_name_student;

/* 7 - 2 запроса с использованием условия отбора групп HAVING */
SELECT first_name, COUNT(*) AS 'Название кафедры' 
FROM teachers 
GROUP BY first_name  HAVING COUNT(*)>1;

SELECT discipline_id, COUNT(*) AS 'Количество предметов'
FROM reportCard
GROUP BY discipline_id HAVING COUNT(*)>1;

/* 8 - 2 запроса с использованием фразы HAVING без фразы GROUP BY */
SELECT MIN(experience) AS 'Наименьший опыт', MAX(experience) AS 'Наибольший опыт'
FROM teachers
HAVING AVG(experience) > 10;

SELECT COUNT(*)
FROM students
HAVING COUNT(telephone_student)>1;

/* 9 - 2 запроса с использованием сортировки по столбцу */
SELECT first_name AS 'Фамилия', last_name AS 'Имя', patronymic AS 'Отчество', experience 
FROM teachers
ORDER BY experience DESC;

SELECT first_name_student AS 'Фамилия', last_name_student AS 'Имя', patronymic AS 'Отчество', city_student AS 'Город студента'
FROM students
ORDER BY city_student;

/* 10 - 2 запроса на добавление новых данных в таблицу */
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(1, 'КС', 140, 'Экзамен');
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('Колосович', 'Ульяна', 'Денисовна', 7, 2002-09-25, 'жен', 'ул.Солигорская 54, кв.13', 'г.Солигорск', '+375447891234');
--SELECT * FROM students; /* два запроса на проверку */
--SELECT * FROM discipline;

/* 11 - 2 запроса на добавление новых данных по результатам запроса в качестве вставляемого значения */
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(1, 'КС', 140, 'Экзамен');
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('Колосович', 'Ульяна', 'Денисовна', 7, 2002-09-25, 'жен', 'ул.Солигорская 54, кв.13', 'г.Солигорск', '+375447891234');
--INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES((SELECT id_department FROM department WHERE name_department='ПОИТ') , 'ОИТиПУ', 130, 'Экзамен');
--SELECT * FROM discipline;
--INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES((SELECT id_discipline FROM discipline WHERE name_discipline='ООП'), 1, 1, 9);
--SELECT * FROM reportCard;

/* 12 - 2 запроса на обновление существующих данных в таблице */
UPDATE reportCard SET mark = 10 WHERE id_reportCard = 3;
--SELECT * FROM reportCard;
UPDATE teachers SET experience = 2 + experience; 
--SELECT * FROM teachers;

/* 13 - 2 запроса на обновление существующих данных по результатам подзапроса во фразе WHERE */
UPDATE reportCard SET mark = 10 WHERE id_reportCard = 3;
UPDATE students SET telephone_student='+375297777777' WHERE id_student = 2;
--SELECT * FROM students;

/* 14 - 2 запроса на удаление существующих данных */
DELETE FROM students WHERE city_student='г.Солигорск';
DELETE FROM discipline WHERE name_discipline='КС';


/*DOP with like*/
-- SELECT * FROM teachers WHERE upper(first_name) like 'Ал%';
-- SELECT REPLACE (first_name_student,  'о', 'О' ) FROM students;

-- select 'Ц' + first_name_student from students;
-- select first_name_student from students where first_name_student BETWEEN 'А' AND 'Д';




