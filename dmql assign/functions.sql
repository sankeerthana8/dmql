create function get_course_count(sem varchar(10),year numeric(4))
returns int
language plpgsql
as
$$
declare course_count integer;
begin
select count(distinct(id))
into course_count
from takes
where semester=sem and yr=year;
return course_count;
end;
$$


create function get_instructor_count(mydept varchar(10))
returns int
language plpgsql
as
$$
declare ins_count integer;
begin
select count(distinct(id))
into ins_count
from instructor
where instructor.dept_name=mydept;
return ins_count;
end;
$$