--1.Write a query to display the name ( first name and last name ) for those employees who
--gets more salary than the employee whose ID is 103.
 select first_name, last_name from employees 
 where salary >(select salary from employees where id is 103);

 --2.Write a query to display the name ( first name and last name ), salary, department id, job id
--for those employees who works in the same designation as the employee works whose id is
--169.
select first_name, last_name , salary, department id,job_id from employees
where job_id = (select job_id from employees where employee_id);
--3.Write a query to display the name ( first name and last name ), salary, department id for
--those employees who earn such amount of salary which is the smallest salary of any of the
--departments
select first_name, last_name , salary, department_id from employees
where salary IN (select min salary from employees group by department_id);
--4.Write a query to display the employee id, employee name (first name and last name ) for all
--employees who earn more than the average salary.
select employee_id, first_name, last_name from employees where salary > (select AVG(salary) from employees);
--5.Write a query to display the employee name ( first name and last name ), employee id and
--salary of all employees who report to Payam
select first_name, last_name , employee_id , salary from employees
where manager_id = (select employee_id where first_name ='Payam')

--6.Write a query to display the department number, name ( first name and last name ), job
--and department name for all employees in the Finance department.
SELECT e.department_id, e.first_name, e.job_id , d.department_name
FROM employees e , departments d
WHERE e.department_id = d.department_id
AND d.department_name = 'Finance';
--7.7. Write a query to display all the information of an employee whose salary and reporting
--person id is 3000 and 121 respectively
select * from employees 
where manager_id= '121' and salary  = '3000' 
--8.8. Display all the information of an employee whose id is any of the number 134, 159 and 183.
select * from employees where employee_id IN ('134', '159', '183')
--9.Write a query to display all the information of the employees whose salary is within the
--range 1000 and 3000
select * from employees where salary between 1000 and 3000;
--10.10. Write a query to display all the information of the employees whose salary is within the
--range of smallest salary and 2500
select * from employees where salary between (select min(salary) from employees) and 2500;

-- 11.write a query to display all the information of the employess who does not work in those departments where some employess works whose manager id within the range 100 and 200. -- 
select * from employees where deptartment_id not in (select departmnet_id from departments where managerid between 100 and 200)
--12. write a query to display all the information for those employees
--whose id is any id who earn the second highest salry
select * from employees where employee_id in (select employee_id * from employees where 
salary= (select max(salary) from employees 
where salary<(select max(salary) from employees)));