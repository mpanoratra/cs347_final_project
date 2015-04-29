DROP SEQUENCE division_seq ; 
create sequence division_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger division_PK_trig 
before insert on division
for each row 
begin 
select division_seq.nextval into :new.division_id from dual; 
end; 
/
alter table division add created date ; 
alter table division add created_by VARCHAR2 (255) ; 
alter table division add row_version_number integer ; 
alter table division add updated date ; 
alter table division add updated_by VARCHAR2 (255) ; 
/
create or replace trigger division_AUD_trig 
before insert or update on division 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE document_seq ; 
create sequence document_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger document_PK_trig 
before insert on document
for each row 
begin 
select document_seq.nextval into :new.doc_id from dual; 
end; 
/
alter table document add created date ; 
alter table document add created_by VARCHAR2 (255) ; 
alter table document add row_version_number integer ; 
alter table document add updated date ; 
alter table document add updated_by VARCHAR2 (255) ; 
/
create or replace trigger document_AUD_trig 
before insert or update on document 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE employee_seq ; 
create sequence employee_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger employee_PK_trig 
before insert on employee
for each row 
begin 
select employee_seq.nextval into :new.employee_id from dual; 
end; 
/
alter table employee add created date ; 
alter table employee add created_by VARCHAR2 (255) ; 
alter table employee add row_version_number integer ; 
alter table employee add updated date ; 
alter table employee add updated_by VARCHAR2 (255) ; 
/
create or replace trigger employee_AUD_trig 
before insert or update on employee 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

-- Table employee_role has a compound primary key so no sequence or trigger was created for it.
DROP SEQUENCE lab_seq ; 
create sequence lab_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger lab_PK_trig 
before insert on lab
for each row 
begin 
select lab_seq.nextval into :new.lab_id from dual; 
end; 
/
alter table lab add created date ; 
alter table lab add created_by VARCHAR2 (255) ; 
alter table lab add row_version_number integer ; 
alter table lab add updated date ; 
alter table lab add updated_by VARCHAR2 (255) ; 
/
create or replace trigger lab_AUD_trig 
before insert or update on lab 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

-- Table list_membership has a compound primary key so no sequence or trigger was created for it.
-- Table list_role has a compound primary key so no sequence or trigger was created for it.
DROP SEQUENCE notice_list_seq ; 
create sequence notice_list_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger notice_list_PK_trig 
before insert on notice_list
for each row 
begin 
select notice_list_seq.nextval into :new.list_id from dual; 
end; 
/
alter table notice_list add created date ; 
alter table notice_list add created_by VARCHAR2 (255) ; 
alter table notice_list add row_version_number integer ; 
alter table notice_list add updated date ; 
alter table notice_list add updated_by VARCHAR2 (255) ; 
/
create or replace trigger notice_list_AUD_trig 
before insert or update on notice_list 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE role_seq ; 
create sequence role_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger role_PK_trig 
before insert on role
for each row 
begin 
select role_seq.nextval into :new.id from dual; 
end; 
/
alter table role add created date ; 
alter table role add created_by VARCHAR2 (255) ; 
alter table role add row_version_number integer ; 
alter table role add updated date ; 
alter table role add updated_by VARCHAR2 (255) ; 
/
create or replace trigger role_AUD_trig 
before insert or update on role 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

-- Table sublist has a compound primary key so no sequence or trigger was created for it.
DROP INDEX notice_list_id_FK_0 ;
CREATE INDEX notice_list_id_FK_0 ON list_role(notice_list_id) ;
DROP INDEX role_id_FK_1 ;
CREATE INDEX role_id_FK_1 ON list_role(role_id) ;
DROP INDEX notice_list_id_FK_2 ;
CREATE INDEX notice_list_id_FK_2 ON list_membership(notice_list_id) ;
DROP INDEX employee_id_FK_3 ;
CREATE INDEX employee_id_FK_3 ON list_membership(employee_id) ;
DROP INDEX parent_list_id_FK_4 ;
CREATE INDEX parent_list_id_FK_4 ON sublist(parent_list_id) ;
DROP INDEX child_list_id_FK_5 ;
CREATE INDEX child_list_id_FK_5 ON sublist(child_list_id) ;
DROP INDEX employee_id_FK_6 ;
CREATE INDEX employee_id_FK_6 ON employee_role(employee_id) ;
DROP INDEX role_id_FK_7 ;
CREATE INDEX role_id_FK_7 ON employee_role(role_id) ;
DROP INDEX lab_id_FK_8 ;
CREATE INDEX lab_id_FK_8 ON division(lab_id) ;
DROP INDEX lab_id_FK_9 ;
CREATE INDEX lab_id_FK_9 ON document(lab_id) ;
DROP INDEX division_id_FK_10 ;
CREATE INDEX division_id_FK_10 ON employee(division_id) ;
DROP INDEX lab_id_FK_11 ;
CREATE INDEX lab_id_FK_11 ON employee(lab_id) ;
DROP INDEX division_id_FK_12 ;
CREATE INDEX division_id_FK_12 ON notice_list(division_id) ;
