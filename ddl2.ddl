DROP SEQUENCE division_seq ; 
create sequence division_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER division_PK_trig 
; 

create or replace trigger division_PK_trig 
before insert on division
for each row 
begin 
select division_seq.nextval into :new.division_id from dual; 
end; 
/

DROP SEQUENCE employee_seq ; 
create sequence employee_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER employee_PK_trig 
; 

create or replace trigger employee_PK_trig 
before insert on employee
for each row 
begin 
select employee_seq.nextval into :new.employee_id from dual; 
end; 
/

-- Table employee_role has a compound primary key so no sequence or trigger was created for it.
DROP SEQUENCE lab_seq ; 
create sequence lab_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER lab_PK_trig 
; 

create or replace trigger lab_PK_trig 
before insert on lab
for each row 
begin 
select lab_seq.nextval into :new.lab_id from dual; 
end; 
/

-- Table list_membership has a compound primary key so no sequence or trigger was created for it.
DROP SEQUENCE mailing_list_seq ; 
create sequence mailing_list_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER mailing_list_PK_trig 
; 

create or replace trigger mailing_list_PK_trig 
before insert on mailing_list
for each row 
begin 
select mailing_list_seq.nextval into :new.list_id from dual; 
end; 
/

-- Table mailing_list_role has a compound primary key so no sequence or trigger was created for it.
-- Table mailing_list_sublist has a compound primary key so no sequence or trigger was created for it.
DROP SEQUENCE role_seq ; 
create sequence role_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER role_PK_trig 
; 

create or replace trigger role_PK_trig 
before insert on role
for each row 
begin 
select role_seq.nextval into :new.id from dual; 
end; 
/

DROP INDEX mailing_list_id_FK_0 ;
CREATE INDEX mailing_list_id_FK_0 ON mailing_list_role(mailing_list_id) ;
DROP INDEX role_id_FK_1 ;
CREATE INDEX role_id_FK_1 ON mailing_list_role(role_id) ;
DROP INDEX mailing_list_id_FK_2 ;
CREATE INDEX mailing_list_id_FK_2 ON list_membership(mailing_list_id) ;
DROP INDEX employee_id_FK_3 ;
CREATE INDEX employee_id_FK_3 ON list_membership(employee_id) ;
DROP INDEX parent_mailing_list_id_FK_4 ;
CREATE INDEX parent_mailing_list_id_FK_4 ON mailing_list_sublist(parent_mailing_list_id) ;
DROP INDEX child_mailing_list_id_FK_5 ;
CREATE INDEX child_mailing_list_id_FK_5 ON mailing_list_sublist(child_mailing_list_id) ;
DROP INDEX employee_id_FK_6 ;
CREATE INDEX employee_id_FK_6 ON employee_role(employee_id) ;
DROP INDEX role_id_FK_7 ;
CREATE INDEX role_id_FK_7 ON employee_role(role_id) ;
DROP INDEX lab_id_FK_8 ;
CREATE INDEX lab_id_FK_8 ON division(lab_id) ;
DROP INDEX division_id_FK_9 ;
CREATE INDEX division_id_FK_9 ON employee(division_id) ;
DROP INDEX lab_id_FK_10 ;
CREATE INDEX lab_id_FK_10 ON employee(lab_id) ;
DROP INDEX division_id_FK_11 ;
CREATE INDEX division_id_FK_11 ON mailing_list(division_id) ;
