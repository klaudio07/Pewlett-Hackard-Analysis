--*Deliverable 1*

-- Create table: retirement_titles
SELECT e.emp_no, 
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Export retirement_titles table
SELECT * FROM retirement_titles;

-- Create table: unique_titles
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Export unique_titles table
SELECT * FROM unique_titles;

-- Retrieve the number of employees by their most recent job title who are about to retire
SELECT count(emp_no), 
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(emp_no) DESC;

-- Export retiring_titles table
SELECT * FROM retiring_titles;

--*Deliverable 2*

-- Create mentorship_eligibility table
SELECT DISTINCT ON (e.emp_no) 
	e.emp_no,
	e.first_name, 
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty	
FROM employees as e
JOIN dept_employee as de
ON e.emp_no = de.emp_no
JOIN titles as ti
ON e.emp_no = ti.emp_no	
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND de.to_date = '9999-01-01'
ORDER BY e.emp_no;

-- Create mentorship_eligibilty table
SELECT * FROM mentorship_eligibilty;
