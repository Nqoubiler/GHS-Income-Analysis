libname mylib base "/home/u62196846/STAT395/Final Project";

proc IMPORT datafile="/home/u62196846/STAT395/Final Project/GHS Data.xlsx" 
		DBMS=XLSX out=mylib.projectData(KEEP=LAB_SALARY_HH prov FIN_EXP FIN_INC_MAIN 
		HWL_STATUS) replace;
run;

DATA mylib.cleaned;
	/*Cleaning data set to include only those whose monthly salary is greater than zero and to exclude all non responses
	we also created a variable to use for proportion*/
	SET mylib.projectdata;

	IF(fin_inc_main=1);

	if (fin_exp<13);

	if (lab_salary_hh>0);

	If (lab_salary_hh<4500) then
		prop=1;
	else
		prop=0;
RUN;

/*pilot study for the survey we chose 1% of the population

below we also have data cleaning steps that we did */
title "Pilot study for Household Monthly Salary";

proc surveyselect data=mylib.cleaned 
		seed=202402
		method=srs
		sampsize=427
		out=mylib.pilotresult
		stats;
run;

title "Pilot study estimates for Household Monthly Salary ";
		
proc surveymeans data=mylib.pilotresult
		total=8536
		mean clm clsum sum ;
		var lab_salary_hh;
		weight samplingWeight;
run;

/* trying to find the standard deviation of salary to help determine our sample size, 
we need to know how much the data varies in terms of monthly salary because the sample size
is so much dependent on the standard deviation if our data varies too much then we need a large sample size
so that we minimize our error thus putting more confidence in our results */

proc means data=mylib.pilotresult;
run;
		
/*so after careful considerations we dicidecid that our error should be 25 000 
so after seeing how much our data varies and how much can our project tolerate in terms of error
we saw that an error of 25 000 maximizes our sample size decided consideratio minimize
*/


/* After doing the calculation we found our sample size to be 2867. 
We know that using a larger sample size,gives us more accurate estimations,
 considerationso we have chosen to use a sample size of 2900.*/


/* we will now conduct our main study using a sample size of 2900*/

Title "Simple Random Sampling of Household Monthly Salary With Replacement";

proc surveyselect data=mylib.cleaned 
		seed=202402
		method=urs
		sampsize=2900
		out=mylib.srswr
		outhits
		stats;
run;

Title "Estimated Mean, Total and Proportion of Household Monthly Salary in South Africa (SRSWR)";

proc surveymeans data=mylib.srswr
		total=8536
		mean clm clsum sum ;
		var lab_salary_hh prop;
		weight samplingWeight;
run;

Title "Simple Random Sampling of Household Monthly Salary Without Replacement";

proc surveyselect data=mylib.cleaned 
		seed=202402
		method=srs
		sampsize=2900
		out=mylib.srs
	
		stats;
run;

Title "Estimated Mean, Total and Proportion of Household Monthly Salary in South Africa (SRS)";

proc surveymeans data=mylib.srs
		total=8536
		mean clm clsum sum ;
		var lab_salary_hh prop;
		weight samplingWeight;
run;

proc sort data=mylib.cleaned
out=mylib.StrataData;
by fin_exp;
run;

proc freq data=mylib.StrataData;

table fin_exp/out =mylib.StrSize(rename=(count=_total_));

run;


Title "Stratified Sampling of Household Monthly Salary";

proc surveyselect data=mylib.StrataData 
		seed=202402
		method=srs
		sampsize=(1 3 8 49 120 196 309 803 687 459 206 59)
		out=mylib.stratum
		stats;
		strata fin_exp;
run;

Title "Estimated Mean, Total and Proportion of Household Monthly Salary in South Africa (Stratification)";

proc surveymeans data=mylib.stratum
		total=mylib.strsize
		mean clm clsum sum ;
		var lab_salary_hh prop;
		strata fin_exp;
		weight samplingWeight;
run;

Title "Cluster Sampling of Household Monthly Salary";

proc surveyselect data=mylib.cleaned  
		seed=202402
		method=srs
		sampsize=4
		out=mylib.cluster
		stats;
		samplingunit prov;
run;

Title "Estimated Mean, Total and Proportion of Household Monthly Salary in South Africa (Clustering)";

proc surveymeans data=mylib.cluster
		total=9
		mean clm clsum sum ;
		var lab_salary_hh prop;
		cluster prov;
		weight samplingWeight;
run;
