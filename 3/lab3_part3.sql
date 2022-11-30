use University;

/* 1 - 2 ������� � �������������� ����������� ������������ ���� ������ */
SELECT teachers.first_name, teachers.last_name, teachers.patronymic, department.name_department FROM teachers, department;
SELECT students.first_name_student, students.last_name_student, students.patronymic, discipline.name_discipline FROM students, discipline;

/* 2 - 3 ������� � �������������� ���������� ���� ������ �� ��������� */
SELECT name_discipline, department.name_department FROM discipline, department WHERE discipline.department_id = department.id_department;
SELECT teachers.first_name, teachers.last_name, reportCard.mark FROM reportCard, teachers WHERE reportCard.teacher_id = teachers.id_teachers;
SELECT students.first_name_student, students.last_name_student, reportCard.mark FROM reportCard, students WHERE reportCard.student_id = students.id_student;

/* 3 - 2 ������� � �������������� ���������� ���� ������ �� ��������� � �������� ������ */
SELECT students.first_name_student, students.last_name_student, reportCard.mark 
FROM reportCard, students 
WHERE reportCard.student_id = students.id_student AND reportCard.mark >= 8;

SELECT name_discipline, department.name_department, discipline.quantity_hours 
FROM discipline, department 
WHERE discipline.department_id = department.id_department AND discipline.quantity_hours <= 120; 

/* 4 - 2 ������� � �������������� ���������� �� ���� �������� */
/*INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES(1, 1, 1, 9);*/
/*discipline, teachers, students*/
SELECT k.first_name AS '�������������', t.first_name_student AS '�������', mark
FROM reportCard f 
JOIN teachers k
ON f.teacher_id = k.id_teachers
JOIN students t
ON f.student_id=t.id_student;
/*discipline, teacher*/
SELECT k.name_discipline AS '����������', t.first_name AS '������� �������������', t.last_name AS '��� �������������'
FROM reportCard f
JOIN discipline k
ON f.discipline_id = k.id_discipline
JOIN teachers t
ON f.teacher_id = t.id_teachers;

/* 5 - ������� ����� ����� ��������� �������� �� ���������� �� ��������� �� ������� � �������������� �������� ������� ���������� ������ (JOIN) */
SELECT name_discipline, department.name_department FROM discipline JOIN department ON discipline.department_id = department.id_department;
SELECT teachers.first_name, teachers.last_name, reportCard.mark FROM reportCard JOIN teachers ON reportCard.teacher_id = teachers.id_teachers;
SELECT students.first_name_student, students.last_name_student, reportCard.mark FROM reportCard JOIN students ON reportCard.student_id = students.id_student;

/* 6 - 2 ������� � �������������� ������ �������� ���������� */
SELECT name_discipline, quantity_hours, type_control FROM discipline LEFT JOIN department ON discipline.department_id = department.id_department; 
SELECT * FROM teachers LEFT JOIN department ON teachers.department_id = department.id_department;

/* 7 - 2 ������� �� ������������� ������� �������� ���������� !!!!!!! */
SELECT name_discipline, quantity_hours, type_control FROM discipline RIGHT JOIN department ON discipline.department_id = department.id_department; 
SELECT * FROM teachers RIGHT JOIN department ON teachers.department_id = department.id_department;

/* 8 - 2 ������� � �������������� ������������� ���������� � �������� ������������ */
SELECT name_discipline, quantity_hours, type_control FROM discipline FULL OUTER JOIN department ON discipline.department_id = department.id_department; 
SELECT * FROM teachers FULL OUTER JOIN department ON teachers.department_id = department.id_department;