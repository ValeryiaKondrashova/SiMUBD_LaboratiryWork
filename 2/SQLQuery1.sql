--create new database
create database University;
go 

use University;

-- add role and user DEKAN
exec sp_addrole 'dekan';
grant DELETE, INSERT, UPDATE, SELECT to dekan;

exec sp_addlogin 'Kondrashova_login', '12345', University;
exec sp_adduser 'Kondrashova_login', 'Kondrashova'; -- Логин, юзер, (роль)
exec sp_addrolemember 'dekan', 'Kondrashova'; -- роль, юзер

-- add role and user teacher
exec sp_addrole 'teacher';
grant insert, update, select, execute to teacher;

exec sp_addlogin 'Ivanova_login', '12345', University; -- логин, пароль, базы данных
exec sp_adduser 'Ivanova_login', 'Ivanova';
exec sp_addrolemember 'teacher', 'Ivanova';