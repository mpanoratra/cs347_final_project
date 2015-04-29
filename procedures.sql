create or replace procedure "CLONE_EMPLOYEE_EXISTING"
(from_emp_id IN NUMBER,
to_emp_id IN NUMBER)
is
begin
FOR list IN (SELECT * FROM list_membership lm WHERE lm.employee_id = from_emp_id) LOOP
    INSERT INTO list_membership (employee_id, notice_list_id) VALUES (to_emp_id, list.notice_list_id);
END LOOP;
end;

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