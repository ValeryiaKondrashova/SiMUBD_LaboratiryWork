use University;

/* 1 - 2 запроса с использованием декартового произведения двух таблиц */
SELECT teachers.first_name, teachers.last_name, teachers.patronymic, department.name_department FROM teachers, department;
SELECT students.first_name_student, students.last_name_student, students.patronymic, discipline.name_discipline FROM students, discipline;

/* 2 - 3 запроса с использованием соединения двух таблиц по равенству */
SELECT name_discipline, department.name_department FROM discipline, department WHERE discipline.department_id = department.id_department;
SELECT teachers.first_name, teachers.last_name, reportCard.mark FROM reportCard, teachers WHERE reportCard.teacher_id = teachers.id_teachers;
SELECT students.first_name_student, students.last_name_student, reportCard.mark FROM reportCard, students WHERE reportCard.student_id = students.id_student;

/* 3 - 2 запроса с использованием соединения двух таблиц по равенству и условием отбора */
SELECT students.first_name_student, students.last_name_student, reportCard.mark 
FROM reportCard, students 
WHERE reportCard.student_id = students.id_student AND reportCard.mark >= 8;

SELECT name_discipline, department.name_department, discipline.quantity_hours 
FROM discipline, department 
WHERE discipline.department_id = department.id_department AND discipline.quantity_hours <= 120; 

/* 4 - 2 запроса с использованием соединения по трем таблицам */
/*INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES(1, 1, 1, 9);*/
/*discipline, teachers, students*/
SELECT k.first_name AS 'Преподаватель', t.first_name_student AS 'Студент', mark
FROM reportCard f 
JOIN teachers k
ON f.teacher_id = k.id_teachers
JOIN students t
ON f.student_id=t.id_student;
/*discipline, teacher*/
SELECT k.name_discipline AS 'Дисциплина', t.first_name AS 'Фамилия преподавателя', t.last_name AS 'Имя преподавателя'
FROM reportCard f
JOIN discipline k
ON f.discipline_id = k.id_discipline
JOIN teachers t
ON f.teacher_id = t.id_teachers;

/* 5 - создать копии ранее созданных запросов на соединение по равенству на запросы с использованием внешнего полного соединения таблиц (JOIN) */
SELECT name_discipline, department.name_department FROM discipline JOIN department ON discipline.department_id = department.id_department;
SELECT teachers.first_name, teachers.last_name, reportCard.mark FROM reportCard JOIN teachers ON reportCard.teacher_id = teachers.id_teachers;
SELECT students.first_name_student, students.last_name_student, reportCard.mark FROM reportCard JOIN students ON reportCard.student_id = students.id_student;

/* 6 - 2 запроса с использованием левого внешнего соединения */
SELECT name_discipline, quantity_hours, type_control FROM discipline LEFT JOIN department ON discipline.department_id = department.id_department; 
SELECT * FROM teachers LEFT JOIN department ON teachers.department_id = department.id_department;

/* 7 - 2 запроса на использование правого внешнего соединения !!!!!!! */
SELECT name_discipline, quantity_hours, type_control FROM discipline RIGHT JOIN department ON discipline.department_id = department.id_department; 
SELECT * FROM teachers RIGHT JOIN department ON teachers.department_id = department.id_department;

/* 8 - 2 запроса с использованием симметричного соединения и удаление избыточности */
SELECT name_discipline, quantity_hours, type_control FROM discipline FULL OUTER JOIN department ON discipline.department_id = department.id_department; 
SELECT * FROM teachers FULL OUTER JOIN department ON teachers.department_id = department.id_department;