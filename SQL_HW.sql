drop table departments;
drop table dept_emp;
drop table dept_manager;

create table departments (
	dept_no VARCHAR(4),
	PRIMARY KEY (dept_no),
	dept_name VARCHAR(30));
select*from departments;

create table dept_emp(
	emp_no INT,
	dept_no VARCHAR(4),
	from_date DATE,
	to_date DATE);
select*from dept_emp;

create table dept_manager(
	dept_no VARCHAR (4),
	emp_no INT, 
	from_date DATE,
	to_date DATE);
select*from dept_manager;

create table employees(
	emp_no INT,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_date DATE);

create table salaries (
	emp_no INT,
	salary INT, 
	from_date DATE,
	to_date DATE);
	
create table titles(
	emp_no INT,
	title VARCHAR,
	from_date DATE,
	to_date DATE);

--Time to actually start the assignment!!!
--Question 1: List the following details of each employee:
--employee number, last name, first name, gender, and salary

select e.emp_no, e.birth_date, e.first_name,
e.last_name, e.gender, e.hire_date, s.salary 
from salaries s 
join employees e
on e.emp_no=s.emp_no;

---Question 2:List employees who were hired in 1986.

select hire_date ,first_name,last_name
from employees 
where hire_date between '1986-01-01'
and '1986-12-31';

---Question 3:List the manager of each department with
--the following information:department number, department name,
--the manager's employee number, last name, first name,
--and start and end employment dates.

select d.dept_name, dm.dept_no, dm.emp_no,
dm.from_date, dm.to_date, e.first_name, e.last_name
from departments d
join dept_manager dm
on (d.dept_no=dm.dept_no)
join employees e 
on(e.emp_no=dm.emp_no);

--Question 4: List the department of each employee with the following
--information:employee number, last name, first name, and department name.

select d.dept_name, e.emp_no, e.last_name,e.first_name
from departments d
join dept_manager dm
on d.dept_no=dm.dept_no
join employees e 
on dm.emp_no=e.emp_no;

--Question 5: List all employees whose first name is
--"Hercules" and last names begin with "B."

select first_name,last_name 
from employees 
where first_name='Hercules'
and last_name like 'B%';

--Question 6: List all employees in the Sales department, including their
--employee number, last name, first name, and department name.

select de.emp_no,e.last_name,e.first_name,d.dept_name
from departments d
join dept_emp de
on d.dept_no=de.dept_no
join employees e 
on de.emp_no=e.emp_no
where d.dept_name='Sales';

--Question 7:List all employees in the Sales and Development departments,
--including their employee number, last name, first name,
--and department name.

select de.emp_no, e.last_name, e.first_name, d.dept_name
from departments d 
join dept_emp de
on d.dept_no=de.dept_no
join employees e
on de.emp_no=e.emp_no
where d.dept_name= 'Sales' 
or d.dept_name='Development';

--Question 8: In descending order, list the frequency count 
--of employee last names, i.e., how many employees share each last name.

select last_name,
count (last_name) 
from employees
group by last_name 
order by count (last_name) DESC;

