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
DROP SEQUENCE mailing_list_seq ; 
create sequence mailing_list_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger mailing_list_PK_trig 
before insert on mailing_list
for each row 
begin 
select mailing_list_seq.nextval into :new.list_id from dual; 
end; 
/
alter table mailing_list add created date ; 
alter table mailing_list add created_by VARCHAR2 (255) ; 
alter table mailing_list add row_version_number integer ; 
alter table mailing_list add updated date ; 
alter table mailing_list add updated_by VARCHAR2 (255) ; 
/
create or replace trigger mailing_list_AUD_trig 
before insert or update on mailing_list 
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

-- Table mailing_list_role has a compound primary key so no sequence or trigger was created for it.
-- Table mailing_list_sublist has a compound primary key so no sequence or trigger was created for it.
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
