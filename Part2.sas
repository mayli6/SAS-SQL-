/************************************************
Name of DS: MAY LI 
Name of SAS program: Part2.sas
Description: P2
Date first written: Wed, 01-Dec-2021
Date last updated: Wed, 15-Dec-2021
Library name: DMFT4992
Dataset: DIABETES_DS_IMP
*************************************************/

/*~~~~~~~~~~~ CHAPTER 4: Data Dictionary ~~~~~~~~~~~*/

/* 4.1 - Structure of Dictionary Table */

PROC SQL;

DESCRIBE TABLE DICTIONARY.TABLES;

QUIT;

/**************************************************/

/* 4.2 - Dictionary Table: Display of Datasets Stored in DMFT4992 Library */

TITLE1 'Dictionary Table:';
TITLE2 'Display of Datasets Stored in DMFT4992 Library';

PROC SQL;

SELECT 
libname Label 'Library Name',
memname Label 'Member Name',
crdate Label 'Date Created',
nobs Label 'Number of Physical Observations',
nvar Label 'Number of Variables',
num_character Label 'Number of Character Variables',
num_numeric Label 'Number of Numeric Variables'
FROM DICTIONARY.TABLES
WHERE libname EQ 'DMFT4992';

QUIT;

/**************************************************/

/* 4.3 - Dictionary Table: List of All Dictionary Tables */

TITLE1 'Dictionary Table:';
TITLE2 'List of All Dictionary Tables';

PROC SQL;

SELECT *
FROM dictionary.dictionaries;

QUIT;

/**************************************************/

/* 4.4 - View: List of All View Objects in Data Dictionary */
/* (Before Creating a New View) */

TITLE1 'View:';
TITLE2 'List of All View Objects in Data Dictionary';

PROC SQL;

SELECT *
FROM dictionary.members
WHERE memtype EQ 'VIEW';

QUIT;

/**************************************************/

/* 4.5 - View: Formation of a New View from Dataset */

TITLE1 'View:';
TITLE2 'Formation of a New View from Dataset';

PROC SQL;

CREATE VIEW DMFT4992.DIABETES_DS_IMP_VIEW_GABP AS
SELECT Gender, Age, BPLevel
FROM DMFT4992.DIABETES_DS_IMP
WHERE ( BPLevel EQ 'high' );

QUIT;

/**************************************************/

/* 4.6 - View: List of Contents in View Object */

TITLE1 'View:';
TITLE2 'List of Contents in View Object';

PROC SQL;

SELECT *
FROM DMFT4992.DIABETES_DS_IMP_VIEW_GABP;

QUIT;

/**************************************************/

/* 4.7 - List of All View Objects in Data Dictionary */
/* (After Creating a New View) */

TITLE1 'View:';
TITLE2 'List of All View Objects in Data Dictionary';

PROC SQL;

SELECT *
FROM dictionary.members
WHERE memtype EQ 'VIEW';

QUIT;

/**************************************************/

/* 4.8 - Dataset: List of All Datasets in Data Dictionary */

TITLE1 'Dataset:';
TITLE2 'List of All Datasets in Data Dictionary';

PROC SQL;

SELECT *
FROM dictionary.members
WHERE memtype EQ 'DATA';

QUIT;

/**************************************************/

/* 4.9 - Dataset: Change of Variable Name */

DATA DMFT4992.DIABETES_DS_IMP_NEW (RENAME=(Pregancies=Pregnancies));

SET DMFT4992.DIABETES_DS_IMP;

RUN;

/**************************************************/

/* 4.10.1 - Before Labelling: Display of Dataset Structure */

PROC SQL;

DESCRIBE TABLE DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* 4.10.2 - Before Labelling: Display of Dataset Contents */

TITLE1 'Before Labelling:';
TITLE2 'Display of Dataset Contents';

PROC SQL;

SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* 4.10.4 - After Labelling: Display of Dataset Structure */

PROC SQL;

DESCRIBE TABLE DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* 4.10.5 - After Labelling: Display of Dataset Contents */

TITLE1 'After Labelling:';
TITLE2 'Display of Dataset Contents';

PROC SQL;

SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/*~~~~~~~~~~~ CHAPTER 5: Label Encoding ~~~~~~~~~~~*/

/* 5.1 - Label Encoding for Two Categories Variables */

/******* 5.1.1 - Label Encoding for Variable 1 - Gender *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD Gender_encoded num;

QUIT;

/**************************************************/

/* STEP 3a: Application of Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET Gender_encoded = CASE
					 WHEN UPCASE(Gender) EQ 'MALE' THEN 1
					 WHEN UPCASE(Gender) EQ 'FEMALE' THEN 0
					 END;
					 
QUIT;


/* STEP 3b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/*STEP 4: Removal of Original Non-Encoded Variable*/

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP Gender;

QUIT;

/**************************************************/

/*STEP 5: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL Gender_encoded = 'Gender Encoded';
RUN;

/**************************************************/

/******* 5.1.2 - Label Encoding for Variable 2 - Family_Diabetes *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD Family_Diabetes_encoded num;

QUIT;

/**************************************************/

/* STEP 3a: Application of Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET Family_Diabetes_encoded = CASE
					 WHEN UPCASE(Family_Diabetes) EQ 'YES' THEN 1
					 WHEN UPCASE(Family_Diabetes) EQ 'NO' THEN 0
					 END;
					 
QUIT;


/* STEP 3b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/*STEP 4: Removal of Original Non-Encoded Variable*/

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP Family_Diabetes;

QUIT;

/**************************************************/

/*STEP 5a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL Family_Diabetes_encoded = 'Encoded Family History with Diabetes';
RUN;

/* STEP 5b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/******* 5.1.3 - Label Encoding for Variable 3 - highBP *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD highBP_encoded num;

QUIT;

/**************************************************/

/* STEP 3a: Application of Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET highBP_encoded = CASE
					 WHEN UPCASE(highBP) EQ 'YES' THEN 1
					 WHEN UPCASE(highBP) EQ 'NO' THEN 0
					 END;
					 
QUIT;


/* STEP 3b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/*STEP 4: Removal of Original Non-Encoded Variable*/

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP highBP;

QUIT;

/**************************************************/

/*STEP 5a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL highBP_encoded = 'Encoded Diagnosis of High Blood Pressure';
RUN;

/* STEP 5b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/******* 5.1.4 - Label Encoding for Variable 4 - Smoking *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD Smoking_encoded num;

QUIT;

/**************************************************/

/* STEP 3a: Application of Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET Smoking_encoded = CASE
					 WHEN UPCASE(Smoking) EQ 'YES' THEN 1
					 WHEN UPCASE(Smoking) EQ 'NO' THEN 0
					 END;
					 
QUIT;


/* STEP 3b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/*STEP 4: Removal of Original Non-Encoded Variable*/

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP Smoking;

QUIT;

/**************************************************/

/*STEP 5a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL Smoking_encoded = 'Encoded Smoking Habits';
RUN;

/* STEP 5b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/******* 5.1.5 - Label Encoding for Variable 5 - Alcohol *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD Alcohol_encoded num;

QUIT;

/**************************************************/

/* STEP 3a: Application of Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET Alcohol_encoded = CASE
					 WHEN UPCASE(Alcohol) EQ 'YES' THEN 1
					 WHEN UPCASE(Alcohol) EQ 'NO' THEN 0
					 END;
					 
QUIT;


/* STEP 3b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/*STEP 4: Removal of Original Non-Encoded Variable*/

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP Alcohol;

QUIT;

/**************************************************/

/*STEP 5a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL Alcohol_encoded = 'Encoded Alcohol Consumption';
RUN;

/* STEP 5b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/******* Label Encoding for Variable 6 - RegularMedicine *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD RegularMedicine_encoded num;

QUIT;

/**************************************************/

/* STEP 3a: Application of Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET RegularMedicine_encoded = CASE
					 WHEN UPCASE(RegularMedicine) EQ 'YES' THEN 1
					 WHEN UPCASE(RegularMedicine) EQ 'NO' THEN 0
					 END;
					 
QUIT;


/* STEP 3b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/*STEP 4: Removal of Original Non-Encoded Variable*/

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP RegularMedicine;

QUIT;

/**************************************************/

/*STEP 5a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL RegularMedicine_encoded = 'Encoded Regular Medicine Consumption';
RUN;

/* STEP 5b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/******* Label Encoding for Variable 7 - Pdiabetes_new *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD Pdiabetes_encoded num;

QUIT;

/**************************************************/

/* STEP 3a: Application of Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET Pdiabetes_encoded = CASE
					 WHEN UPCASE(Pdiabetes_new) EQ 'YES' THEN 1
					 WHEN UPCASE(Pdiabetes_new) EQ 'NO' THEN 0
					 END;
					 
QUIT;


/* STEP 3b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/*STEP 4: Removal of Original Non-Encoded Variable*/

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP Pdiabetes_new;

QUIT;

/**************************************************/

/*STEP 5a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL Pdiabetes_encoded = 'Encoded Diagnosis of Gestation Diabetes';
RUN;

/* STEP 5b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/******* Label Encoding for Variable 8 - UriationFreq *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD UrinationFreq_encoded num;

QUIT;

/**************************************************/

/* STEP 3a: Application of Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET UrinationFreq_encoded = CASE
					 WHEN UPCASE(UriationFreq) EQ 'QUITE OFTEN' THEN 1
					 WHEN UPCASE(UriationFreq) EQ 'NOT MUCH' THEN 0
					 END;
					 
QUIT;


/* STEP 3b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/*STEP 4: Removal of Original Non-Encoded Variable*/

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP UriationFreq;

QUIT;

/**************************************************/

/*STEP 5a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL UrinationFreq_encoded = 'Encoded Urination Frequency';
RUN;

/* STEP 5b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/******* Label Encoding for Variable 9 - Diabetic *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD Diabetic_encoded num;

QUIT;

/**************************************************/

/* STEP 3a: Application of Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET Diabetic_encoded = CASE
					 WHEN UPCASE(Diabetic) EQ 'YES' THEN 1
					 WHEN UPCASE(Diabetic) EQ 'NO' THEN 0
					 END;
					 
QUIT;


/* STEP 3b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/*STEP 4: Removal of Original Non-Encoded Variable*/

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP Diabetic;

QUIT;

/**************************************************/

/*STEP 5a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL Diabetic_encoded = 'Encoded Diagnosis of Diabetes';
RUN;

/* STEP 5b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/******* 5.1.6 - Duplication of Dataset as Backup *********/

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK_ENC AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* 5.2 - Label Encoding for Ordinal Variables */

/******* 5.2.1 - Ordinal Label Encoding for Variable 1 - Age *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD Age_encoded num;

QUIT;

/**************************************************/

/*STEP 3a: Initialization of New Column Values to 0 */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET Age_encoded = 0;

QUIT;


/* STEP 3b: Display of Results After Initializing 0 Values */

PROC SQL;

TITLE1 'Display of Results After Initializing 0 Values';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 4: Application of Ordinal Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET Age_encoded =
	CASE
		WHEN UPCASE(Age) EQ 'LESS THAN 40' THEN 0
		WHEN UPCASE(Age) EQ '40-49' THEN 1
		WHEN UPCASE(Age) EQ '50-59 ' THEN 2
		WHEN UPCASE(Age) EQ '60 OR OLDER' THEN 3
	END;
	
QUIT;


/* STEP 4b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 5: Removal of Original Non-Encoded Variable */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP Age;

QUIT;

/**************************************************/

/*STEP 6a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL Age_encoded = 'Encoded Range of Age';
RUN;

/* STEP 6b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/******* 5.2.2 - Ordinal Label Encoding for Variable 2 - PhysicallyActive *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD PhysicallyActive_encoded num;

QUIT;

/**************************************************/

/*STEP 3a: Initialization of New Column Values to 0 */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET PhysicallyActive_encoded = 0;

QUIT;


/* STEP 3b: Display of Results After Initializing 0 Values */

PROC SQL;

TITLE1 'Display of Results After Initializing 0 Values';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 4a: Application of Ordinal Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET PhysicallyActive_encoded =
	CASE
		WHEN UPCASE(PhysicallyActive) EQ 'NONE' THEN 0
		WHEN UPCASE(PhysicallyActive) EQ 'LESS THAN HALF AN HR' THEN 1
		WHEN UPCASE(PhysicallyActive) EQ 'MORE THAN HALF AN HR' THEN 2
		WHEN UPCASE(PhysicallyActive) EQ 'ONE HR OR MORE' THEN 3
	END;
	
QUIT;


/* STEP 4b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 5: Removal of Original Non-Encoded Variable */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP PhysicallyActive;

QUIT;

/**************************************************/

/*STEP 6a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL PhysicallyActive_encoded = 'Encoded Time Being Physically Active';
RUN;

/* STEP 6b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/******* 5.2.3 - Ordinal Label Encoding for Variable 3 - JunkFood *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD JunkFood_encoded num;

QUIT;

/**************************************************/

/*STEP 3a: Initialization of New Column Values to 0 */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET JunkFood_encoded = 0;

QUIT;


/* STEP 3b: Display of Results After Initializing 0 Values */

PROC SQL;

TITLE1 'Display of Results After Initializing 0 Values';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 4a: Application of Ordinal Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET JunkFood_encoded =
	CASE
		WHEN UPCASE(JunkFood) EQ 'OCCASIONALLY' THEN 0
		WHEN UPCASE(JunkFood) EQ 'OFTEN' THEN 1
		WHEN UPCASE(JunkFood) EQ 'VERY OFTEN ' THEN 2
		WHEN UPCASE(JunkFood) EQ 'ALWAYS' THEN 3
	END;
	
QUIT;


/* STEP 4b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 5: Removal of Original Non-Encoded Variable */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP JunkFood;

QUIT;

/**************************************************/

/*STEP 6a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL JunkFood_encoded = 'Encoded Junk Food Consumption Frequency';
RUN;

/* STEP 6b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/******* 5.2.4 - Ordinal Label Encoding for Variable 4 - Stress *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD Stress_encoded num;

QUIT;

/**************************************************/

/*STEP 3a: Initialization of New Column Values to 0 */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET Stress_encoded = 0;

QUIT;


/* STEP 3b: Display of Results After Initializing 0 Values */

PROC SQL;

TITLE1 'Display of Results After Initializing 0 Values';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 4: Application of Ordinal Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET Stress_encoded =
	CASE
		WHEN UPCASE(Stress) EQ 'NOT AT ALL' THEN 0
		WHEN UPCASE(Stress) EQ 'SOMETIMES' THEN 1
		WHEN UPCASE(Stress) EQ 'VERY OFTEN' THEN 2
		WHEN UPCASE(Stress) EQ 'ALWAYS' THEN 3
	END;
	
QUIT;


/* STEP 4b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 5: Removal of Original Non-Encoded Variable */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP Stress;

QUIT;

/**************************************************/

/*STEP 6a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL Stress_encoded = 'Encoded Stress Frequency';
RUN;

/* STEP 6b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/******* 5.2.5 - Ordinal Label Encoding for Variable 5 - BPLevel *********/

/* STEP 1: Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Column */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
ADD BPLevel_encoded num;

QUIT;

/**************************************************/

/*STEP 3a: Initialization of New Column Values to 0 */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET BPLevel_encoded = 0;

QUIT;


/* STEP 3b: Display of Results After Initializing 0 Values */

PROC SQL;

TITLE1 'Display of Results After Initializing 0 Values';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 4: Application of Ordinal Label Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW
SET BPLevel_encoded =
	CASE
		WHEN UPCASE(BPLevel) EQ 'LOW' THEN 0
		WHEN UPCASE(BPLevel) EQ 'NORMAL' THEN 1
		WHEN UPCASE(BPLevel) EQ 'HIGH' THEN 2
	END;
	
QUIT;


/* STEP 4b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/* STEP 5: Removal of Original Non-Encoded Variable */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW
DROP BPLevel;

QUIT;

/**************************************************/

/*STEP 6a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW;
SET DMFT4992.DIABETES_DS_IMP_NEW;
LABEL BPLevel_encoded = 'Encoded Blood Pressure Level';
RUN;

/* STEP 6b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/******* 5.2.6 - Completion of Label Encoding & View of Encoded Dataset *********/

/* Duplication of Dataset as Backup */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_BK AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/* Display of Labelled Encoded Dataset */

PROC SQL;

TITLE1 'Display of Encoded Dataset';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;

/**************************************************/

/*~~~~~~~~~~~ CHAPTER 6: One-Hot Encoding ~~~~~~~~~~~*/

/* 6.1 - One-Hot Encoding for Age Variabel */

/* STEP 1: Duplication of Dataset */

PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_NEW_DEMO AS
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW_BK_ENC;

QUIT;

/**************************************************/

/* STEP 2: Formation of New Physical Columns */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW_DEMO
ADD Age_less_than_40_encoded num,
	Age_40_to_49_encoded num,
	Age_50_to_59_encoded num,
	Age_more_than_60_encoded num;

QUIT;

/**************************************************/

/*STEP 3a: Initialization of New Column Values to 0 */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW_DEMO
SET Age_less_than_40_encoded = 0,
	Age_40_to_49_encoded = 0,
	Age_50_to_59_encoded = 0,
	Age_more_than_60_encoded = 0;

QUIT;

/* STEP 3b: Display of Results After Initializing 0 Values */

PROC SQL;

TITLE1 'Display of Results After Initializing 0 Values';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW_DEMO;

QUIT;

/**************************************************/

/* STEP 4a: Application of One-Hot Encoding to Variable */

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP_NEW_DEMO
SET Age_less_than_40_encoded =
	CASE
		WHEN UPCASE(Age) EQ 'LESS THAN 40' THEN 1 ELSE 0
	END,
	
	Age_40_to_49_encoded =
	CASE
		WHEN UPCASE(Age) EQ '40-49' THEN 1 ELSE 0
	END,
	
	Age_50_to_59_encoded =
	CASE
		WHEN UPCASE(Age) EQ '50-59' THEN 1 ELSE 0
	END,
	
	Age_more_than_60_encoded =
	CASE
		WHEN UPCASE(Age) EQ '60 OR OLDER' THEN 1 ELSE 0
	END;
	
QUIT;

/* STEP 4b: Display of Results After Encoding */

PROC SQL;

TITLE1 'Display of Results After Encoding';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW_DEMO;

QUIT;

/**************************************************/

/* STEP 5: Removal of Original Non-Encoded Variable */

PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP_NEW_DEMO
DROP Age;

QUIT;

/**************************************************/

/*STEP 6a: Labelling for Encoded Variable */

DATA DMFT4992.DIABETES_DS_IMP_NEW_DEMO;
SET DMFT4992.DIABETES_DS_IMP_NEW_DEMO;
LABEL Age_less_than_40_encoded = 'Encoded Age Less Than 40'
	  Age_40_to_49_encoded = 'Encoded Age 40-49'
	  Age_50_to_59_encoded = 'Encoded Age 50-59'
	  Age_more_than_60_encoded = 'Encoded Age More Than 60';
RUN;

/* STEP 6b: Display of Labelled Encoded Variable */

PROC SQL;

TITLE1 'Display of Labelled Encoded Variable';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_NEW_DEMO;

QUIT;

/**************************************************/

/*~~~~~~~~~~~ CHAPTER 7: Data Dictionary ~~~~~~~~~~~*/

/* Data Dictionary */
TITLE1 'Data Dictionary';

PROC CONTENTS DATA = DMFT4992.DIABETES_DS_IMP_NEW;
RUN;

/* Dictionary Table */

PROC SQL;

DESCRIBE TABLE DMFT4992.DIABETES_DS_IMP_NEW;

QUIT;


