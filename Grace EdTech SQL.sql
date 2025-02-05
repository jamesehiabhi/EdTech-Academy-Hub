-- Retrieve all course names and their units from the courses table.
select course_name, course_unit from courses;

--find the names of all female teachers.
select * from teacher;

select teacher_name, sex from teacher
where sex = 'F';

--list all students who scored more than 80 in any course.
select * from scores;
select student_name, score from scores
where score > 80;

--list all students who scored more than 70 in EX103.
select * from scores;
select student_name, score from scores
where score > 70 and course_id = 'EX103';

--find the highest salary among all teachers (name, salary).
select * from teacher;
select teacher_name from teacher
where teacher_salary = (select max (teacher_salary) from teacher);

select teacher_name, max(teacher_salary) from teacher
group by teacher_name
order by max (teacher_salary) desc
limit 1;

--Calculate the average score for each course_id.
select * from scores;
select course_id, avg (score) from scores
group by course_id;

--Get the ID of the students that scored above average.
select * from scores;
select student_id, score, student_name from scores
where score > (select avg (score) from scores);

--find the department with the most number of courses and list the department ID along with the number of courses.
select * from courses;
select department, count(course_id) as number_of_courses from courses
group by department
order by number_of_courses desc
limit 1;

--Retrieve the student who has the highest total score across all courses. 
select * from scores;
select student_id, student_name, sum(score)as total_score from scores
group by student_id,student_name
order by total_score desc
limit 1;

--Get the number of male and female teachers in the dataset.
select * from teacher;
select sex, count(sex) from teacher
group by sex;

select sex, count(*) from teacher
group by sex;


-- . Textual Score Representation: How can you convert the numerical scores of students into a textual representation and
-- display the student's name alongside this textual score?
select student_name, CAST(scores AS varchar(10)) AS "Textual Score"
from scores;

select student_name, course_id, scores
from scores;
		
-- . Department ID Transformation: How would you convert department IDs to a character data type and display them alongside the
-- department names?	  
SELECT CAST(Department_ID AS VARCHAR(10)) AS Transformed_Department_ID, Department_Name
FROM departments;	 

-- . Course Popularity: How can you categorize courses based on the number of students who have taken them? Categories are:
-- • More than 5 students: Popular
-- • 3 to 5 students: Moderate
-- • Fewer than 3 students: Unpopular
 
 select  c.course_id, c.course_name,count(s.student_id) as Number_Student,
 case
	 	when count(s.student_id) >=5 then 'Popular'
	 	when count(s.student_id) between 3 and 5 then 'Moderate'
	 	else 'Unpopular'
	 	end as Course_Popularity
from courses c
left join scores s
on c.course_id = s.course_id
Group by c.course_id, c.course_name;
	 
	 
 SELECT
    c.course_id,
    c.course_name,
    COUNT(s.student_id) AS num_students,
    CASE
        WHEN COUNT(s.student_id) > 5 THEN 'Popular'
        WHEN COUNT(s.student_id) BETWEEN 3 AND 5 THEN 'Moderate'
        ELSE 'Unpopular'
    END AS popularity_category
FROM
    courses c
LEFT JOIN
    scores s ON c.course_id = s.course_id
GROUP BY
    c.course_id, c.course_name;





















