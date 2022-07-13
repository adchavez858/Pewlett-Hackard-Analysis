-- Deliverable 1 


-- Part 1

SELECT e.emp_no,
e.first_name, 
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
Order by emp_no ASC;

SELECT * FROM retirement_titles;


-- Part 2
-- Take into account employees switching titles over the years and gather only their most recent job title 

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles


-- Part 3
-- Get the number of employees by their most recent job title who are about to retire 

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles


--------------------------------------------------------------------------------------------------------------------------------------------



-- Deliverable 2


-- Create a table that shows mentorship eligibility 

SELECT DISTINCT ON (em.emp_no) em.emp_no, em.first_name, em.last_name, em.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_elegibilty
FROM employees AS em
LEFT JOIN dept_emp AS de
ON em.emp_no = de.emp_no
LEFT JOIN titles AS ti
ON em.emp_no = ti.emp_no
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY em.emp_no;

SELECT * FROM mentorship_elegibilty
