--1.	Display the Department id, name and id and the name of its manager.
Select dnum,dname,dno,concat(fname,' ',lname) as 'employee name'
from Departments d inner join Employee e
on SSN=MGRSSN

--2.	Display the name of the departments and the name of the projects under its control.
select dname,pname
from Departments d inner join Project p
on d.dnum=p.dnum

--3.	Display the full data about all the dependence associated with the name of the employee they depend on him/her.
select d.*,concat(e.fname,' ',e.lname) as 'employee name'
from Dependent d inner join Employee e
on ssn=ESSN

--4.	Display the Id, name and location of the projects in Cairo or Alex city.
select pname,pnumber,plocation from project
where city='cairo' or city='Alex'

--5.	Display the Projects full data of the projects with a name starts with "a" letter.
select * from project
where pname like 'a%'

--6.	display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
select e.* 
from Employee e inner join Departments d
on dnum=dno and dno=30 and Salary >=1000 and Salary<=2000

--7.	Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.
select e.*
from Employee e inner join Works_for w
on e.SSN=w.ESSn and dno=10
inner join Project
on Pnumber=Pno and hours>=10 and Pname='Al Rabwah'

--8.	Find the names of the employees who directly supervised with Kamel Mohamed.
select X.fname as emp_name ,y.fname+' '+y.Lname as super_name
from Employee x ,Employee y
where y.ssn=x.Superssn and y.Fname='kamel' and y.Lname='mohamed'

--9.	Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
select fname,pname
from Employee inner join Departments d
on  Dnum=dno
inner join Project p
on d.Dnum=p.Dnum
order by Pname

--10.	For each project located in Cairo City , find the project number
--, the controlling department name ,the department manager last name ,address and birthdate.
select pnumber,dname,lname,address,bdate
from Project p inner join Departments d
on d.Dnum=p.Dnum and city='cairo'
inner join Employee
on ssn=MGRSSN

--11.	Display All Data of the mangers
select e.*
from Employee e inner join Departments d
on ssn=MGRSSN

--12.	Display All Employees data and the data of their dependents even if they have no dependents
select * 
from Employee e left outer join Dependent d
on ssn=essn


--Data Manipulation Language

--1.	Insert your personal data to the employee table as a new employee
--in department number 30, SSN = 102672, Superssn = 112233, salary=3000.
insert into Employee
values('Mariam','Atef',102672,3/3/2001,'el Mansoura','m',3000,112233,30)

--2.	Insert another employee with personal data your friend as new employee
--in department number 30, SSN = 102660, but don’t enter any value for salary or manager number to him.
insert into Employee(Fname,Lname,SSN,Bdate,Address,Sex,Dno)
values('ahmed','karawia',102660,1/1/2000,'Cairo','m',30)

--3.	Upgrade your salary by 20 % of its last value.
update Employee 
set Salary=(Salary+.2*Salary)
where fname='Mariam' and Lname='Atef'







