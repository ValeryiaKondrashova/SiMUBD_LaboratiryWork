use University;

-- ЗАПОЛНЕНИЕ СУЩЕСТВУЮЩИХ ТАБЛИЦ --


-- Заполнение таблицы DEPARTMENT --
INSERT INTO department(name_department, FIO_manager, number_room, number_building, telephone_department, quantity_teacher)  
VALUES ('ПИиЭ','Жуков','411а',1,'+375294580852',8);
SELECT * FROM department;

-- Заполнение таблицы DISCIPLINE --
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(1, 'ОАиП', 120, 'Зачет');
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(7, 'ОИАД', 100, 'Экзамен');
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(8, 'ООП', 140, 'Экзамен');
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(9, 'ВЭДиТР', 110, 'Зачет');
INSERT INTO discipline(department_id, name_discipline, quantity_hours, type_control) VALUES(10, 'ОЗИ', 100, 'Зачет');
SELECT * FROM discipline;

-- Заполнение таблицы TEACHERS --
INSERT INTO teachers(department_id, first_name, last_name, patronymic, date_of_birthday, date_of_startWork, experience, position, sex, teacher_address, teacher_city, teacher_telephone)
VALUES(1, 'Хорошко', 'Виталий', 'Викторович', 1975-07-25, 2011-10-10, 11, 'Преподаватель', 'муж', 'г.Минск, ул.Мирная 1, кв.1', 'Минск', '+375291111111');
INSERT INTO teachers(department_id, first_name, last_name, patronymic, date_of_birthday, date_of_startWork, experience, position, sex, teacher_address, teacher_city, teacher_telephone)
VALUES(7, 'Алеексеев', 'Виктор', 'Федорович', 1965-08-27, 2000-01-05, 22, 'Преподаватель', 'муж', 'г.Минск, ул.Мирная 2, кв.2', 'Минск', '+375292222222');
INSERT INTO teachers(department_id, first_name, last_name, patronymic, date_of_birthday, date_of_startWork, experience, position, sex, teacher_address, teacher_city, teacher_telephone)
VALUES(8, 'Хорошко', 'Виталий', 'Викторович', 1966-10-07, 2001-01-02, 21, 'Преподаватель', 'муж', 'г.Минск, ул.Мирная 3, кв.3', 'Минск', '+375293333333');
INSERT INTO teachers(department_id, first_name, last_name, patronymic, date_of_birthday, date_of_startWork, experience, position, sex, teacher_address, teacher_city, teacher_telephone)
VALUES(9, 'Алефиренко', 'Виктор', 'Михайлович', 1975-07-15, 2007-10-10, 15, 'Преподаватель', 'муж', 'г.Минск, ул.Мирная 4, кв.4', 'Минск', '+375294444444');
INSERT INTO teachers(department_id, first_name, last_name, patronymic, date_of_birthday, date_of_startWork, experience, position, sex, teacher_address, teacher_city, teacher_telephone)
VALUES(10, 'Асадчая', 'Элина', 'Егоровна', 1981-12-12, 2010-07-07, 12, 'Преподаватель', 'жен', 'г.Минск, ул.Мирная 5, кв.5', 'Минск', '+375295555555');
SELECT * FROM teachers;


-- Заполнение таблицы STUDENTS --
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('Кондрашова', 'Валерия', 'Андреевна', 1, 2002-08-13, 'жен', 'ул.Головацкого 127, кв.19', 'г.Гомель', '+375447311805');
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('Гулевич', 'Виктория', 'Андреевна', 7, 2002-11-18, 'жен', 'ул.Бориса Царикова 51, кв.78', 'г.Гомель', '+37297896514');
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('Станкус', 'Александра', 'Леонидовна', 8, 2002-06-25, 'жен', 'ул.Великая 8, кв.5', 'г.Минск', '+375444561298');
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('Гукова', 'Мария', 'Денисовна', 9, 2002-07-07, 'жен', 'ул.Горная, кв.23', 'г.Пинск', '+375444789652');
INSERT INTO students(first_name_student, last_name_student, patronymic, departmentName_student_id, date_of_birthday_student, sex_student, address_student, city_student, telephone_student) 
VALUES('Ковалев', 'Данила', 'Алексеевич', 10, 2001-03-27, 'муж', 'ул.Советская 129, кв.75', 'г.Гомель', '+375442356897');
--SELECT * FROM students;


-- Заполнение таблицы REPORTCARD --
INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES(1, 1, 1, 9);
INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES(1, 2, 2, 7);
INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES(9, 2, 3, 8);
INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES(9, 3, 4, 5);
INSERT INTO reportCard(discipline_id, teacher_id, student_id, mark) VALUES(11, 3, 5, 6);
SELECT * FROM reportCard;
/*delete reportCard WHERE id_reportCard=6;*/




-- ЛАБОРАТОРНАЯ РАБОТА №2. ЧАСТЬ 2 --
/* 1 - 3 простейших запроса с использованием операторов сравнения  4:02 */
SELECT * FROM students WHERE sex_student = 'жен';
SELECT * FROM reportCard WHERE mark < 8;
SELECT * FROM teachers WHERE experience > 15;

/* 2 - 3 запроса с использованием логических операторов AND, OR и NOT 4:09 */
SELECT * FROM students WHERE city_student = 'г.Гомель' AND patronymic = 'Андреевна';
SELECT * FROM discipline WHERE type_control='Зачет' OR quantity_hours <= 110;
SELECT * FROM teachers WHERE NOT sex = 'муж';

/*3 - -	2 запроса на использование комбинации логических операторов 4:20 */
SELECT * FROM students WHERE sex_student = 'жен' AND NOT city_student = 'г.Гомель';
SELECT * FROM teachers WHERE experience >= 15 AND (patronymic = 'Федорович' OR patronymic = 'Викторович'); 

/* 4 - 2 запроса на использование выражений над столбцами 4:25 */
SELECT first_name, last_name, patronymic 'Фамилия преподавателя', date_of_birthday AS 'Дата рождения преподавателя' FROM teachers WHERE sex='муж';

SELECT id_discipline 'ID', name_department 'Название кафедры', name_discipline 'Название предмета', quantity_hours 'Отведено часов', type_control 'Тип контроля' 
FROM discipline 
JOIN department ON discipline.department_id=department.id_department 
WHERE quantity_hours >= 110 AND type_control = 'Зачет'; 

/* 5 - 2 запроса с проверкой на принадлежность множеству 5:20 (20:15) */
SELECT * FROM reportCard WHERE mark in ('8', '9', '10');
SELECT * FROM teachers WHERE experience in ('12', '22'); 

/* 6 - 2 запроса с проверкой на принадлежность диапазону значений  20:23 */
SELECT * FROM reportCard WHERE mark between 7 and 9;
SELECT * FROM teachers WHERE experience between 10 and 20;

/* 7 - 2 запроса с проверкой на соответствие шаблону  20:25 */
SELECT * FROM teachers WHERE upper(first_name) like 'Ал%';
SELECT * FROM students WHERE upper(city_student) like 'Г__е%';

/* 8 - 2 запроса с проверкой на неопределенное значение */
SELECT first_name, last_name FROM teachers WHERE teacher_telephone IS NULL OR teacher_address IS NULL;
SELECT name_discipline FROM discipline WHERE type_control IS NULL;