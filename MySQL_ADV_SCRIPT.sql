use db_college;
/*Template
Select
From
Left Join
on
Right Join
on
where
group by
having
order by
;
*/
/*1*/
select *
from professor
left join department
on professor.DEPT_CODE = department.DEPT_CODE
left join student
on department.DEPT_CODE = student.DEPT_CODE
where student.STU_NUM!='null';
/*2*/
select *
from professor
right join department
on professor.DEPT_CODE = department.DEPT_CODE
right join student
on department.DEPT_CODE = student.DEPT_CODE;
/*3 we want to see the Department and their students */
select department.DEPT_CODE, count(student.STU_NUM) as NumberOfStudents
from department
right join student
on department.DEPT_CODE = student.DEPT_CODE
group by student.DEPT_CODE;
/*4. we want to see how many student in ACCT Department */
select department.DEPT_CODE, count(student.STU_NUM) as NumberOfStudents
from department
right join student
on department.DEPT_CODE = student.DEPT_CODE
group by student.DEPT_CODE
having department.DEPT_CODE = 'ACCT';
/*5.  we want to see how many student in ACCT Department */
select d.DEPT_CODE, count(s.STU_NUM) as NumberOfStudents
from department `d`
right join student `s`
on d.DEPT_CODE = s.DEPT_CODE
group by s.DEPT_CODE
having d.DEPT_CODE = 'ACCT';
/*6. we want to see the Department and their corresponding student */
select d.DEPT_CODE, concat(s.STU_FNAME, ' ', s.STU_LNAME) as StudentFullname
from department `d`
right join student `s`
on d.DEPT_CODE = s.DEPT_CODE;
/*7*/
select concat(e.EMP_FNAME, ' ', e.EMP_LNAME, ' - ', e.EMP_NUM) as Professor, count(s.STU_NUM) as NumberOfStudents
from student `s`
left join department `d`
on s.DEPT_CODE = d.DEPT_CODE
left join professor `p`
on d.DEPT_CODE = p.DEPT_CODE
left join employee `e`
on p.EMP_NUM = e.EMP_NUM
group by e.EMP_NUM;
/*8 we want to see the Department and their corresponding professor*/
select concat(e.EMP_FNAME, ' ', e.EMP_LNAME, ' - ', e.EMP_NUM) as ProfFullName, d.DEPT_CODE as Department, concat(s.STU_FNAME, ' ', s.STU_LNAME) as StudentFullname
from student `s`
left join department `d`
on s.DEPT_CODE = d.DEPT_CODE
left join professor `p`
on d.DEPT_CODE = p.DEPT_CODE
left join employee `e`
on p.EMP_NUM = e.EMP_NUM;
/*9 we want to see the ProfFullName, Their EmployeeNumber, Department, Course and their corresponding Classroom */
select concat(e.EMP_FNAME, ' ', e.EMP_LNAME, ' - ', e.EMP_NUM) as ProfFullName, d.DEPT_CODE as Department, c.CRS_DESCRIPTION as Course, concat(cl.CLASS_SECTION, '/', cl.ROOM_CODE) as ClassSectionAndROOM, cl.CLASS_TIME as CLASSTIME
from employee `e`
left join professor `p`
on e.EMP_NUM = p.EMP_NUM
left join department `d`
on p.DEPT_CODE = d.DEPT_CODE
left join course `c`
on d.DEPT_CODE = c.DEPT_CODE
left join class `cl`
on c.CRS_CODE = cl.CRS_CODE
where cl.CRS_CODE!='null';
/* 10. we want to see the Number of Professors and the Number of Students in a certain Department */
Select d.DEPT_CODE as DepartmentCode, d.DEPT_NAME as Department, count(p.PROF_NUM) as NumberOfProfessor, count(s.STU_NUM) as NumberOfStudents
from student `s`
left join department `d`
on s.DEPT_CODE = d.DEPT_CODE
left join professor `p`
on d.DEPT_CODE = p.DEPT_CODE
group by d.DEPT_CODE;
