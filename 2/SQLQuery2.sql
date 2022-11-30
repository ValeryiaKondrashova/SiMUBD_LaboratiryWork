use University;

--drop table if exists students;
create table students
(
	id_student					int IDENTITY(1,1) primary key NOT NULL,
	first_name_student			varchar(20) NOT NULL,
	last_name_student			varchar(20) NOT NULL,
	patronymic					varchar(20) NOT NULL,
	departmentName_student_id	int NOT NULL,
	date_of_birthday_student	datetime NOT NULL,
	sex_student					varchar(10) NOT NULL,
	address_student				varchar(50) NOT NULL,
	city_student				varchar(15) NOT NULL,
	telephone_student			varchar(15) NOT NULL,
);

--drop table if exists department;
create table department
(
	id_department			int IDENTITY(1,1) primary key NOT NULL,
	name_department			varchar(100) NOT NULL,
	FIO_manager				varchar(50) NOT NULL,
	number_room				varchar(5) NOT NULL,
	number_building			int NOT NULL,
	telephone_department	varchar(45) NOT NULL,
	quantity_teacher		int NOT NULL
);

alter table students
add constraint fk_students_department foreign key(departmentName_student_id)
references department (id_department)
on delete cascade
on update cascade;

--drop table if exists teachers;
create table teachers
(
  id_teachers		int IDENTITY(1,1) primary key NOT NULL,
  department_id		int NOT NULL,
  first_name		varchar(20) NOT NULL,
  last_name			varchar(20) NOT NULL,
  patronymic		varchar(20) NOT NULL,
  date_of_birthday	datetime NOT NULL,
  date_of_startWork datetime NOT NULL,
  experience		int NOT NULL,
  position			varchar(15) NOT NULL,
  sex				varchar(10) NOT NULL,
  teacher_address	varchar(100) NOT NULL,
  teacher_city		varchar(15) NOT NULL,
  teacher_telephone varchar(15) NOT NULL
);

alter table teachers
add constraint fk_teachers_department foreign key(department_id)
references department (id_department)
on delete cascade
on update cascade;

--drop table if exists reportCard;
create table reportCard
(
	id_reportCard	int IDENTITY(1,1) primary key NOT NULL,
	discipline_id	int NOT NULL,
	teacher_id		int NOT NULL,
	student_id		int NOT NULL,
	mark			int NOT NULL
);

alter table reportCard
add constraint fk_reportCard_students foreign key(student_id)
references students (id_student)
on delete cascade
on update cascade;

alter table reportCard
add constraint fk_reportCard_teachers foreign key(teacher_id)
references teachers (id_teachers)
ON DELETE NO ACTION;
--on delete cascade
--on update cascade;

--drop table if exists discipline;
create table discipline
(
	id_discipline		int IDENTITY(1,1) primary key NOT NULL,
	department_id		int NOT NULL,
	name_discipline		varchar(150) NOT NULL,
	quantity_hours		int NOT NULL,
	type_control		varchar(40) NOT NULL
);

alter table reportCard
add constraint fk_reportCard_discipline foreign key(discipline_id)
references discipline (id_discipline)
ON DELETE NO ACTION;
--on delete cascade
--on update cascade;

alter table discipline
add constraint fk_discipline_department foreign key(department_id)
references department (id_department)
on delete cascade
on update cascade;






/*INSERT INTO department(name_department, FIO_manager, number_room, number_building, telephone_department, quantity_teacher)  VALUES ('ПИиЭ','Сидоров','417а',1,'+375444444505',6);*/
/*SELECT * FROM department;*/
