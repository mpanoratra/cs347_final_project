create or replace procedure "CLONE_EMPLOYEE_EXISTING"
(from_emp_id IN NUMBER,
to_emp_id IN NUMBER)
is
begin
FOR list IN (SELECT * FROM list_membership lm WHERE lm.employee_id = from_emp_id) LOOP
    INSERT INTO list_membership (employee_id, notice_list_id) VALUES (to_emp_id, list.notice_list_id);
END LOOP;
end;
/
create or replace procedure "CLONE_TO_NEW_EMPLOYEE"
(new_emp_name IN VARCHAR2,
from_emp_id IN NUMBER)
IS
old_emp employee%ROWTYPE;
new_emp employee.employee_id%TYPE;
BEGIN
SELECT * INTO old_emp FROM employee WHERE employee_id = from_emp_id;
INSERT INTO employee (employee_name, status, division_id, lab_id)
    VALUES (new_emp_name, 'T', old_emp.division_id, old_emp.lab_id)
    RETURNING employee_id INTO new_emp;
FOR list IN (SELECT * FROM list_membership lm WHERE lm.employee_id = from_emp_id) LOOP
    INSERT INTO list_membership (employee_id, notice_list_id) VALUES (new_emp, list.notice_list_id);
END LOOP;
END;
/
CREATE OR REPLACE PACKAGE types_package
AS
  TYPE notice_list_tbl
    IS TABLE OF notice_list%ROWTYPE;
END;
/
create or replace procedure "GET_ALL_LISTS_FOR_EMPLOYEE"
(PARAM_EMPLOYEE_ID IN NUMBER,
  all_lists OUT types_package.notice_list_tbl)
IS
  TYPE list_tbl IS TABLE OF notice_list%ROWTYPE;
  notice_lists1 types_package.notice_list_tbl;
  notice_lists2 types_package.notice_list_tbl;
BEGIN
  SELECT nl.* BULK COLLECT INTO notice_lists1 
  FROM list_membership lm
  INNER JOIN notice_list nl 
  ON lm.notice_list_id = nl.list_id
  WHERE lm.employee_id = PARAM_EMPLOYEE_ID;
  all_lists := notice_lists1;
  FOR i IN notice_lists1.FIRST .. notice_lists1.LAST LOOP
    SELECT nl2.* BULK COLLECT INTO notice_lists2 FROM sublist s
      INNER JOIN notice_list nl2 ON s.parent_list_id = nl2.list_id
      CONNECT BY PRIOR s.parent_list_id = s.child_list_id
      START WITH s.child_list_id = notice_lists1(i).list_id;
   all_lists := all_lists MULTISET UNION notice_lists2;
  END LOOP;
END;