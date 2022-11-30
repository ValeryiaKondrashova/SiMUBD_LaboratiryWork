use University;

-- ���������� ������������ ������ --


-- ���������� ������� DEPARTMENT --
INSERT INTO department(name_department, FIO_manager, number_room, number_building, telephone_department, quantity_teacher)  
VALUES ('����','�����','411�',1,'+375294580852',8);
SELECT * FROM department;

-- ���������� ������� DISCIPLINE --
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(1, '����', 120, '�����');
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(7, '����', 100, '�������');
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(8, '���', 140, '�������');
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(9, '������', 110, '�����');
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(10, '���', 100, '�����');
SELECT * FROM discipline;

-- ���������� ������� TEACHERS --
INSERT INTO teachers(department_id, first_name, last_name, patronymic, date_of_birthday, date_of_startWork, experience, position, sex, teacher_address, teacher_city, teacher_telephone)
VALUES(1, '�������', '�������', '����������', 1975-07-25, 2011-10-10, 11, '�������������', '���', '�.�����, ��.������ 1, ��.1', '�����', '+375291111111');
INSERT INTO teachers(department_id, first_name, last_name, patronymic, date_of_birthday, date_of_startWork, experience, position, sex, teacher_address, teacher_city, teacher_telephone)
VALUES(7, '���������', '������', '���������', 1965-08-27, 2000-01-05, 22, '�������������', '���', '�.�����, ��.������ 2, ��.2', '�����', '+375292222222');
INSERT INTO teachers(department_id, first_name, last_name, patronymic, date_of_birthday, date_of_startWork, experience, position, sex, teacher_address, teacher_city, teacher_telephone)
VALUES(8, '�������', '�������', '����������', 1966-10-07, 2001-01-02, 21, '�������������', '���', '�.�����, ��.������ 3, ��.3', '�����', '+375293333333');
INSERT INTO teachers(department_id, first_name, last_name, patronymic, date_of_birthday, date_of_startWork, experience, position, sex, teacher_address, teacher_city, teacher_telephone)
VALUES(9, '����������', '������', '����������', 1975-07-15, 2007-10-10, 15, '�������������', '���', '�.�����, ��.������ 4, ��.4', '�����', '+375294444444');
INSERT INTO teachers(department_id, first_name, last_name, patronymic, date_of_birthday, date_of_startWork, experience, position, sex, teacher_address, teacher_city, teacher_telephone)
VALUES(10, '�������', '�����', '��������', 1981-12-12, 2010-07-07, 12, '�������������', '���', '�.�����, ��.������ 5, ��.5', '�����', '+375295555555');
SELECT * FROM teachers;


-- ���������� ������� STUDENTS --
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('����������', '�������', '���������', 1, 2002-08-13, '���', '��.����������� 127, ��.19', '�.������', '+375447311805');
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('�������', '��������', '���������', 7, 2002-11-18, '���', '��.������ �������� 51, ��.78', '�.������', '+37297896514');
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('�������', '����������', '����������', 8, 2002-06-25, '���', '��.������� 8, ��.5', '�.�����', '+375444561298');
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('������', '�����', '���������', 9, 2002-07-07, '���', '��.������, ��.23', '�.�����', '+375444789652');
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('�������', '������', '����������', 10, 2001-03-27, '���', '��.��������� 129, ��.75', '�.������', '+375442356897');
--SELECT * FROM students;


-- ���������� ������� REPORTCARD --
INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES(1, 1, 1, 9);
INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES(1, 2, 2, 7);
INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES(9, 2, 3, 8);
INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES(9, 3, 4, 5);
INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES(11, 3, 5, 6);
SELECT * FROM reportCard;
/*delete reportCard WHERE id_reportCard=6;*/




-- ������������ ������ �2. ����� 2 --
/* 1 - 3 ���������� ������� � �������������� ���������� ���������  4:02 */
SELECT * FROM students WHERE sex_student = '���';
SELECT * FROM reportCard WHERE mark < 8;
SELECT * FROM teachers WHERE experience > 15;

/* 2 - 3 ������� � �������������� ���������� ���������� AND, OR � NOT 4:09 */
SELECT * FROM students WHERE city_student = '�.������' AND patronymic = '���������';
SELECT * FROM discipline WHERE type_control='�����' OR quantity_hours <= 110;
SELECT * FROM teachers WHERE NOT sex = '���';

/*3 - -	2 ������� �� ������������� ���������� ���������� ���������� 4:20 */
SELECT * FROM students WHERE sex_student = '���' AND NOT city_student = '�.������';
SELECT * FROM teachers WHERE experience >= 15 AND (patronymic = '���������' OR patronymic = '����������'); 

/* 4 - 2 ������� �� ������������� ��������� ��� ��������� 4:25 */
SELECT first_name, last_name, patronymic '������� �������������', date_of_birthday AS '���� �������� �������������' FROM teachers WHERE sex='���';

SELECT id_discipline 'ID', name_department '�������� �������', name_discipline '�������� ��������', quantity_hours '�������� �����', type_control '��� ��������' 
FROM discipline 
JOIN department ON discipline.department_id=department.id_department 
WHERE quantity_hours >= 110 AND type_control = '�����'; 

/* 5 - 2 ������� � ��������� �� �������������� ��������� 5:20 (20:15) */
SELECT * FROM reportCard WHERE mark in ('8', '9', '10');
SELECT * FROM teachers WHERE experience in ('12', '22'); 

/* 6 - 2 ������� � ��������� �� �������������� ��������� ��������  20:23 */
SELECT * FROM reportCard WHERE mark between 7 and 9;
SELECT * FROM teachers WHERE experience between 10 and 20;

/* 7 - 2 ������� � ��������� �� ������������ �������  20:25 */
SELECT * FROM teachers WHERE upper(first_name) like '��%';
SELECT * FROM students WHERE upper(city_student) like '�__�%';

/* 8 - 2 ������� � ��������� �� �������������� �������� */
SELECT first_name, last_name FROM teachers WHERE teacher_telephone IS NULL OR teacher_address IS NULL;
SELECT name_discipline FROM discipline WHERE type_control IS NULL;