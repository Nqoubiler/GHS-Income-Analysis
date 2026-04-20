This project involved a statistical analysis of South African household income data using the General Household Survey (GHS) to estimate national salary indicators and evaluate the performance of different probability sampling techniques.

Using SAS, I applied survey sampling methods to produce reliable estimates that can support government planning, poverty reduction strategies, and socio-economic decision-making.

Completed as part of the STAT395 final project at the University of KwaZulu-Natal.

---

## Project Objective

The purpose of this analysis was to answer key economic questions:

- What is the estimated average household monthly salary in South Africa?
- What proportion of households earn below the poverty threshold of **R4,500** per month?
- What is the estimated total monthly household salary generated nationally?
- Which sampling method provides the most precise and reliable estimates?

---

## Dataset Summary

### Source:
South African General Household Survey (GHS)

### Main Variable:

- `LAB_SALARY_HH` – Household Monthly Salary

### Additional Variables Used:

- `FIN_INC_MAIN` – Main source of income filter
- `PROP` – Indicator for households earning below R4,500
- `FIN_EXP` – Household expenditure used for stratification
- `PROV` – Province used as cluster unit

---

## Data Preparation Performed

Before analysis, data was cleaned and prepared by:

- Removing zero salary values where contextually invalid
- Filtering households whose main income source was salary
- Creating binary poverty indicator (< R4,500)
- Structuring variables for sampling design

This ensured cleaner estimates and stronger statistical validity.

---

## Sampling Techniques Applied

### 1. Simple Random Sampling (SRS)

- With replacement
- Without replacement

### 2. Stratified Sampling

Used household monthly expenditure groups to improve estimate precision.

### 3. Cluster Sampling

Used provinces as natural cluster units.

---

## SAS Tools Used

- PROC IMPORT
- PROC SURVEYSELECT
- PROC SURVEYMEANS
- PROC FREQ
- PROC MEANS
- DATA STEP

---

## Key Results (Best Method: Stratified Sampling)

### Estimated Average Household Salary

**R19,547**

95% Confidence Interval:  
R13,912 – R25,182

### Estimated Total Monthly Household Salary

**R166,854,997**

95% Confidence Interval:  
R118.75M – R214.96M

### Households Earning Below R4,500

**33.3% of households**

95% Confidence Interval:  
32.2% – 34.4%

---

## Analytical Insights

### Poverty Indicator

Approximately **1 in 3 households** earn below R4,500 monthly, highlighting significant financial vulnerability and the need for targeted support.

### National Income Estimate

Total monthly salary estimates provide useful indicators for:

- Consumer spending potential
- Tax base estimation
- GDP contribution modelling
- Labour market evaluation

### Method Comparison

Stratified sampling produced the narrowest confidence intervals, meaning higher precision and lower sampling variability than SRS and cluster sampling.

---

## Practical Recommendations

Government departments, economists, and policy planners could use these findings to:

- Target poverty relief programs toward low-income households
- Use expenditure-based stratification in future national surveys
- Improve allocation of provincial resources
- Monitor income inequality trends over time
- Support tax and economic forecasting models

---

## Skills Demonstrated

- Survey Sampling Techniques
- Stratified Sampling
- Cluster Sampling
- Statistical Inference
- Confidence Intervals
- Poverty Analysis
- Socio-Economic Analytics
- SAS Programming
- Data Cleaning
- Policy-Focused Reporting

---

## Why This Project Matters

This project demonstrates my ability to work with real national survey data, apply advanced sampling methodologies, compare estimation accuracy, and translate results into practical recommendations for economic and policy decision-making.

---

## Author

Nqobile Sithole  
BSc Data Science Graduate  
Statistics & Computer Science  
University of KwaZulu-Natal
