#Display all information in the tables EMP and DEPT.

select *
from employees join departments on employees.department_id = departments.department_id;

# Display only the hire date and employee name for each employee.

select hire_date, first_name, last_name
from employees;

# Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title

select concat(job_id, ", ", first_name," ", last_name) as employee_and_Title
from employees;

# Display the hire date, name and department number for all clerks.

select hire_date, first_name, last_name, department_id, job_id
from employees
where job_id like "%clerk%";

# Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT

select concat(employee_id, ",", first_name, ",", last_name, ",", email, ",", phone_number, ",", hire_date, ",", job_id, ",", salary, ",", manager_id, ",", department_id) as The_OutPut
from employees;

# Display the names and salaries of all employees with a salary greater than 2000.

select first_name, last_name, salary
from employees
where salary > 2000;

# Display the names and dates of employees with the column headers "Name" and "Start Date"

select concat(employees.first_name, " ", employees.last_name) as Name, job_history.start_date as Start_Date
from employees join job_history on employees.employee_id = job_history.employee_id;

# Display the names and hire dates of all employees in the order they were hired.

select first_name, last_name, hire_date
from employees
order by first_name, hire_date;

# Display the names and salaries of all employees in reverse salary order.

select first_name, last_name, reverse(salary)
from employees;

# Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.

select first_name, last_name, reverse(salary), department_id
from employees
where commission_pct is not null;

# Display the last name and job title of all employees who do not have a manager

select employees.last_name, jobs.job_title
from employees join jobs on employees.job_id = jobs.job_id
where manager_id is null;

# Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000

select last_name, job_id, salary
from employees
where job_id like "sa%" or "st%rk";

select last_name, job_id, salary
from employees join jobs using
where job_id like "sa%" or "st%rk";

# Display the maximum, minimum and average salary and commission earned.

select max(salary), min(salary), avg(salary), min(commission_pct), max(commission_pct), sum(commission_pct)
from employees;

# Display the department number, total salary payout and total commission payout for each department.

select department_id, sum(salary), sum(commission_pct)
from employees
group by department_id;

# Display the department number and number of employees in each department.

select department_id, count(employee_id)
from employees
group by department_id;

# Display the department number and total salary of employees in each department.

select department_id, sum(salary)
from employees
group by department_id;

# Display the employee's name who doesn't earn a commission. Order the result set without using the column name

SELECT first_name, last_name
FROM employees
WHERE commission_pct IS NULL
ORDER BY 1;

# Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately

select first_name, department_id, ifnull(commission_pct, "NO COMMISSION")
from employees;

select concat(first_name, " ", last_name) as "NAME", department_id as "DEPARTMENT",
case
when commission_pct is null then "NO COMMISSSION"
else commission_pct
end
as "COMMISSSION"
from employees;

# Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately

select first_name, last_name, salary, ifnull(commission_pct*2, "NO COMMISSION") AS COMMISSION
from employees;

select first_name, salary,
case
when commission_pct is null then "NO COMMISSION"
else commission_pct*2
end 
as "COMMISSION"
from employees;

select first_name,
case
when salary<10000 then "Group 1"
when salary>10000 and salary<20000 then "Group 2"
when salary>20000 and salary<30000 then "Group 3"
else "Group 4"
end 
as "SALARY"
from employees;


# Display the employee's name, department id who have the first name same as another employee in the same department

select first_name, department_id, count(first_name)
from employees
group by first_name, department_id
having count(first_name)>1;

# Display the sum of salaries of the employees working under each Manager.

select sum(salary), manager_id
from employees
group by manager_id;

# Select the Managers name, the count of employees working under and the department ID of the manager.

select E.first_name as EMP_Name, M.first_name as MAN_Name
from employees as E join employees as M on E.manager_id = M.employee_id;

select M.first_name, M.last_name, count(*), M.department_id
from employees as E join employees as M on E.manager_id = M.employee_id
group by M.employee_id;

# Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.

select department_id, avg(Total_salary)
from(select department_id, sum(salary) as Total_salary
	from employees
    group by department_id
) as Department_salaries
group by department_id
order by department_id;

# Select the maximum salary of each department along with the department id

select employees.department_id, max(jobs.max_salary)
from employees join jobs on employees.job_id = jobs.job_id
group by department_id;

# Display the commission, if not null display 10% of salary, if null display a default value 1

SELECT COALESCE(commission_pct, salary * 0.10, 1) AS commission_amount
FROM employees;

select first_name, commission_pct,
case
when commission_pct is not null then salary*10/100
else 1
end 
as "SALARY"
from employees;


