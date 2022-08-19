/************************************************
Name of DS: MAY LI
Name of SAS program: Part1.sas
Description: P1
Date first written: Thu, 11-Nov-2021
Date last updated: Wed, 24-Nov-2021
Library name: DMFT4992
*************************************************/

/*8.1 - Analysis of Variables Found in Dataset – DIABETES_DS*/
TITLE1 'Structure Display of DIABETES_DS Dataset';
TITLE2 '(Data Dictionary)';
FOOTNOTE '-----END-----';

PROC CONTENTS DATA = DMFT4992.DIABETES_DS;
RUN;

/**************************************************/

/*8.2 - Univariate Analysis on Categorical Variables*/
/*Categorical Variable 1 - Age*/
TITLE 'Univariate Analysis of Categorical Variable - Age';
PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE Age;
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBAR Age;
TITLE1 'Frequency of Age Ranges in DIABETES_DS';
RUN;

/**************************************************/

/*Categorical Variable 2 - Alcohol*/
TITLE 'Univariate Analysis of Categorical Variable - Alcohol';
PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE Alcohol;
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBAR Alcohol;
TITLE 'Frequency of Alcohol Consumptions in DIABETES_DS';
RUN;

/**************************************************/

/*Categorical Variable 3 - BPLevel*/
TITLE 'Univariate Analysis of Categorical Variable - BPLevel';
PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE BPLevel;
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBAR BPLevel;
TITLE 'Frequency of Blood Pressure Levels in DIABETES_DS';
RUN;

/**************************************************/

/*Categorical Variable 4 - Diabetic*/
TITLE 'Univariate Analysis of Categorical Variable - Diabetic';
PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE Diabetic;
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBAR Diabetic;
TITLE 'Number of Participants with Diabetes in DIABETES_DS';
RUN;

/**************************************************/

/*Categorical Variable 5 - Family_Diabetes*/
TITLE 'Univariate Analysis of Categorical Variable - Family_Diabetes';
PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE Family_Diabetes;
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBAR Family_Diabetes;
TITLE 'Number of Participants with Diabetic Family History in DIABETES_DS';
RUN;

/**************************************************/

/*Categorical Variable 6 - Gender*/
TITLE 'Univariate Analysis of Categorical Variable - Gender';
PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE Gender;
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBAR Gender;
TITLE 'Gender Frequency in DIABETES_DS';
RUN;

/**************************************************/

/*Categorical Variable 7 - JunkFood*/
TITLE 'Univariate Analysis of Categorical Variable - JunkFood';
PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE JunkFood;
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBAR JunkFood;
TITLE 'Frequency of Junk Food Consumptions in DIABETES_DS';
RUN;

/**************************************************/

/*Categorical Variable 8 - PhysicallyActive*/
TITLE 'Univariate Analysis of Categorical Variable - PhysicallyActive';
PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE PhysicallyActive;
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBAR PhysicallyActive;
TITLE 'Frequency of Time Being Physically Active Per Day in DIABETES_DS';
RUN;

/**************************************************/

/*Categorical Variable 9 - RegularMedicine*/
TITLE 'Univariate Analysis of Categorical Variable - RegularMedicine';
PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE RegularMedicine;
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBAR RegularMedicine;
TITLE 'Number of Participants with Regular Intake of Medicine in DIABETES_DS';
RUN;

/**************************************************/

/*Categorical Variable 10 - Smoking*/
TITLE 'Univariate Analysis of Categorical Variable - Smoking';
PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE Smoking;
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBAR Smoking;
TITLE 'Number of Participants with Smoking Habit in DIABETES_DS';
RUN;

/**************************************************/

/*Categorical Variable 11 - Stress*/
TITLE 'Univariate Analysis of Categorical Variable - Stress';
PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE Stress;
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBAR Stress;
TITLE 'Stress Frequency in DIABETES_DS';
RUN;

/**************************************************/

/*Categorical Variable 12 - UriationFreq*/
TITLE 'Univariate Analysis of Categorical Variable - UriationFreq';
PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE UriationFreq;
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBAR UriationFreq;
TITLE 'Urination Frequency in DIABETES_DS';
RUN;

/**************************************************/

/*Categorical Variable 13 - highBP*/
TITLE 'Univariate Analysis of Categorical Variable - highBP';
PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE highBP;
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBAR highBP;
TITLE 'Number of Participants with High Blood Pressure in DIABETES_DS';
RUN;

/**************************************************/

/*8.3 - Univariate Analysis on Continuous Variables*/
/*Continuous Variable 1 - BMI*/
PROC MEANS DATA = DMFT4992.DIABETES_DS N NMISS MIN MAX MEAN MEDIAN STD;
VAR BMI;
TITLE 'Univariate Analysis of Continuous Variable - BMI';
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
HISTOGRAM BMI;
TITLE 'Histogram of BMI Values in DIABETES_DS';
RUN;

/**************************************************/

/*Continuous Variable 2 - Pdiabetes*/
PROC MEANS DATA = DMFT4992.DIABETES_DS N NMISS MIN MAX MEAN MEDIAN STD;
VAR Pdiabetes;
TITLE 'Univariate Analysis of Continuous Variable - Pdiabetes';
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
HISTOGRAM Pdiabetes;
TITLE 'Histogram of Pdiabetes Values in DIABETES_DS';
RUN;

/**************************************************/

/*Continuous Variable 3 - Pregancies*/
PROC MEANS DATA = DMFT4992.DIABETES_DS N NMISS MIN MAX MEAN MEDIAN STD;
VAR Pregancies;
TITLE 'Univariate Analysis of Continuous Variable - Pregancies';
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
HISTOGRAM Pregancies;
TITLE 'Histogram of Pregnancies Numbers in DIABETES_DS';
RUN;

/**************************************************/

/*Continuous Variable 4 - Sleep*/
PROC MEANS DATA = DMFT4992.DIABETES_DS N NMISS MIN MAX MEAN MEDIAN STD;
VAR Sleep;
TITLE 'Univariate Analysis of Continuous Variable - Sleep';
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
HISTOGRAM Sleep;
TITLE 'Histogram of Sleeping Hours in DIABETES_DS';
RUN;

/**************************************************/

/*Continuous Variable 5 - SoundSleep*/
PROC MEANS DATA = DMFT4992.DIABETES_DS N NMISS MIN MAX MEAN MEDIAN STD;
VAR SoundSleep;
TITLE 'Univariate Analysis of Continuous Variable - SoundSleep';
RUN;
ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;
PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
HISTOGRAM SoundSleep;
TITLE 'Histogram of SoundSleep Hours in DIABETES_DS';
RUN;

/**************************************************/

/*8.4 - Bivariate Analysis on Categorical and Categorical Variables*/
/*8.4.1 - Bivariate Analysis on Alcohol vs Smoking*/
TITLE1 'Bivariate Analysis of Variables:';
TITLE2 'Alcohol (Categorical) vs Smoking (Categorical)';
FOOTNOTE '-----END-----';

PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE Alcohol * Smoking /
PLOTS = FREQPLOT( TWOWAY = STACKED SCALE = GROUPPCT );
RUN;

/**************************************************/

/*8.4.2 - Bivariate Analysis on Family_Diabetes vs Diabetic*/
TITLE1 'Bivariate Analysis of Variables:';
TITLE2 'Family_Diabetes (Categorical) vs Diabetic (Categorical)';
FOOTNOTE '-----END-----';

PROC FREQ DATA = DMFT4992.DIABETES_DS;
TABLE Family_Diabetes * Diabetic /
PLOTS = FREQPLOT( TWOWAY = STACKED SCALE = GROUPPCT );
RUN;

/**************************************************/

/*8.5 - Bivariate Analysis on Continuous and Categorical Variables*/
/*8.5.1 - Bivariate Analysis on BMI vs Gender*/
TITLE1 'Bivariate Analysis of Variables:';
TITLE2 'BMI (Continuous) vs Gender (Categorical)';

PROC MEANS DATA = DMFT4992.DIABETES_DS;
CLASS Gender; /*Categorical*/
VAR BMI; /*Continuous*/
RUN;

PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBOX BMI / CATEGORY = Gender;
/*LL X-AXIS CI Y-AXIS*/
TITLE 'Box Plots for Bivariate Analysis on BMI and Gender Variables';
RUN;

/**************************************************/

/*8.5.2 - Bivariate Analysis on Sleep vs Diabetic*/
TITLE1 'Bivariate Analysis of Variables:';
TITLE2 'Sleep (Continuous) vs Diabetic (Categorical)';

PROC MEANS DATA = DMFT4992.DIABETES_DS;
CLASS Diabetic; /*Categorical*/
VAR Sleep; /*Continuous*/
RUN;

PROC SGPLOT DATA = DMFT4992.DIABETES_DS;
VBOX Sleep / CATEGORY = Diabetic;
/*LL X-AXIS CI Y-AXIS*/
TITLE 'Box Plots for Bivariate Analysis on Sleep and Diabetic Variables';
RUN;

/**************************************************/

/*8.6 - Imputation of Missing Values Found in Variables*/
/*8.6.1 - Summary of Variables with Missing Values*/
TITLE 'Summary of Variables with Missing Values in DIABETES_DS';
FOOTNOTE '-----END-----';
PROC FORMAT;
VALUE $missfmt ' ' = 'Missing' others = 'Not missing';
VALUE missfmt . = 'Missing' others = 'Not missing';
RUN;

PROC FREQ DATA = DMFT4992.DIABETES_DS;
FORMAT _CHAR_ $missfmt.;
FORMAT _NUMERIC_ missfmt.;

TABLE _CHAR_ / missing nocum nopercent;
TABLE _NUMERIC_ / missing nocum nopercent;
RUN;

/**************************************************/

/*8.6.2 - Duplication of Original Dataset Before Missing Values Imputation*/
PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP AS 
SELECT * FROM DMFT4992.DIABETES_DS;

QUIT;

/**************************************************/

/*8.6.3 - Imputation of Missing Values Found in Categorical Variable - Diabetic*/
/*Step 1 - Before Imputation - Find Observations with Missing Values*/
PROC SQL;

TITLE1 'List of Observations with Missing Values in Diabetic Variable';
FOOTNOTE '-----END-----';
SELECT * FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( Diabetic IS MISSING ) OR 
		( Diabetic IS NULL ) OR 
		( Diabetic EQ ' ') );

QUIT;

PROC SQL;

TITLE1 'Number of Observations with Missing Values in Diabetic Variable';
FOOTNOTE '-----END-----';
SELECT COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( Diabetic IS MISSING ) OR 
		( Diabetic IS NULL ) OR 
		( Diabetic EQ ' ') );
		
QUIT;


/*Step 2 - Create a New Dataset to Store Diabetic Variable and Number of Participants*/
PROC SQL;

CREATE TABLE DMFT4992.DIABETES_DS_IMP_DIABETIC_MODE AS
SELECT Diabetic, COUNT(*) AS No_of_participants
FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( Diabetic IS NOT MISSING ) OR 
		( Diabetic IS NOT NULL ) OR 
		( Diabetic NE ' ') )
GROUP BY Diabetic;
		
QUIT;


/*Step 3 - Display Contents of Dataset DIABETES_DS_IMP_DIABETIC_MODE*/
PROC SQL;

TITLE1 'Contents in DIABETES_DS_IMP_DIABETIC_MODE Dataset';
FOOTNOTE '-----END-----';
SELECT *
FROM DMFT4992.DIABETES_DS_IMP_DIABETIC_MODE;
		
QUIT;


/*Step 4 - Impute Missing Values Found in Diabetic Variable*/
PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP
SET Diabetic = ( SELECT Diabetic
				 FROM DMFT4992.DIABETES_DS_IMP_DIABETIC_MODE
				 WHERE No_of_participants EQ ( SELECT MAX(No_of_participants) AS Diabetic_mode
							  				   FROM DMFT4992.DIABETES_DS_IMP_DIABETIC_MODE ) ) 
							  				   /*Sub-program to find highest number*/

WHERE ( ( Diabetic IS MISSING ) OR 
		( Diabetic IS NULL ) OR 
		( Diabetic EQ ' ') );
		
QUIT;


/*Step 5 - After Imputation - Find Observations with Missing Values*/
PROC SQL;

TITLE1 'List of Observations with Missing Values in Diabetic Variable';
FOOTNOTE '-----END-----';
SELECT * FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( Diabetic IS MISSING ) OR 
		( Diabetic IS NULL ) OR 
		( Diabetic EQ ' ') );

QUIT;

PROC SQL;

TITLE1 'Number of Observations with Missing Values in Diabetic Variable';
FOOTNOTE '-----END-----';
SELECT COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( Diabetic IS MISSING ) OR 
		( Diabetic IS NULL ) OR 
		( Diabetic EQ ' ') );
		
QUIT;

/**************************************************/

/*8.6.4 - Imputation of Missing Values Found in Continuous Variable - BMI*/
/*Step 1 - Before Imputation - Find Observations with Missing Values*/
PROC SQL;

TITLE1 'List of Observations with Missing Values in BMI Variable';
FOOTNOTE '-----END-----';
SELECT * FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( BMI IS MISSING ) OR 
		( BMI EQ . ) );

QUIT;

PROC SQL;

TITLE1 'Number of Observations with Missing Values in BMI Variable';
FOOTNOTE '-----END-----';
SELECT COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( BMI IS MISSING ) OR 
		( BMI EQ . ) );
		
QUIT;


/*Step 2 - Impute Missing Values Found in BMI Variable*/
PROC STDIZE DATA=DMFT4992.DIABETES_DS_IMP REPONLY

METHOD=MEAN OUT=DMFT4992.DIABETES_DS_IMP;
VAR BMI;

QUIT;


/*Step 3 - After Imputation - Find Observations with Missing Values*/
PROC SQL;

TITLE1 'List of Observations with Missing Values in BMI Variable';
FOOTNOTE '-----END-----';
SELECT * FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( BMI IS MISSING ) OR 
		( BMI EQ . ) );

QUIT;

PROC SQL;

TITLE1 'Number of Observations with Missing Values in BMI Variable';
FOOTNOTE '-----END-----';
SELECT COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( BMI IS MISSING ) OR 
		( BMI EQ . ) );
		
QUIT;

/**************************************************/

/*8.6.5 - Imputation of Missing Values Found in Continuous Variable - Pregancies*/
/*Step 1 - Before Imputation - Find Observations with Missing Values*/
PROC SQL;

TITLE1 'List of Observations with Missing Values in Pregancies Variable';
FOOTNOTE '-----END-----';
SELECT * FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( Pregancies IS MISSING ) OR 
		( Pregancies EQ . ) );

QUIT;

PROC SQL;

TITLE1 'Number of Observations with Missing Values in Pregancies Variable';
FOOTNOTE '-----END-----';
SELECT COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( Pregancies IS MISSING ) OR 
		( Pregancies EQ . ) );
		
QUIT;


/*Step 2 - Impute Missing Values Found in Pregancies Variable*/
PROC STDIZE DATA=DMFT4992.DIABETES_DS_IMP REPONLY

METHOD=MEDIAN OUT=DMFT4992.DIABETES_DS_IMP;
VAR Pregancies;

QUIT;


/*Step 3 - After Imputation - Find Observations with Missing Values*/
PROC SQL;

TITLE1 'List of Observations with Missing Values in Pregancies Variable';
FOOTNOTE '-----END-----';
SELECT * FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( Pregancies IS MISSING ) OR 
		( Pregancies EQ . ) );

QUIT;

PROC SQL;

TITLE1 'Number of Observations with Missing Values in Pregancies Variable';
FOOTNOTE '-----END-----';
SELECT COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( Pregancies IS MISSING ) OR 
		( Pregancies EQ . ) );
		
QUIT;


/**************************************************/

/*8.7 - Cleansing of Inconsistent Values Found in Variables of DIABETES_DS Dataset*/
/*8.7.1	- Summary of Variables with Inconsistent Values*/
TITLE 'Summary of Variables with Inconsistent Values in DIABETES_DS';
FOOTNOTE '-----END-----';
PROC FORMAT;
VALUE $missfmt ' ' = 'Missing' others = 'Not missing';
VALUE missfmt . = 'Missing' others = 'Not missing';
RUN;

PROC FREQ DATA = DMFT4992.DIABETES_DS;
FORMAT _CHAR_ $missfmt.;
FORMAT _NUMERIC_ missfmt.;

TABLE _CHAR_ / missing nocum nopercent;
TABLE _NUMERIC_ / missing nocum nopercent;
RUN;

/**************************************************/

/*8.7.2	Cleaning Inconsistent Values Found in Variable – RegularMedicine*/
/*Step 1 - Before Cleaning – Find Observations with Inconsistent Values*/
PROC SQL;

TITLE1 'List of Observations with Inconsistent Values in RegularMedicine Variable';
FOOTNOTE '-----END-----';
SELECT * FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( RegularMedicine NE 'no' ) AND
		( RegularMedicine NE 'yes' ) );

QUIT;

PROC SQL;

TITLE1 'Number of Observations with Inconsistent Values in RegularMedicine Variable';
FOOTNOTE '-----END-----';
SELECT COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( RegularMedicine NE 'no' ) AND
		( RegularMedicine NE 'yes' ) );
		
QUIT;


/*Step 2 - Replacing Inconsistent Values Found in RegularMedicine Variable*/
PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP
SET RegularMedicine = 'no'
WHERE RegularMedicine EQ 'o';
		
QUIT;


/*Step 3 - After Cleaning - Find Observations with Inconsistent Values*/
PROC SQL;

TITLE1 'List of Observations with Inconsistent Values in RegularMedicine Variable';
FOOTNOTE '-----END-----';
SELECT * FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( RegularMedicine NE 'no' ) AND
		( RegularMedicine NE 'yes' ) );

QUIT;

PROC SQL;

TITLE1 'Number of Observations with Inconsistent Values in RegularMedicine Variable';
FOOTNOTE '-----END-----';
SELECT COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( RegularMedicine NE 'no' ) AND
		( RegularMedicine NE 'yes' ) );
		
QUIT;

PROC SQL;

TITLE1 'Counts of Observations for Each Value Group in RegularMedicine Variable';
FOOTNOTE '-----END-----';
SELECT RegularMedicine, COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
GROUP BY RegularMedicine;

QUIT;

/**************************************************/

/*8.7.3 - Cleaning Inconsistent Values Found in Variable – BPLevel*/
/*Step 1 - Before Cleaning - Find Observations with Inconsistent Values*/
PROC SQL;

TITLE1 'List of Observations with Inconsistent Values in BPLevel Variable';
FOOTNOTE '-----END-----';
SELECT * FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( BPLevel NE 'high' ) AND
		( BPLevel NE 'normal' ) AND
		( BPLevel NE 'low' ) );

QUIT;

PROC SQL;

TITLE1 'Number of Observations with Inconsistent Values in BPLevel Variable';
FOOTNOTE '-----END-----';
SELECT COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( BPLevel NE 'high' ) AND
		( BPLevel NE 'normal' ) AND
		( BPLevel NE 'low' ) );
		
QUIT;


/*Step 2 - Replacing Inconsistent Values Found in BPLevel Variable*/
PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP
SET BPLevel = 'high'
WHERE BPLevel EQ 'High';
		
QUIT;

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP
SET BPLevel = 'low'
WHERE BPLevel EQ 'Low';
		
QUIT;


/*Step 3 - After Cleaning - Find Observations with Inconsistent Values*/
PROC SQL;

TITLE1 'List of Observations with Inconsistent Values in BPLevel Variable';
FOOTNOTE '-----END-----';
SELECT * FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( BPLevel NE 'high' ) AND
		( BPLevel NE 'normal' ) AND
		( BPLevel NE 'low' ) );

QUIT;

PROC SQL;

TITLE1 'Number of Observations with Inconsistent Values in BPLevel Variable';
FOOTNOTE '-----END-----';
SELECT COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
WHERE ( ( BPLevel NE 'high' ) AND
		( BPLevel NE 'normal' ) AND
		( BPLevel NE 'low' ) );
		
QUIT;

PROC SQL;

TITLE1 'Counts of Observations for Each Value Group in BPLevel Variable';
FOOTNOTE '-----END-----';
SELECT BPLevel, COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
GROUP BY BPLevel;

QUIT;

/**************************************************/

/*8.8 - Treatment for Error Encountered in Pdiabetes Variable*/
/*Step 1 - Summary of Values Within Pdiabetes Variable*/
PROC SQL;

TITLE1 'Counts of Observations for Each Value Group in Pdiabetes Variable';
FOOTNOTE '-----END-----';
SELECT Pdiabetes, COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
GROUP BY Pdiabetes;

QUIT;


/*Step 2 - Create A New Column - Pdiabetes_new Variable*/
PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP
ADD Pdiabetes_new CHAR(3);

QUIT;


/*Step 3 - Convert Values in Pdiabetes and Save in Pdiabetes_new*/
PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP
SET Pdiabetes_new = 'no'
WHERE Pdiabetes EQ 0;

QUIT;

PROC SQL;

UPDATE DMFT4992.DIABETES_DS_IMP
SET Pdiabetes_new = 'yes'
WHERE Pdiabetes EQ .;

QUIT;


/*Step 4 - Compare Values in Pdiabetes & Pdiabetes_new Variables*/
PROC SQL;

TITLE1 'Counts of Observations for Each Value Group in Pdiabetes and Pdiabetes_new Variables';
FOOTNOTE '-----END-----';
SELECT Pdiabetes, Pdiabetes_new, COUNT(*) Label 'Number of Observations'
FROM DMFT4992.DIABETES_DS_IMP
GROUP BY Pdiabetes, Pdiabetes_new;

QUIT;


/*Step 5 - Remove Old Column – Pdiabetes Variable*/
PROC SQL;

ALTER TABLE DMFT4992.DIABETES_DS_IMP
DROP COLUMN Pdiabetes;

QUIT;


/*Step 6 - Display Updated Structure of DIABETES_DS_IMP Dataset*/
TITLE1 'Structure Display of DIABETES_DS_IMP Dataset';
TITLE2 '(Data Dictionary)';
FOOTNOTE '-----END-----';

PROC CONTENTS DATA = DMFT4992.DIABETES_DS_IMP;
RUN;

/**************************************************/














