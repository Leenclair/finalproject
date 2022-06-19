/* ȸ�� */
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE RESERVATION 
	CASCADE CONSTRAINTS;

/* �Խ��� */
DROP TABLE BOARD 
	CASCADE CONSTRAINTS;

/* �ڸ�Ʈ */
DROP TABLE COMMENTS 
	CASCADE CONSTRAINTS;

/* ÷������ */
DROP TABLE FILES 
	CASCADE CONSTRAINTS;

/* ������ */
DROP TABLE MANAGER 
	CASCADE CONSTRAINTS;

/* �Խ��Ǳ��� */
DROP TABLE BOARDTYPE 
	CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE AIRPORT 
	CASCADE CONSTRAINTS;

/* ž�°� */
DROP TABLE PASSENGER 
	CASCADE CONSTRAINTS;

/* �������� */
DROP TABLE SCHEDULE 
	CASCADE CONSTRAINTS;

/* ����/ȯ�� */
DROP TABLE PAY 
	CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE NOTE 
	CASCADE CONSTRAINTS;

/* �������� */
DROP TABLE NOTEMAN 
	CASCADE CONSTRAINTS;

/* īī�� */
DROP TABLE KAKAO 
	CASCADE CONSTRAINTS;

/* ȸ�� */
CREATE TABLE MEMBER (
	MEM_NO NUMBER NOT NULL, /* ȸ���ڵ� */
	MEM_ID VARCHAR2(150) NOT NULL, /* ���̵� */
	MEM_PWD VARCHAR2(150) NOT NULL, /* ��й�ȣ */
	MEM_NAME VARCHAR2(150) NOT NULL, /* �̸� */
	M_TEL1 VARCHAR2(10) NOT NULL, /* �ڵ���1 */
	M_TEL2 VARCHAR2(10) NOT NULL, /* �ڵ���2 */
	M_TEL3 VARCHAR2(10) NOT NULL, /* �ڵ���3 */
	M_EMAIL1 VARCHAR2(60) NOT NULL, /* �̸���1 */
	M_EMAIL2 VARCHAR2(60) NOT NULL, /* �̸���2 */
	M_BIRTHDAY VARCHAR(8) NOT NULL, /* ������� */
	M_ZIPCODE VARCHAR2(150), /* �����ȣ */
	M_ADD1 VARCHAR2(150), /* �ּ� */
	M_ADD2 VARCHAR2(150), /* ���ּ� */
	M_MILEAGE NUMBER DEFAULT 0, /* �������ϸ��� */
	M_KAKAO VARCHAR(6) /* īī������ */
);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			MEM_NO
		);

/* ���� */
CREATE TABLE RESERVATION (
	R_NO NUMBER NOT NULL, /* ���Ź�ȣ */
	R_DATE DATE NOT NULL, /* �������� */
	R_PAY NUMBER NOT NULL, /* ���űݾ� */
	R_ADULT NUMBER DEFAULT 0, /* �����ο��� */
	R_CHILD NUMBER DEFAULT 0, /* �Ҿ��ο��� */
	R_CHECKPAY CHAR, /* ����Ȯ������(Y/N) */
	MEM_NO NUMBER NOT NULL, /* ȸ���ڵ� */
	S_NAME VARCHAR2(50) /* �װ���� */
);

ALTER TABLE RESERVATION
	ADD
		CONSTRAINT PK_RESERVATION
		PRIMARY KEY (
			R_NO
		);

/* �Խ��� */
CREATE TABLE BOARD (
	B_NO NUMBER NOT NULL, /* �Խ��ǹ�ȣ */
	B_ID VARCHAR2(50) NOT NULL, /* ���̵� */
	B_PWD VARCHAR2(50) NOT NULL, /* ��й�ȣ */
	B_TITLE VARCHAR2(50) NOT NULL, /* �Խñ����� */
	B_CONTENT CLOB NOT NULL, /* �Խñ۳��� */
	B_REGDATE DATE DEFAULT SYSDATE, /* ������� */
	B_COUNT NUMBER DEFAULT 0, /* ��ȸ�� */
	B_LIKE NUMBER DEFAULT 0, /* ��õ�� */
	BT_NO NUMBER /* Ÿ�Թ�ȣ */
);

ALTER TABLE BOARD
	ADD
		CONSTRAINT PK_BOARD
		PRIMARY KEY (
			B_NO
		);

/* �ڸ�Ʈ */
CREATE TABLE COMMENTS (
	C_NO NUMBER NOT NULL, /* �ڸ�Ʈ ��ȣ */
	B_NO NUMBER NOT NULL, /* �Խ��ǹ�ȣ */
	C_ID VARCHAR2(50) NOT NULL, /* ���̵� */
	C_CONTENT CLOB NOT NULL, /* �ڸ�Ʈ���� */
	C_REGDATE DATE DEFAULT SYSDATE, /* ��ϳ�¥ */
	C_GROUPNO NUMBER DEFAULT 0, /* �׷��ȣ */
	C_STEP NUMBER DEFAULT 0, /* ���� �ܰ� */
	C_SORTNO NUMBER DEFAULT 0, /* ���� ���ļ��� */
	C_DELFLAG CHAR DEFAULT 'N'  /* ���� flag */
);

ALTER TABLE COMMENTS
	ADD
		CONSTRAINT PK_COMMENTS
		PRIMARY KEY (
			C_NO
		);

/* ÷������ */
CREATE TABLE FILES (
	F_NO NUMBER NOT NULL, /* ���Ϲ�ȣ */
	F_NAME VARCHAR2(50), /* �������� */
	B_NO NUMBER NOT NULL, /* �Խ��ǹ�ȣ */
	F_REGDATE DATE DEFAULT SYSDATE, /* ���ε峯¥ */
	F_COUNT NUMBER DEFAULT 0, /* �ٿ�� */
	F_FILESIZE NUMBER DEFAULT 0, /* ���ϻ����� */
	F_ORIGINNAME VARCHAR2(50) /* ���������ϸ� */
);

ALTER TABLE FILES
	ADD
		CONSTRAINT PK_FILES
		PRIMARY KEY (
			F_NO
		);

/* ������ */
CREATE TABLE MANAGER (
	MAN_NO NUMBER NOT NULL, /* �����ڹ�ȣ */
	MAN_NAME VARCHAR2(50) NOT NULL, /* �������̸� */
	MAN_ID VARCHAR2(50) NOT NULL, /* �����ھ��̵� */
	MAN_PWD VARCHAR2(50) NOT NULL /* �����ں�й�ȣ */
);

ALTER TABLE MANAGER
	ADD
		CONSTRAINT PK_MANAGER
		PRIMARY KEY (
			MAN_NO
		);

/* �Խ��Ǳ��� */
CREATE TABLE BOARDTYPE (
	BT_NO NUMBER NOT NULL, /* Ÿ�Թ�ȣ */
	BT_NAME VARCHAR2(50) /* Ÿ���̸� */
);

ALTER TABLE BOARDTYPE
	ADD
		CONSTRAINT PK_BOARDTYPE
		PRIMARY KEY (
			BT_NO
		);

/* ���� */
CREATE TABLE AIRPORT (
	A_NO VARCHAR2(50) NOT NULL, /* ���׹�ȣ */
	A_NAME VARCHAR2(50) NOT NULL, /* �����̸� */
	A_LOC VARCHAR2(50) NOT NULL /* ������ġ */
);

ALTER TABLE AIRPORT
	ADD
		CONSTRAINT PK_AIRPORT
		PRIMARY KEY (
			A_NO
		);

/* ž�°� */
CREATE TABLE PASSENGER (
	P_NO NUMBER NOT NULL, /* �°���ȣ */
	R_NO NUMBER, /* ���Ź�ȣ */
	P_SEAT VARCHAR(4) NOT NULL, /* �¼���ȣ */
	P_NAME VARCHAR2(50) NOT NULL, /* �°��̸� */
	P_BIRTHDAY VARCHAR(8) NOT NULL, /* ������� */
	P_CON VARCHAR2(50) NOT NULL /* ���� */
);

ALTER TABLE PASSENGER
	ADD
		CONSTRAINT PK_PASSENGER
		PRIMARY KEY (
			P_NO
		);

/* �������� */
CREATE TABLE SCHEDULE (
	S_NAME VARCHAR2(50) NOT NULL, /* �װ���� */
	A_NO VARCHAR2(50), /* ��߰��׹�ȣ */
	A_NO2 VARCHAR2(50), /* �������׹�ȣ */
	S_STARTTIME DATE NOT NULL, /* ������߽ð� */
	S_ARRTIME DATE NOT NULL, /* ���������ð� */
	S_PERSON NUMBER /* ���밡���ο� */
);

ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT PK_SCHEDULE
		PRIMARY KEY (
			S_NAME
		);

/* ����/ȯ�� */
CREATE TABLE PAY (
	P_NO NUMBER NOT NULL, /* ���Ź�ȣ */
	MEM_NO NUMBER, /* ȸ���ڵ� */
	P_PAY NUMBER, /* �����ݾ� */
	P_CANCLE NUMBER DEFAULT 0, /* ��ұݾ� */
	P_PAYTIME DATE DEFAULT SYSDATE, /* �����ð� */
	P_MILEAGE NUMBER DEFAULT 0 /* ��븶�ϸ��� */
);

ALTER TABLE PAY
	ADD
		CONSTRAINT PK_PAY
		PRIMARY KEY (
			P_NO
		);

/* ���� */
CREATE TABLE NOTE (
	N_NO NUMBER NOT NULL, /* ������ȣ */
	MAN_NO NUMBER, /* �����ڹ�ȣ */
	N_TITLE VARCHAR2(50), /* �������� */
	N_CONTENT CLOB NOT NULL, /* �������� */
	N_TIME DATE DEFAULT SYSDATE /* �����ð� */
);

ALTER TABLE NOTE
	ADD
		CONSTRAINT PK_NOTE
		PRIMARY KEY (
			N_NO
		);

/* �������� */
CREATE TABLE NOTEMAN (
	NM_NO NUMBER NOT NULL, /* ����������ȣ */
	MEM_NO NUMBER, /* ȸ���ڵ� */
	NM_CHECKREAD CHAR, /* �������� */
	NM_READDATE DATE, /* ������¥ */
	N_NO NUMBER /* ������ȣ */
);

ALTER TABLE NOTEMAN
	ADD
		CONSTRAINT PK_NOTEMAN
		PRIMARY KEY (
			NM_NO
		);

/* īī�� */
CREATE TABLE KAKAO (
	MEM_NO NUMBER NOT NULL, /* ȸ���ڵ� */
	K_NAME VARCHAR2(150) NOT NULL, /* īī���̸� */
	K_EMAIL VARCHAR2(150) NOT NULL /* īī���̸��� */
);

ALTER TABLE RESERVATION
	ADD
		CONSTRAINT FK_MEMBER_TO_RESERVATION
		FOREIGN KEY (
			MEM_NO
		)
		REFERENCES MEMBER (
			MEM_NO
		);

ALTER TABLE RESERVATION
	ADD
		CONSTRAINT FK_SCHEDULE_TO_RESERVATION
		FOREIGN KEY (
			S_NAME
		)
		REFERENCES SCHEDULE (
			S_NAME
		);

ALTER TABLE BOARD
	ADD
		CONSTRAINT FK_BOARDTYPE_TO_BOARD
		FOREIGN KEY (
			BT_NO
		)
		REFERENCES BOARDTYPE (
			BT_NO
		);

ALTER TABLE COMMENTS
	ADD
		CONSTRAINT FK_BOARD_TO_COMMENTS
		FOREIGN KEY (
			B_NO
		)
		REFERENCES BOARD (
			B_NO
		);

ALTER TABLE FILES
	ADD
		CONSTRAINT FK_BOARD_TO_FILES
		FOREIGN KEY (
			B_NO
		)
		REFERENCES BOARD (
			B_NO
		);

ALTER TABLE PASSENGER
	ADD
		CONSTRAINT FK_RESERVATION_TO_PASSENGER
		FOREIGN KEY (
			R_NO
		)
		REFERENCES RESERVATION (
			R_NO
		);

ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT FK_AIRPORT_TO_SCHEDULE
		FOREIGN KEY (
			A_NO
		)
		REFERENCES AIRPORT (
			A_NO
		);

ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT FK_AIRPORT_TO_SCHEDULE2
		FOREIGN KEY (
			A_NO2
		)
		REFERENCES AIRPORT (
			A_NO
		);

ALTER TABLE PAY
	ADD
		CONSTRAINT FK_MEMBER_TO_PAY
		FOREIGN KEY (
			MEM_NO
		)
		REFERENCES MEMBER (
			MEM_NO
		);

ALTER TABLE PAY
	ADD
		CONSTRAINT FK_RESERVATION_TO_PAY
		FOREIGN KEY (
			P_NO
		)
		REFERENCES RESERVATION (
			R_NO
		);

ALTER TABLE NOTE
	ADD
		CONSTRAINT FK_MANAGER_TO_NOTE
		FOREIGN KEY (
			MAN_NO
		)
		REFERENCES MANAGER (
			MAN_NO
		);

ALTER TABLE NOTEMAN
	ADD
		CONSTRAINT FK_NOTE_TO_NOTEMAN
		FOREIGN KEY (
			N_NO
		)
		REFERENCES NOTE (
			N_NO
		);

ALTER TABLE NOTEMAN
	ADD
		CONSTRAINT FK_MEMBER_TO_NOTEMAN
		FOREIGN KEY (
			MEM_NO
		)
		REFERENCES MEMBER (
			MEM_NO
		);

ALTER TABLE KAKAO
	ADD
		CONSTRAINT FK_MEMBER_TO_KAKAO
		FOREIGN KEY (
			MEM_NO
		)
		REFERENCES MEMBER (
			MEM_NO
		);
		
drop sequence seq_MEMBER;
--ȸ��������

create sequence seq_MEMBER
increment by 1
start with 1
nocycle
nocache;

drop sequence seq_RESERVATION;
--���������
create sequence seq_RESERVATION
increment by 1
start with 1
nocycle
nocache;

drop sequence seq_BOARD;
--�Խ��ǽ�����
create sequence seq_BOARD
increment by 1
start with 1
nocycle
nocache;

drop sequence seq_COMMENTS;
--�ڸ�Ʈ������
create sequence seq_COMMENTS
increment by 1
start with 1
nocycle
nocache;

drop sequence seq_FILES;
--����÷�ν�����
create sequence seq_FILES
increment by 1
start with 1
nocycle
nocache;

drop sequence seq_MANAGER;
--�����ڽ�����
create sequence seq_MANAGER
increment by 1
start with 1
nocycle
nocache;

drop sequence seq_AIRPORT;
--���׽�����
create sequence seq_AIRPORT
increment by 1
start with 1
nocycle
nocache;

drop sequence seq_PASSENGER;
--ž�°�������
create sequence seq_PASSENGER
increment by 1
start with 1
nocycle
nocache;

drop sequence seq_SCHEDULE;
--��������������
create sequence seq_SCHEDULE
increment by 1
start with 1
nocycle
nocache;

drop sequence seq_PAY;
--����/ȯ�ҽ�����
create sequence seq_PAY
increment by 1
start with 1
nocycle
nocache;

drop sequence seq_NOTE;
--����������
create sequence seq_NOTE
increment by 1
start with 1
nocycle
nocache;
						 
--data insert
insert into boardtype values(1, '��������');
insert into boardtype values(2, '���ǹ���ȸ');
insert into boardtype values(3, '���ǼҸ�');
commit;				 

						  
			  
			
	   
		

							  
				 
							   
			  
			
	   
		

						
					
						 
			  
			
	   
		

						  
					
						   
			  
			
	   
		

					   
					   
						
			  
			
	   
		

						  
					
						   
			  
			
	   
		

							
						  
							 
			  
			
	   
		

						  
				 
						   
			  
			
	   
		

							
					
							 
			  
			
	   
		

						   
					   
							
			  
			
	   
		

					  
						
					   
			  
			
	   
		

					   
				 
						
			  
			
	   
		