/* 
CIS 8040
Assignment 3
Hao Nguyen
Quan Le
Anirudh Chaudhary
 */

USE Group17;

-- 01. Retrieve all the customer’s name who has appointment on September.
SELECT C.FNAME, C.LNAME
FROM CUSTOMER AS C, APPOINTMENT AS A
WHERE C.CUSTOMER_ID = A.FK_CUSTOMER AND A.DATE_TIME <= '2019-09-31' AND A.DATE_TIME >= '2019-09-01';

-- 02. Get customer’s last name and account type with the highest balance on the account.
SELECT C.LNAME, A.TYPE
FROM CUSTOMER AS C JOIN ACCOUNT AS A
ON C.CUSTOMER_ID = A.FK_CUSTOMER
WHERE A.BALANCE = (SELECT MAX(BALANCE) 
					FROM ACCOUNT);

-- 03. Find all the advisor who does not assign to any appointment.
SELECT E.EMPLOYEE_ID, E.FNAME, E.LNAME
FROM ADVISOR AS E
WHERE NOT EXISTS (SELECT * 
				FROM APPOINTMENT AS P
                WHERE E.EMPLOYEE_ID = P.FK_EMPLOYEE);

-- 04. Get the office’s address with more than 1 appointment.
SELECT O.ADDRESS1, COUNT(A.APPOINTMENT_ID)
FROM OFFICE AS O, APPOINTMENT AS A
WHERE O.OFFICE_ID = A.FK_OFFICE 
GROUP BY O.OFFICE_ID
HAVING COUNT(A.APPOINTMENT_ID) > 1;

-- 05. Get the advisor’s first and last name with number of appointments.
SELECT E.FNAME, E.LNAME, COUNT(A.APPOINTMENT_ID)
FROM ADVISOR AS E, APPOINTMENT AS A
WHERE E.EMPLOYEE_ID = A.FK_EMPLOYEE
GROUP BY E.EMPLOYEE_ID;

-- 06. List customer’s first and last name with the interest checking account.
SELECT C.FNAME, C.LNAME
FROM CUSTOMER AS C, ACCOUNT AS A
WHERE C.CUSTOMER_ID = A.FK_CUSTOMER AND A.TYPE = 'Interest Checking';

-- 07. Return all the customers who has birthday on 1940-1950.
SELECT C.FNAME, C.LNAME
FROM CUSTOMER AS C
WHERE C.DOB >= '1940-01-01' AND C.DOB <= '1950-12-31';

-- 08. Show customers with most appointments.


-- 09. Return first name and last name of statement = ‘12006’.
SELECT C.FNAME, C.LNAME
FROM CUSTOMER AS C, STATEMENT AS S, ACCOUNT AS A
WHERE S.STATEMENT_ID = '12006' AND S.FK_ACCOUNT = A.ACCOUNT_ID AND C.CUSTOMER_ID = A.FK_CUSTOMER;

-- 10. Get balance between 100,000 to 300,000.
SELECT C.FNAME, C.LNAME
FROM CUSTOMER AS C, ACCOUNT AS A
WHERE C.CUSTOMER_ID = A.FK_CUSTOMER AND A.BALANCE > '100000' AND A.BALANCE < '300000';






