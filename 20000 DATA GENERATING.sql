CREATE TABLE CompanyDetails (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Industry VARCHAR(50),
    FoundedYear INT,
    CEOName VARCHAR(100),
    HeadquartersCity VARCHAR(50),
    HeadquartersState VARCHAR(50),
    Country VARCHAR(50),
    Revenue DECIMAL(18, 2),
    EmployeesCount INT,
    Website VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Fax VARCHAR(20),
    StockSymbol VARCHAR(10),
    StockExchange VARCHAR(50),
    Description VARCHAR(50),
    LastUpdatedDate DATE,
    CreatedDate DATE
);
-- Generate 1000 rows of random data for the CompanyDetails table

-- Insert random company details into CompanyDetails table
INSERT INTO CompanyDetails (CompanyID, CompanyName, Industry, FoundedYear, CEOName, HeadquartersCity, HeadquartersState, Country, Revenue, EmployeesCount, Website, Email, Phone, Fax, StockSymbol, StockExchange, Description, LastUpdatedDate, CreatedDate)
SELECT
    ROWNUM as CompanyID,
    'Company' || ROWNUM as CompanyName,
    CASE WHEN ABS(DBMS_RANDOM.VALUE) < 0.5 THEN 'Technology' ELSE 'Finance' END as Industry,
    1900 + TRUNC(DBMS_RANDOM.VALUE(0, 100)) as FoundedYear,
    'CEO' || ROWNUM as CEOName,
    'City' || TRUNC(DBMS_RANDOM.VALUE(0, 10)) as HeadquartersCity,
    'State' || TRUNC(DBMS_RANDOM.VALUE(0, 5)) as HeadquartersState,
    'Country' || TRUNC(DBMS_RANDOM.VALUE(0, 3)) as Country,
    TRUNC(DBMS_RANDOM.VALUE(0, 1000000000), 2) as Revenue,
    TRUNC(DBMS_RANDOM.VALUE(0, 5000)) as EmployeesCount,
    'www.company' || ROWNUM || '.com' as Website,
    'info@company' || ROWNUM || '.com' as Email,
    '+1 (555) ' || (100 + TRUNC(DBMS_RANDOM.VALUE(0, 900))) || '-' || (1000 + TRUNC(DBMS_RANDOM.VALUE(0, 9000))) as Phone,
    '+1 (555) ' || (100 + TRUNC(DBMS_RANDOM.VALUE(0, 900))) || '-' || (1000 + TRUNC(DBMS_RANDOM.VALUE(0, 9000))) as Fax,
    'SYM' || ROWNUM as StockSymbol,
    CASE WHEN ABS(DBMS_RANDOM.VALUE) < 0.5 THEN 'NYSE' ELSE 'NASDAQ' END as StockExchange,
    'Description for Company' || ROWNUM as Description,
    SYSDATE - TRUNC(DBMS_RANDOM.VALUE(0, 365)) as LastUpdatedDate,
    SYSDATE - TRUNC(DBMS_RANDOM.VALUE(0, 365)) as CreatedDate
FROM dual
CONNECT BY LEVEL <= 100000;

CREATE OR REPLACE PROCEDURE Com_detl IS
C CompanyDetails%ROWTYPE;
CURSOR COM_DETAILS IS SELECT * FROM CompanyDetails;
BEGIN
     OPEN COM_DETAILS;
	     LOOP
		    FETCH COM_DETAILS INTO C;
			     EXIT WHEN COM_DETAILS%NOTFOUND;
				-- DBMS_OUTPUT.PUT_LINE('COMPANY NAME'||'          '||'INDUSTRY NAME'||'       '||'PHONE NO');
				DBMS_OUTPUT.PUT_LINE(C.COMPANYNAME||'     '||C.INDUSTRY||'     '||C.PHONE);
		 END LOOP;
     CLOSE COM_DETAILS;
END;
/	 