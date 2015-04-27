DECLARE
	lab_ins lab%ROWTYPE;
	div_ins division%ROWTYPE;
	emp_ins employee%ROWTYPE;
	list_ins mailing_list%ROWTYPE;
	lm_ins list_membership%ROWTYPE;
	lab_count INTEGER := 0;
	div_count INTEGER := 0;
	emp_count INTEGER := 0;
BEGIN
	FOR i in 1..4 LOOP
		lab_ins.name := 'lab ' || i;
		INSERT INTO lab VALUES lab_ins;
	END LOOP;
	FOR lab_cur IN (SELECT * FROM lab) LOOP
		div_ins.name := 'div ' || lab_count;
		div_ins.lab_id := lab_cur.lab_id;
		INSERT INTO division VALUES div_ins;
		div_ins.name := 'div ' || (lab_count + 1);
		div_ins.lab_id := lab_cur.lab_id;
		INSERT INTO division VALUES div_ins;
		lab_count := lab_count + 2;
	END LOOP;
	FOR div_cur IN (SELECT * FROM division) LOOP
		emp_ins.employee_name := 'Person ' || div_count;
		emp_ins.division_id := div_cur.division_id;
		emp_ins.lab_id := div_cur.lab_id;
		emp_ins.status := 't';
		INSERT INTO employee VALUES emp_ins;
		list_ins.name := 'list ' || div_count;
		list_ins.description := 'Desc...' || div_count;
		list_ins.external_view_name := 'external list name ' || div_count;
		list_ins.division_id := div_cur.division_id;
		list_ins.status := 'T';
		INSERT INTO mailing_list VALUES list_ins;
		div_count := div_count + 1;
	END LOOP;
	FOR emp_cur IN (SELECT * FROM EMPLOYEE) LOOP
		SELECT list_id INTO list_ins.list_id FROM (SELECT list_id, rownum as rn FROM mailing_list) WHERE rn = (MOD(emp_cur.employee_id, 4) + 1);
		lm_ins.mailing_list_id := list_ins.list_id;
		lm_ins.employee_id := emp_cur.employee_id;
		INSERT INTO list_membership VALUES lm_ins;
	END LOOP;
END;