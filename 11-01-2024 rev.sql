DECLARE
       A NUMBER;
	   B NUMBER;
	   C NUMBER;
BEGIN
      A:=&A;
      B:=&B;
      C:=A+B;
             DBMS_OUTPUT.PUT_LINE('HELLO');
             DBMS_OUTPUT.PUT_LINE('HAVE A GOOD DAY');
             DBMS_OUTPUT.PUT_LINE('YOUR SUM OF TWO NUMBER IS '||C);
			 DBMS_OUTPUT.PUT_LINE(' ');
END;
/
_____________________________________________________________________________________________
DECLARE
       A NUMBER(3);
	   B NUMBER(3);
	   C NUMBER(3);
	   BEGIN
	        A:=&A;
			B:=&B;
	        IF A>B THEN
			DBMS_OUTPUT.PUT_LINE(A);
			ELSE
			    DBMS_OUTPUT.PUT_LINE(B);
				END IF;
				END;
				/
_____________________________________________________________________________________________
DECLARE
       A NUMBER(3);
	   B NUMBER(3);
	   C NUMBER(3);
	   BEGIN
	        A:=&A;
			FOR B IN 1..10 LOOP
			C:=A*B;
			DBMS_OUTPUT.PUT_LINE(C);
			END LOOP;
			END;
			/
_____________________________________________________________________________________________
DECLARE
       V_START NUMBER:=&V_START;
       V_END NUMBER:=&V_END;
       BEGIN
            	  FOR I IN V_START..V_END LOOP
				  DBMS_OUTPUT.PUT_LINE(I);
				  END LOOP;
				  END;
				  /
_____________________________________________________________________________________________
DECLARE
       A NUMBER(3);
	   B NUMBER(3);
	   C NUMBER(3);
	   BEGIN
	         A:=&A;
			 FOR B IN 1..10 LOOP
			 C:=A*B;
			 DBMS_OUTPUT.PUT_LINE(C);
			 END LOOP;
			 END;
			 /
_____________________________________________________________________________________________
DECLARE
       A NUMBER(3);
       B NUMBER(3);
       C NUMBER(3);
BEGIN
       A:=&A;
       B:=1;
       WHILE B<=10 LOOP
       C:=A*B;
	   B:=B+1;
	   DBMS_OUTPUT.PUT_LINE(C);
	   END LOOP;
	   END;
	   /
______________________________________________________________________________________________
DECLARE
        A NUMBER(3);
        B NUMBER(3);
        C NUMBER(3);
BEGIN
      A:=&A;
      B:=1;
      LOOP
          C:=A*B;
		  B:=B+1;
		  EXIT WHEN B>10;
		  DBMS_OUTPUT.PUT_LINE(C);
		  END LOOP;
		  END;
		  /
_____________________________________________________________________________________________		  
DECLARE
       V_EMPNO NUMBER(5);
       V_ENAME VARCHAR2(10);
       V_JOB VARCHAR2(10);
       V_SAL NUMBER(9,2);
BEGIN
        V_EMPNO:=&V_EMPNO;
     SELECT EMPNO, ENAME, JOB, SAL INTO V_EMPNO, V_ENAME, V_JOB, V_SAL FROM EMP WHERE EMPNO=V_EMPNO;
	 DBMS_OUTPUT.PUT_LINE('Hi');
	 DBMS_OUTPUT.PUT_LINE(V_ENAME);
	 DBMS_OUTPUT.PUT_LINE(' Your employee no is '||V_EMPNO|| ' and your job is '||V_JOB||' and your salary is '||V_SAL);
	 END;
	 /
_____________________________________________________________________________________________	 
CREATE OR REPLACE PROCEDURE EMP_DETAILS(
V_EMPNO IN NUMBER(5),
V_ENAME OUT VARCHAR2(10),
V_JOB OUT VARCHAR2(10),
V_SAL OUT NUMBER(9,2)) IS
BEGIN
        V_EMPNO:=&V_EMPNO;
     SELECT EMPNO, ENAME, JOB, SAL INTO V_EMPNO, V_ENAME, V_JOB, V_SAL FROM EMP WHERE EMPNO=V_EMPNO;
	 DBMS_OUTPUT.PUT_LINE('Hi');
	 DBMS_OUTPUT.PUT_LINE(V_ENAME);
	 DBMS_OUTPUT.PUT_LINE(' Your employee no is '||V_EMPNO|| ' and your job is '||V_JOB||' and your salary is '||V_SAL);
	 END;
	 /                 				
_____________________________________________________________________________________________
DECLARE
       V_EMPNO EMP.EMPNO%TYPE;
       V_ENAME EMP.ENAME%TYPE;
       V_JOB EMP.JOB%TYPE;
       V_SAL EMP.SAL%TYPE;
BEGIN
     V_EMPNO:=&V_EMPNO;
     SELECT EMPNO, ENAME, JOB, SAL INTO V_EMPNO, V_ENAME, V_JOB, V_SAL FROM EMP WHERE EMPNO=V_EMPNO;
     DBMS_OUTPUT.PUT_LINE('Hi');
	 DBMS_OUTPUT.PUT_LINE(V_ENAME);
	 DBMS_OUTPUT.PUT_LINE(' Your employee no is '||V_EMPNO|| ' and your job is '||V_JOB||' and your salary is '||V_SAL);
	 END;
	 /    	   
_____________________________________________________________________________________________
DECLARE
       V_EMPNO EMP.EMPNO%TYPE:=&V_EMPNO;
	   D_DEPTNO DEPT.DEPTNO%TYPE:=&DEPTNO;
	   V EMP%ROWTYPE;
	   D DEPT%ROWTYPE;
	   BEGIN
	        SELECT * INTO V FROM EMP WHERE EMPNO=V_EMPNO;
			SELECT * INTO D FROM DEPT WHERE DEPTNO=D_DEPTNO;
			DBMS_OUTPUT.PUT_LINE('Hi');
	 DBMS_OUTPUT.PUT_LINE(V.ENAME);
	 DBMS_OUTPUT.PUT_LINE(' Your employee no AND departmrnt no is '||V.EMPNO || V.DEPTNO|| ' and your job is '||V.JOB||' and your salary is '||V.SAL);
	 DBMS_OUTPUT.PUT_LINE(D.DEPTNO||D.DNAME||D.LOC);
	 END;
	 / 
_____________________________________________________________________________________________
DECLARE
       V_EMPNO EMP.EMPNO%TYPE:=&V_EMPNO;
	   
	   V EMP%ROWTYPE;
	   
	   BEGIN
	        
		
			SELECT E.*, D.* INTO V FROM EMP E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO WHERE E.EMPNO=V_EMPNO;
			DBMS_OUTPUT.PUT_LINE('Hi');
	 DBMS_OUTPUT.PUT_LINE(V.ENAME);
	 DBMS_OUTPUT.PUT_LINE(' Your employee no AND departmrnt no is '||V.EMPNO || V.DEPTNO|| ' and your job is '||V.JOB||' and your salary is '||V.SAL);
	 DBMS_OUTPUT.PUT_LINE(V.DEPTNO||V.DNAME||V.LOC);
	 END;
	 /
_____________________________________________________________________________________________	 
CREATE OR REPLACE PROCEDURE GetEmployeeDepartmentInfo(
    p_empno IN EMP.EMPNO%TYPE,
    p_emp OUT EMP%ROWTYPE,
    p_dept OUT DEPT%ROWTYPE
)
IS
BEGIN
    SELECT *
    INTO p_emp
    FROM EMP
    WHERE EMPNO = p_empno;

    SELECT *
    INTO p_dept
    FROM DEPT
    WHERE DEPTNO = p_emp.DEPTNO;
END GetEmployeeDepartmentInfo;
/

DECLARE
    V_EMPNO EMP.EMPNO%TYPE := &V_EMPNO;
    V_EMP EMP%ROWTYPE;
    V_DEPT DEPT%ROWTYPE;
BEGIN
    -- Call the procedure to get employee and department info
    GetEmployeeDepartmentInfo(V_EMPNO, V_EMP, V_DEPT);

    -- Display output
    DBMS_OUTPUT.PUT_LINE('Hi');
    DBMS_OUTPUT.PUT_LINE('Your employee no AND department no is ' || V_EMP.EMPNO || ' ' || V_DEPT.DEPTNO || ' and your job is ' || V_EMP.JOB || ' and your salary is ' || V_EMP.SAL);
    DBMS_OUTPUT.PUT_LINE(V_DEPT.DEPTNO || ' ' || V_DEPT.DNAME || ' ' || V_DEPT.LOC);
END;
/
