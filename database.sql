drop database StudentManagementSystem;
create database StudentManagementSystem;
use StudentManagementSystem;

create table Student (
	rollno varchar(8) not null primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
	address varchar(100) not null,
    phone_no int(10) not null,
    DOB date not null,
    email_id varchar(30),
    password varchar(20) not null
);

create table Teacher (
    id varchar(10) not null primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    email_id varchar(30) not null,
    phone_no int(10) not null,
    password varchar(20) not null
);

create table Department (
	id varchar(10) not null primary key,
    name varchar(10) not null
);

create table Program (
	id varchar(10) not null primary key,
    name varchar(10) not null
);

create table Course (
    id varchar(10) not null primary key,
    name varchar(20) not null,
    description varchar(50) not null,
    semester int not null,
    program_id varchar(10) not null,
    department_id varchar(10) not null,
    foreign key (program_id) references Program(id),
    foreign key (department_id) references Department(id)
);

create table CourseDocuments (
    id int not null primary key,
    name varchar(20) not null, 
    file blob not null,
    course_id varchar(10) not null,
    foreign key (course_id) references Course(id)
);

create table Course_Student (
    course_id varchar(10) not null,
    student_id varchar(10) not null,
    foreign key (student_id) references Student(rollNo),
    foreign key (course_id) references Course(id)
);

create table Teacher_Course (
	course_id varchar(10) not null,
    teacher_id varchar(10) not null,
    foreign key (course_id) references Course(id),
    foreign key (teacher_id) references Teacher(id)
);

create table Attendance (
	student_id varchar(8) not null,
    course_id varchar(10) not null,
    teacher_id varchar(10) not null,
    date date not null,
    present enum('y', 'n') not null,
    foreign key (student_id) references Student(rollNo),
    foreign key (course_id) references Course(id),
    foreign key (teacher_id) references Teacher(id)
);

create table Payment (
	id int not null auto_increment primary key,
	amount int not null,
    UTR int not null,
    student_id varchar(8) not null,
    date date not null,
    time time not null,
    Account_Holder_Name varchar(30) not null,
    remarks varchar(30) not null,
    foreign key (student_id) references Student(rollNo)
);
