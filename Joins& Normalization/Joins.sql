-- Cross join
--All students in one dept ...

Select st_fname ,dept_name
From Student , Department

Select st_fname ,dept_name
From Student cross join Department

--inner join 
--needs to write names of table because pk&fk have the same name
Select st_fname ,dept_name
From Student S, Department D
where D.Dept_Id=S.Dept_Id

--name of student and all departments data
Select st_fname ,D.*
From Student S, Department D
where D.Dept_Id=S.Dept_Id

--all students whether it has departments or not
Select st_fname ,dept_name
From Student S left outer join Department D
on D.Dept_Id=S.Dept_Id

--all departments whether it has students or not
Select st_fname ,dept_name
From Student S Right outer join Department D
on D.Dept_Id=S.Dept_Id

Select st_fname ,dept_name
From Student S full outer join Department D
on D.Dept_Id=S.Dept_Id


--self join
Select X.St_Fname as sname ,Y.*
From student X, Student Y
Where Y.St_Id=X.St_super


--join Multi tables
Select st_fname,crs_name,grade
from Student S ,Stud_Course SC , Course C
where S.St_Id=SC.St_Id  and 
      C.Crs_Id=SC.Crs_Id


--inner join multi table
Select st_fname,crs_name,grade
from Student S inner join Stud_Course SC
   on S.St_Id=SC.St_Id 
   inner join 
   Course C 
   on C.Crs_Id=SC.Crs_Id

--join DML
----join update 

update Stud_Course
  set grade+=10 
from Student S, Stud_Course SC
where s.St_Id=SC.St_Id  and St_Address='cairo'

update SC
  set grade+=10 
from Student S, Stud_Course SC
where s.St_Id=SC.St_Id  and St_Address='cairo'

--------------------------------------------
Select St_fname
from Student
where St_Fname is not null

--if i would replace null by value using is null

select isnull(st_fname,'')
from Student

select isnull(st_fname,'has no name')
from Student

--one replacement
select isnull(st_fname,St_Lname)
from Student

--multiple replacement
select coalesce(st_fname,st_lname,'no data')
from Student

select 'studName= '+st_fname+'  age=  '+convert (varchar(2),st_age)
from Student

select isnull(st_fname,'')+''+convert (varchar(2),isnull (st_age,0))
from Student

select concat(st_fname,'',st_age)
from Student

select *
from Student
where St_Fname='Ahmed'

select *
from Student
where St_Fname like 'Ahmed'



select *
from Student
where St_Fname like '%a'

select *
from Student
where St_Fname like '%a%'

select *
from Student
where St_Fname like '_a%'

_ one char
% zero or more

'a%h'
'%a_'
'ahm%'
'[ahm]%'               --or
'[^ahm]%'              --not a or h or m
'[a-h]%'               --range
'[^a-h]%'
'[346]%' 
'%[%]'                 --string with end %
'%[_]%'                -- ahmed_mariam
'[_]%[_]'              -- _ahmed_

	
--order by 2 columns
select st_fname ,dept_id ,st_age
from student
order by dept_id asc ,st_age desc






