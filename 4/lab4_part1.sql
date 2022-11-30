use University;
GO

/* --- �������� ������� �� ������ --- */
DECLARE @a INT, @b numeric(10,2)  /* numeric(p,s), ��� p - ��������(���������� ���� � �����), s - ������� (���������� ���� ����� �������) */
DECLARE @str CHAR(20)

SET @a = 20
SET @b = (@a+@a)/15
SELECT @b  /* ����� �� ����� ���������� */ 

/**/

DECLARE @a INT
SELECT @a = COUNT(*) FROM students 
SELECT @a

DECLARE @str CHAR(30)
SELECT @str = first_name FROM teachers 
SELECT @str AS '������� �������������'  /* � ������ ������� � ���������� ���������� ��������� �������� �� ���������� ������� */

/**/

DECLARE @mytable TABLE (id INT, myname CHAR(20) DEFAULT '������ ����')
INSERT INTO @mytable(id) VALUES (1)
INSERT INTO @mytable(id, myname) VALUES (2,'����� �������') 
SELECT * FROM @mytable

/**/

DECLARE @mytable TABLE(id INT,	myname CHAR (255) DEFAULT '������� ��������')
INSERT @mytable SELECT departmentName_student_id, first_name_student FROM students WHERE city_student = '������'
SELECT * FROM @mytable

/* ���������� ���������� �, �������� � �����, ����� �������� � �� ������������ 100. ���������� � ����������� ���� �������� � ��������� �������. ����� ������������ �������� �� ������� */

DECLARE @a INT SET @a = 1 WHILE @a <100
BEGIN
PRINT @a -- ����� �� ����� �������� ���������� I
F (@a>40) AND (@a<50)
BREAK --����� � ���������� 1-� ������� �� ������
ELSE
SET @a = @a+rand()*10 
CONTINUE
END
 PRINT @a


/* --------------------------------------------- */


/* ------- ������������ ������ �4. �����1 ------ */

/* 1 - ������ ��� �������� ��������� ������� ����� ���������� ���� TABLE */

DECLARE @mytable TABLE(id INT,	myname CHAR (255) DEFAULT '������� ��������')
INSERT @mytable SELECT departmentName_student_id, first_name_student FROM students WHERE city_student = '������'
SELECT * FROM @mytable

/* 2 - ������ � �������������� �������� ����������� IF */

DECLARE @a INT 
DECLARE @str CHAR(40)

SET @a = (SELECT COUNT(*) FROM students) 
-- SELECT @a

IF @a > 10 
BEGIN
	SET @str = '���������� ��������� ������ 10' SELECT @str
END ELSE 
BEGIN
	SET @str = '���������� ��������� = ' + str(@a) SELECT @str
END

/* 3 - ������ � �������������� ����� WHILE */

DECLARE @mytable TABLE(id INT, mark INT)
INSERT @mytable SELECT student_id, mark FROM reportCard
-- SELECT id AS 'ID ��������',  mark AS '������ ��������' FROM @mytable

DECLARE @a INT 
SET @a = (SELECT mark FROM @mytable WHERE id = 2)
PRINT '�� ���������:' + str(@a)

WHILE @a!=10
BEGIN
	SET @a = @a + 1
	PRINT '� �������� ��������' + str(@a)
	CONTINUE
END
PRINT '��������� ���������:' + str(@a)

/* 4 - ������ ��� �������� ��������� ������� */

IF OBJECT_ID (N'dbo.CountMark', N'FN') IS NOT NULL 
DROP FUNCTION dbo.CountMark;

GO
CREATE FUNCTION dbo.CountMark(@countReportCard INT) RETURNS VARCHAR(60)
WITH EXECUTE AS CALLER AS
BEGIN
	DECLARE @count INT;
	SET @count = @countReportCard;
	DECLARE @message VARCHAR(60);
	IF(@count>10) SET @message = '������� ������ 10'
	IF(@count<10) SET @message = '������� ������ 10'
	RETURN @message
END;

GO
DECLARE @count_mark INT
SET @count_mark = (SELECT COUNT(*) FROM reportCard)

SET DATEFIRST 1;
SELECT dbo.CountMark(@count_mark) AS '���������� �������';

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

SELECT dbo.averageMark(@mytable TABLE, @count_mark INT) AS '������� ������'
*/

/* 5 - ������ ��� �������� �������, ������� ���������� ��������� �������� */

IF OBJECT_ID (N'ufn_valueTable', N'IF') IS NOT NULL 
DROP FUNCTION db_owner.ufn_valueTable;

GO
CREATE FUNCTION db_owner.ufn_valueTable(@mark INT) RETURNS TABLE
AS RETURN (
SELECT t.first_name AS '�������������', p.first_name_student AS '�������', s.mark AS '������ ��������' 
FROM teachers t, students p, reportCard s
WHERE s.teacher_id = t.id_teachers AND s.student_id = p.id_student AND s.mark > @mark
);

GO
SELECT * from db_owner.ufn_valueTable(7);

/* 6 - ������ ��� �������� ��������� ��� ���������� */

IF OBJECT_ID (N'ufn_valueTable', N'IF') IS NOT NULL 
DROP FUNCTION db_owner.ufn_valueTable;

GO
CREATE FUNCTION db_owner.ufn_valueTable() RETURNS TABLE
AS RETURN (
SELECT first_name_student, last_name_student FROM students
);

GO
SELECT * from db_owner.ufn_valueTable();

/* 7 - ������ ��� �������� ��������� c ������� ���������� */

DROP PROCEDURE Count_experience_people
GO

CREATE PROCEDURE Count_experience_people @experience AS INT
AS
SELECT COUNT(experience) AS '���������� ��������������, ��� ���� ������ 15 ��� � �������� ����' FROM teachers
WHERE sex ='���' and experience >= @experience 
Go

EXEC Count_experience_people 15

/* 8 - ������ ��� �������� ��������� c �������� ����������� � RETURN */

DROP PROCEDURE checkname
GO

CREATE PROCEDURE checkname @param int AS
IF (SELECT first_name FROM teachers WHERE id_teachers = @param) = '�������'
RETURN 1 
ELSE RETURN 2

DECLARE @return_status int
EXECUTE @return_status = checkname 6
SELECT 'Return Status' = @return_status 

/* 9 - ������ ��� �������� ��������� ���������� ������ � ������� ���� ������ UPDATE */
DROP PROCEDURE Update_Student
DROP PROCEDURE Update_discipline

GO
CREATE PROCEDURE Update_Student AS
UPDATE dbo.students SET city_student = '������' WHERE city_student = '������';
GO
EXECUTE Update_Student


GO
CREATE PROCEDURE Update_discipline AS
UPDATE discipline SET quantity_hours = quantity_hours + 10 
GO
EXECUTE Update_discipline

/* 10 - ������ ��� �������� ��������� ���������� ������ �� ������ ���� ������ SELECT */

CREATE PROCEDURE select1
AS
SELECT * FROM students;
GO

EXECUTE select1;
GO


CREATE PROCEDURE select2
AS
SELECT * FROM teachers WHERE sex = '���';
GO

EXECUTE select2;
GO
