use University;
GO

/* --- Тестовые забросы из методы --- */
DECLARE @a INT, @b numeric(10,2)  /* numeric(p,s), где p - точность(количестов цифр в цисле), s - масштаб (количество цифр после запятой) */
DECLARE @str CHAR(20)

SET @a = 20
SET @b = (@a+@a)/15
SELECT @b  /* вывод на экран результата */ 

/**/

DECLARE @a INT
SELECT @a = COUNT(*) FROM students 
SELECT @a

DECLARE @str CHAR(30)
SELECT @str = first_name FROM teachers 
SELECT @str AS 'Фамилия преподавателя'  /* В данном примере в переменную поместится последнее значение из результата запроса */

/**/

DECLARE @mytable TABLE (id INT, myname CHAR(20) DEFAULT 'Иванов Иван')
INSERT INTO @mytable(id) VALUES (1)
INSERT INTO @mytable(id, myname) VALUES (2,'Игорь Троцкий') 
SELECT * FROM @mytable

/**/

DECLARE @mytable TABLE(id INT,	myname CHAR (255) DEFAULT 'Введите название')
INSERT @mytable SELECT departmentName_student_id, first_name_student FROM students WHERE city_student = 'Гомель'
SELECT * FROM @mytable

/* Объявление переменной а, проверка в цикле, чтобы значение а не превосходило 100. Переменная а увеличивает свое значение в случайном порядке. Также организуется проверка на условие */

DECLARE @a INT SET @a = 1 WHILE @a <100
BEGIN
PRINT @a -- вывод на экран значения переменной I
F (@a>40) AND (@a<50)
BREAK --выход и выполнение 1-й команды за циклом
ELSE
SET @a = @a+rand()*10 
CONTINUE
END
 PRINT @a


/* --------------------------------------------- */


/* ------- Лабораторная работа №4. Часть1 ------ */

/* 1 - Запрос для создания временной таблицы через переменную типа TABLE */

DECLARE @mytable TABLE(id INT,	myname CHAR (255) DEFAULT 'Введите название')
INSERT @mytable SELECT departmentName_student_id, first_name_student FROM students WHERE city_student = 'Гомель'
SELECT * FROM @mytable

/* 2 - Запрос с использованием условной конструкции IF */

DECLARE @a INT 
DECLARE @str CHAR(40)

SET @a = (SELECT COUNT(*) FROM students) 
-- SELECT @a

IF @a > 10 
BEGIN
	SET @str = 'Количество студентов больше 10' SELECT @str
END ELSE 
BEGIN
	SET @str = 'Количество студентов = ' + str(@a) SELECT @str
END

/* 3 - Запрос с использованием цикла WHILE */

DECLARE @mytable TABLE(id INT, mark INT)
INSERT @mytable SELECT student_id, mark FROM reportCard
-- SELECT id AS 'ID студента',  mark AS 'Оценка студента' FROM @mytable

DECLARE @a INT 
SET @a = (SELECT mark FROM @mytable WHERE id = 2)
PRINT 'До изменений:' + str(@a)

WHILE @a!=10
BEGIN
	SET @a = @a + 1
	PRINT 'В процессе зменений' + str(@a)
	CONTINUE
END
PRINT 'Результат изменений:' + str(@a)

/* 4 - Запрос для создания скалярной функции */

IF OBJECT_ID (N'dbo.CountMark', N'FN') IS NOT NULL 
DROP FUNCTION dbo.CountMark;

GO
CREATE FUNCTION dbo.CountMark(@countReportCard INT) RETURNS VARCHAR(60)
WITH EXECUTE AS CALLER AS
BEGIN
	DECLARE @count INT;
	SET @count = @countReportCard;
	DECLARE @message VARCHAR(60);
	IF(@count>10) SET @message = 'записей больше 10'
	IF(@count<10) SET @message = 'записей меньше 10'
	RETURN @message
END;

GO
DECLARE @count_mark INT
SET @count_mark = (SELECT COUNT(*) FROM reportCard)

SET DATEFIRST 1;
SELECT dbo.CountMark(@count_mark) AS 'Количество записей';

/*
IF OBJECT_ID (N'dbo.averageMark', N'FN') IS NOT NULL 
DROP FUNCTION dbo.averageMark;

GO
CREATE FUNCTION dbo.averageMark(@mytable TABLE, @countM INT)
RETURNS NUMERIC(3,1)
WITH EXECUTE AS CALLER AS
BEGIN
	DECLARE @i INT
	SET @i = 0

	DECLARE @average_value INT
	SET @average_value = 0

	WHILE @i<=@countM
	BEGIN
		SET @average_value = @average_value + (SELECT mark FROM @mytable WHERE id = @i)
		SET @i = @i +1
		CONTINUE
	END
	DECLARE @result NUMERIC(3,1)
	SET @result = @average_value/@countM
	RETURN @result
END;

GO
DECLARE @mytable TABLE(id INT, mark INT)
INSERT @mytable SELECT student_id, mark FROM reportCard

DECLARE @count_mark INT
	SET @count_mark = (SELECT COUNT(*) FROM reportCard)

SELECT dbo.averageMark(@mytable TABLE, @count_mark INT) AS 'Средняя оценка'
*/

/* 5 - Запрос для создания функции, которая возвращает табличное значение */

IF OBJECT_ID (N'ufn_valueTable', N'IF') IS NOT NULL 
DROP FUNCTION db_owner.ufn_valueTable;

GO
CREATE FUNCTION db_owner.ufn_valueTable(@mark INT) RETURNS TABLE
AS RETURN (
SELECT t.first_name AS 'Преподаватель', p.first_name_student AS 'Студент', s.mark AS 'Оценка студента' 
FROM teachers t, students p, reportCard s
WHERE s.teacher_id = t.id_teachers AND s.student_id = p.id_student AND s.mark > @mark
);

GO
SELECT * from db_owner.ufn_valueTable(7);

/* 6 - Запрос для создания процедуры без параметров */

IF OBJECT_ID (N'ufn_valueTable', N'IF') IS NOT NULL 
DROP FUNCTION db_owner.ufn_valueTable;

GO
CREATE FUNCTION db_owner.ufn_valueTable() RETURNS TABLE
AS RETURN (
SELECT first_name_student, last_name_student FROM students
);

GO
SELECT * from db_owner.ufn_valueTable();

/* 7 - Запрос для создания процедуры c входным параметром */

DROP PROCEDURE Count_experience_people
GO

CREATE PROCEDURE Count_experience_people @experience AS INT
AS
SELECT COUNT(experience) AS 'Количество преподавателей, чем опыт больше 15 лет и мужского пола' FROM teachers
WHERE sex ='муж' and experience >= @experience 
Go

EXEC Count_experience_people 15

/* 8 - Запрос для создания процедуры c входными параметрами и RETURN */

DROP PROCEDURE checkname
GO

CREATE PROCEDURE checkname @param int AS
IF (SELECT first_name FROM teachers WHERE id_teachers = @param) = 'Асадчая'
RETURN 1 
ELSE RETURN 2

DECLARE @return_status int
EXECUTE @return_status = checkname 6
SELECT 'Return Status' = @return_status 

/* 9 - Запрос для создания процедуры обновления данных в таблице базы данных UPDATE */
DROP PROCEDURE Update_Student
DROP PROCEDURE Update_discipline

GO
CREATE PROCEDURE Update_Student AS
UPDATE dbo.students SET city_student = 'Полоцк' WHERE city_student = 'Барано';
GO
EXECUTE Update_Student


GO
CREATE PROCEDURE Update_discipline AS
UPDATE discipline SET quantity_hours = quantity_hours + 10 
GO
EXECUTE Update_discipline

/* 10 - Запрос для создания процедуры извлечения данных из таблиц базы данных SELECT */

CREATE PROCEDURE select1
AS
SELECT * FROM students;
GO

EXECUTE select1;
GO


CREATE PROCEDURE select2
AS
SELECT * FROM teachers WHERE sex = 'жен';
GO

EXECUTE select2;
GO
