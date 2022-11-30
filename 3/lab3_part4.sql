use University;

/* 1 - 2 ������� � �������������� ������� COUNT */
SELECT COUNT(*) AS '������� ������' FROM reportCard;
SELECT COUNT(*) AS '���������' FROM students WHERE city_student = '������';

/* 2 - 2 ������� � �������������� ������� SUM */
SELECT SUM(mark)/COUNT(*) AS '������� ����' FROM reportCard;
SELECT SUM(quantity_hours) AS '���������� ����� ������� ���������' FROM discipline;

/* 3 - 2 ������� � �������������� ������� UPPER, LOWER */
SELECT LOWER(first_name) AS '������� �������������' FROM teachers;
SELECT UPPER(first_name) AS '������� �������������' FROM teachers;

/* 4 - 2 ������� � �������������� ��������� ������� */
SELECT first_name, last_name, experience, date_of_birthday FROM teachers WHERE DATENAME(YEAR, date_of_birthday) = 1975;
SELECT GETDATE();

/* 5 - 2 ������� � �������������� ����������� �� ������ ������� */
SELECT first_name_student FROM students GROUP BY first_name_student;
SELECT first_name FROM teachers GROUP BY first_name;

/* 6 - 2 ������� �� ������������� ����������� �� ���������� �������� */
SELECT first_name AS '������� �������������', last_name AS '��� �������������' FROM teachers GROUP BY first_name, last_name;
SELECT first_name_student AS '������� ��������', last_name_student AS '��� ��������' FROM students GROUP BY first_name_student, last_name_student;

/* 7 - 2 ������� � �������������� ������� ������ ����� HAVING */
SELECT first_name, COUNT(*) AS '�������� �������' 
FROM teachers 
GROUP BY first_name  HAVING COUNT(*)>1;

SELECT discipline_id, COUNT(*) AS '���������� ���������'
FROM reportCard
GROUP BY discipline_id HAVING COUNT(*)>1;

/* 8 - 2 ������� � �������������� ����� HAVING ��� ����� GROUP BY */
SELECT MIN(experience) AS '���������� ����', MAX(experience) AS '���������� ����'
FROM teachers
HAVING AVG(experience) > 10;

SELECT COUNT(*)
FROM students
HAVING COUNT(telephone_student)>1;

/* 9 - 2 ������� � �������������� ���������� �� ������� */
SELECT first_name AS '�������', last_name AS '���', patronymic AS '��������', experience 
FROM teachers
ORDER BY experience DESC;

SELECT first_name_student AS '�������', last_name_student AS '���', patronymic AS '��������', city_student AS '����� ��������'
FROM students
ORDER BY city_student;

/* 10 - 2 ������� �� ���������� ����� ������ � ������� */
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(1, '��', 140, '�������');
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('���������', '������', '���������', 7, 2002-09-25, '���', '��.����������� 54, ��.13', '�.���������', '+375447891234');
--SELECT * FROM students; /* ��� ������� �� �������� */
--SELECT * FROM discipline;

/* 11 - 2 ������� �� ���������� ����� ������ �� ����������� ������� � �������� ������������ �������� */
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(1, '��', 140, '�������');
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('���������', '������', '���������', 7, 2002-09-25, '���', '��.����������� 54, ��.13', '�.���������', '+375447891234');
--INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES((SELECT id_department FROM department WHERE name_department='����') , '������', 130, '�������');
--SELECT * FROM discipline;
--INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES((SELECT id_discipline FROM discipline WHERE name_discipline='���'), 1, 1, 9);
--SELECT * FROM reportCard;

/* 12 - 2 ������� �� ���������� ������������ ������ � ������� */
UPDATE reportCard SET mark = 10 WHERE id_reportCard = 3;
--SELECT * FROM reportCard;
UPDATE teachers SET experience = 2 + experience; 
--SELECT * FROM teachers;

/* 13 - 2 ������� �� ���������� ������������ ������ �� ����������� ���������� �� ����� WHERE */
UPDATE reportCard SET mark = 10 WHERE id_reportCard = 3;
UPDATE students SET telephone_student='+375297777777' WHERE id_student = 2;
--SELECT * FROM students;

/* 14 - 2 ������� �� �������� ������������ ������ */
DELETE FROM students WHERE city_student='�.���������';
DELETE FROM discipline WHERE name_discipline='��';


/*DOP with like*/
-- SELECT * FROM teachers WHERE upper(first_name) like '��%';
-- SELECT REPLACE (first_name_student,  '�', '�' ) FROM students;

-- select '�' + first_name_student from students;
-- select first_name_student from students where first_name_student BETWEEN '�' AND '�';




