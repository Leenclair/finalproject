--sys�� system �������� �α����ؼ� ����� ����, ���̺����̽� �����ϱ�
--sqlplus "/as sysdba  ==>�ý���dba����

--���̺� �����̽� ����
create tablespace finalproj
datafile 'C:\mydata\finalproj.dbf' size 48m
autoextend on next 10m;

/*
--���̺� �����̽� ����
drop tablespace finalproj including contents and datafiles;
*/

alter session set "_ORACLE_SCRIPT"=true; 

--����� ���� ����
create user onair
identified by onair123
default tablespace finalproj;

--����� ���Ѻο�
grant connect,resource to onair;
--grant connect, dba to herb with admin option;

--�� ���� ���� �ο��ϱ�
grant create view to onair;

grant unlimited tablespace to onair;  --���̺����̽��� ���� ���� �ο�
