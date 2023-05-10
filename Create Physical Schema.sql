CREATE SCHEMA Script 
--   Database Version   : 11.2.0.2.0 
--   Toad Version       : 10.1.1.8 
--   DB Connect String  : XE 
--   Schema             : DINA 
--   Script Created by  : DINA 
--   Script Created at  : 12/28/2022 5:10:26 PM 
--   Physical Location  :  
--   Notes              :  
--

-- Object Counts: 
--   Indexes: 18 Foreign indexes + 1  BITMAP index       Columns: 19         
--   Tables: 12         Columns: 72         Constraints: 28     


CREATE TABLE CLASS_DIM
(
  CLASS_KEY   NUMBER,
  CLASS_ID    NUMBER,
  CLASS_TYPE  VARCHAR2(250 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE CUSTOMER_CARE_FACT
(
  CASE_KEY          NUMBER,
  PASSENGER_KEY     NUMBER,
  FLIGHT_KEY        NUMBER,
  HOTEL_KEY         NUMBER,
  DATE_KEY          NUMBER,
  INTERACTION_KEY   NUMBER,
  EMPLOYEE_KEY      NUMBER,
  PROBLEM_SEVERITY  NUMBER
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE CUTOMER_SERVICES_DIM
(
  EMPLOYEE_KEY   NUMBER,
  EMPLOYEE_ID    NUMBER,
  EMPLOYEE_NAME  VARCHAR2(250 BYTE),
  OFFICE_NUMBER  VARCHAR2(250 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE DATE_DIM
(
  DATE_KEY  NUMBER,
  MINITUE   NUMBER,
  HOURS     NUMBER,
  DAYS      NUMBER,
  MONTHS    NUMBER,
  QUARTER   NUMBER,
  YEARS     NUMBER
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE FARE_BASE_DIM
(
  FARE_BASE_KEY   NUMBER,
  FARE_BASE_ID    NUMBER,
  FARE_BASE_TYPE  VARCHAR2(250 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE FLIGHT_DIM
(
  FLIGHT_KEY             NUMBER,
  FLIGHT_ID              NUMBER,
  DEPATURE_AIRPORT       VARCHAR2(250 BYTE),
  ARRAIVAL_AIRPORT       VARCHAR2(250 BYTE),
  COMANY_NAME            VARCHAR2(250 BYTE),
  ACTUAL_PRICE           NUMBER,
  FLIGHT_MILES           NUMBER,
  DEPATURE_DATE          DATE,
  ARRAIVAL_DATE          DATE,
  TOTAL_PASSENGER_COUNT  NUMBER
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE HOTEL_DIM
(
  HOTEL_KEY       NUMBER,
  HOTEL_ID        NUMBER,
  HOTEL_NAME      VARCHAR2(250 BYTE),
  HOTEL_LOCATION  VARCHAR2(250 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE INTERATION_DIM
(
  INTERACTION_KEY   NUMBER,
  INTERACTION_ID    NUMBER,
  INTERACTION_TIME  VARCHAR2(250 BYTE),
  INTERACTION_TYPE  VARCHAR2(250 BYTE),
  DISCRIPTION       VARCHAR2(250 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE PASSENGER_DIM
(
  PASSENGER_KEY   NUMBER,
  PASSENGER_ID    NUMBER,
  PASSENGER_NAME  VARCHAR2(250 BYTE),
  ADDRESS         VARCHAR2(250 BYTE),
  PHONE           VARCHAR2(250 BYTE),
  SUB_STAT        VARCHAR2(250 BYTE),
  TOTAL_MILES     NUMBER
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE RESERVATION_CHANNEL_DIM
(
  CHANNEL_KEY               NUMBER,
  CHANNEL_ID                NUMBER,
  RESERVATION_CHANNEL_TYPE  VARCHAR2(250 BYTE),
  PAYMENT_METHOD            VARCHAR2(250 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE RESERVATION_FACT
(
  RESERVATION_KEY          NUMBER,
  PASSENGER_KEY            NUMBER,
  FLIGHT_KEY               NUMBER,
  RESERVATION_CHANNEL_KEY  NUMBER,
  CLASS_KEY                NUMBER,
  FARE_BASE_KEY            NUMBER,
  DATE_KEY                 NUMBER,
  DISCOUNT                 NUMBER,
  TOTAL_PRICE              NUMBER,
  SEAT_NUMBER              NUMBER
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE TRANSIT_HOTEL_FACT
(
  FLIGHT_KEY               NUMBER,
  PASSENGER_KEY            NUMBER,
  RESERVATION_CHANNEL_KEY  NUMBER,
  HOTEL_KEY                NUMBER,
  DATE_KEY                 NUMBER,
  TICKET_NUMBER            NUMBER,
  NUMBER_OF_NIGHTS         NUMBER
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;





CREATE UNIQUE INDEX CASE_PK_CONS ON CUSTOMER_CARE_FACT
(CASE_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX PASSENGER_PK_CON ON CUSTOMER_CARE_FACT
(PASSENGER_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX FLIGHT_KEY_CON ON CUSTOMER_CARE_FACT
(FLIGHT_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX HOTEL_PK_CONS ON CUSTOMER_CARE_FACT
(HOTEL_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX DATE_KEY_CONS ON CUSTOMER_CARE_FACT
(DATE_KEY )
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX INTERACTION_KEY_CONS ON CUSTOMER_CARE_FACT
(INTERACTION_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX EMPLOYEE_KEY_CONS ON CUSTOMER_CARE_FACT
(EMPLOYEE_KEY)
LOGGING
NOPARALLEL;




  

CREATE UNIQUE INDEX FLIGHT_KEY2_CONS ON TRANSIT_HOTEL_FACT
(FLIGHT_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX PASSENGER_KEY2_CONS ON TRANSIT_HOTEL_FACT
(PASSENGER_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX RESERVATION_CHANNEL_KEY2_CONS ON TRANSIT_HOTEL_FACT
(RESERVATION_CHANNEL_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX HOTEL_KEY2_CONS ON TRANSIT_HOTEL_FACT
(HOTEL_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX DATE_KEY2_CONS ON TRANSIT_HOTEL_FACT
(DATE_KEY)
LOGGING
NOPARALLEL;




CREATE UNIQUE INDEX PASSENGER_KEY3_CONS ON RESERVATION_FACT
(PASSENGER_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX FLIGHT_KEY3_CONS ON RESERVATION_FACT
(FLIGHT_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX RESERVATION_CHANNEL_KEY3_CONS ON RESERVATION_FACT
(RESERVATION_CHANNEL_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX CLASS_KEY3_CONS ON RESERVATION_FACT
(CLASS_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX FARE_BASE_KEY3_CONS ON RESERVATION_FACT
(FARE_BASE_KEY)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX DATE_KEY3_CONS ON RESERVATION_FACT
(DATE_KEY)
LOGGING
NOPARALLEL;


CREATE BITMAP INDEX RESERVATION_BITMAP_INDEX
ON RESERVATION_FACT(DATE_DIM.DATE_KEY,FARE_BASE_DIM.FARE_BASE_KEY,CLASS_DIM.CLASS_KEY,
,FLIGHT_DIM.FLIGHT_KEY,PASSENGER_DIM.PASSENGER_KEY,RESERVATION_CHANNEL_DIM.CHANNEL_KEY)
FROM RESERVATION_FACT, CLASS_DIM ,DATE_DIM,FARE_BASE_DIM,FLIGHT_DIM,PASSENGER_DIM,RESERVATION_CHANNEL_DIM
WHERE RESERVATION_FACT.DATE_KEY=DATE_DIM.DATE_KEY 
AND RESERVATION_FACT.FARE_BASE_KEY=FARE_BASE_DIM.FARE_BASE_KEY
AND RESERVATION_FACT.CLASS_KEY =CLASS_DIM.CLASS_KEY
AND RESERVATION_FACT.CHANNEL_KEY=RESERVATION_CHANNEL_DIM.CHANNEL_KEY
AND RESERVATION_FACT.FLIGHT_KEY=FLIGHT_DIM.FLIGHT_KEY
AND RESERVATION_FACT.PASSENGER_KEY=PASSENGER_DIM.PASSENGER_KEY
AND RESERVATION_FACT.CHANNEL_KEY=RESERVATION_CHANNEL_DIM.CHANNEL_KEY
LOGGING
NOPARALLEL;




ALTER TABLE CLASS_DIM ADD (
  CONSTRAINT CLASS_PK_CONS
 PRIMARY KEY
 (CLASS_KEY));

ALTER TABLE CUSTOMER_CARE_FACT ADD (
  CONSTRAINT CASE_PK_CONS
 PRIMARY KEY
 (CASE_KEY));

ALTER TABLE CUTOMER_SERVICES_DIM ADD (
  CONSTRAINT EMP_PK_CONS
 PRIMARY KEY
 (EMPLOYEE_KEY));

ALTER TABLE DATE_DIM ADD (
  CONSTRAINT DATE_PK_CONS
 PRIMARY KEY
 (DATE_KEY));

ALTER TABLE FARE_BASE_DIM ADD (
  CONSTRAINT FARE_PK_CONS
 PRIMARY KEY
 (FARE_BASE_KEY));

ALTER TABLE FLIGHT_DIM ADD (
  CONSTRAINT FLIGHT_PK_CONS
 PRIMARY KEY
 (FLIGHT_KEY));

ALTER TABLE HOTEL_DIM ADD (
  CONSTRAINT HOTEL_PK_CONS
 PRIMARY KEY
 (HOTEL_KEY));

ALTER TABLE INTERATION_DIM ADD (
  CONSTRAINT INTER_PK_CONS
 PRIMARY KEY
 (INTERACTION_KEY));

ALTER TABLE PASSENGER_DIM ADD (
  CONSTRAINT PK_CONS
 PRIMARY KEY
 (PASSENGER_KEY));

ALTER TABLE RESERVATION_CHANNEL_DIM ADD (
  CONSTRAINT CHANNEL_PK_CON
 PRIMARY KEY
 (CHANNEL_KEY));

ALTER TABLE RESERVATION_FACT ADD (
  CONSTRAINT RES_PK_CONS
 PRIMARY KEY
 (RESERVATION_KEY));

ALTER TABLE CUSTOMER_CARE_FACT ADD (
  CONSTRAINT DATE_FK_CONSSS 
 FOREIGN KEY (DATE_KEY) 
 REFERENCES DATE_DIM (DATE_KEY),
  CONSTRAINT EMP_FK_CONSSS 
 FOREIGN KEY (EMPLOYEE_KEY) 
 REFERENCES CUTOMER_SERVICES_DIM (EMPLOYEE_KEY),
  CONSTRAINT FLIGHT_FK_CONSSS 
 FOREIGN KEY (FLIGHT_KEY) 
 REFERENCES FLIGHT_DIM (FLIGHT_KEY),
  CONSTRAINT HOTEL_FK_CONSSS 
 FOREIGN KEY (HOTEL_KEY) 
 REFERENCES HOTEL_DIM (HOTEL_KEY),
  CONSTRAINT INTER_FK_CONSSS 
 FOREIGN KEY (INTERACTION_KEY) 
 REFERENCES INTERATION_DIM (INTERACTION_KEY),
  CONSTRAINT PASS_FK_CONSSS 
 FOREIGN KEY (PASSENGER_KEY) 
 REFERENCES PASSENGER_DIM (PASSENGER_KEY));

ALTER TABLE RESERVATION_FACT ADD (
  CONSTRAINT CHANNEL_FK_CONS 
 FOREIGN KEY (RESERVATION_CHANNEL_KEY) 
 REFERENCES RESERVATION_CHANNEL_DIM (CHANNEL_KEY),
  CONSTRAINT CLASS_FK_CONS 
 FOREIGN KEY (CLASS_KEY) 
 REFERENCES CLASS_DIM (CLASS_KEY),
  CONSTRAINT DATE_FK_CONS 
 FOREIGN KEY (DATE_KEY) 
 REFERENCES DATE_DIM (DATE_KEY),
  CONSTRAINT FARE_FK_CONS 
 FOREIGN KEY (FARE_BASE_KEY) 
 REFERENCES FARE_BASE_DIM (FARE_BASE_KEY),
  CONSTRAINT FLIGHT_FK_CON 
 FOREIGN KEY (FLIGHT_KEY) 
 REFERENCES FLIGHT_DIM (FLIGHT_KEY),
  CONSTRAINT PASS_FK_CONS 
 FOREIGN KEY (PASSENGER_KEY) 
 REFERENCES PASSENGER_DIM (PASSENGER_KEY));

ALTER TABLE TRANSIT_HOTEL_FACT ADD (
  CONSTRAINT DATE_FK_CONSS 
 FOREIGN KEY (DATE_KEY) 
 REFERENCES DATE_DIM (DATE_KEY),
  CONSTRAINT FLIGHT_FK_CONSS 
 FOREIGN KEY (FLIGHT_KEY) 
 REFERENCES FLIGHT_DIM (FLIGHT_KEY),
  CONSTRAINT HOTEL_FK_CONSS 
 FOREIGN KEY (HOTEL_KEY) 
 REFERENCES HOTEL_DIM (HOTEL_KEY),
  CONSTRAINT PASS_FK_CONSS 
 FOREIGN KEY (PASSENGER_KEY) 
 REFERENCES PASSENGER_DIM (PASSENGER_KEY),
  CONSTRAINT RESE_FK_CONSS 
 FOREIGN KEY (RESERVATION_CHANNEL_KEY) 
 REFERENCES RESERVATION_CHANNEL_DIM (CHANNEL_KEY));