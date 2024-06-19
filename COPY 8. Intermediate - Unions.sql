#UNIONS

-- AKH-to see the data

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

#A union is how you can combine rows together- not columns like we have been doing with joins where one column is put next to another
#Unions allow you to combine the rows of data

#Now you should keep it the same kind of data otherwise if you start mixing tips with first_names it would be really confusing, but you can do it.
#Let's try it out and use Union to bring together some random data, then we will look at an actual use case



SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT occupation, salary
FROM employee_salary;

#So you can see we basically combined the data together, but not side by side in different columns, but one on top of the other in the same columns
#This obviously is not good since you're mixing data, but it can be done if you want.

-- AKH's codes to play around

SELECT first_name as firstname, last_name as lastname
FROM employee_demographics
UNION
SELECT occupation as job, salary as salary
FROM employee_salary;

-- AKH-you can see the above codes do NOT work, i.e., it did NOT create 4 columns as you expected. A lesson in coding.

-- Alex the Analyst codes below again
SELECT first_name, last_name
FROM employee_demographics
UNION  -- using UNION by itself is UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary;

-- notice it gets rid of duplicates? Union is actually shorthand for Union Distinct

SELECT first_name, last_name
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary;

-- we can use UNION ALL to show all values

SELECT first_name, last_name
FROM employee_demographics
UNION ALL  -- AKH, can UNION ALL
SELECT first_name, last_name
FROM employee_salary;



#Now Let's actually try to use UNION
# The Parks department is trying to cut their budget and wants to identify older employees they can push out or high paid employees who they can reduce pay or push out
-- let's create some queries to help with this

SELECT first_name, last_name, 'Old'  -- AKH: create a new  variable Old
FROM employee_demographics
WHERE age > 50;




SELECT first_name, last_name, 'Old Lady' as Label -- AKH: create a new  variable Label with the values specified below 
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Old Man'
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Highly Paid Employee'
FROM employee_salary
WHERE salary >= 70000
ORDER BY first_name
;












