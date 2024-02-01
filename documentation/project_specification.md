<img src="../images/TU_logo_large.png" alt="TU logo" width="200" align="right"/>

# Project Specification

**Specification date**: 1st February 2024

**Analyst**: [Simon Wickham](https://github.com/SiWickham)

**QA analyst**: [Andy Wilson](https://github.com/ASW-Analyst)

**Internal Project Reference**: L00721a CMAST CYP Alliance

## Requirements

Analytics are supporting the delivery lead for the [CMAST](https://www.cheshireandmerseyside.nhs.uk/your-health/provider-collaboratives/cmast/) project through a review of attendances at Emergency Departments (ED) across the Cheshire and Mersey ICB. The system is interested in understanding the pressures associated with Paediatric mental health attendances in the ED and how this translates to admissions into acute beds. Analysis will be undertaken to review changes in ED attendances since April 2019 across the ICB. This will be considered at an ICB level, provider and site level.

## Timeline
| Task                             | Date       |
|:---------------------------------|-----------:|
| Specification                    | 01/02/2024 |
| Data extraction                  | 01/02/2024 |
| Data quality investigation       | 01/02/2024 |
| ED attendances                   | 02/02/2024 |
| QA and review                    | 05/02/2024 |
| Review by Delivery Lead          | 06/02/2024 |
| Feedback response                | 07/02/2024 |
| Final deliverable                | 09/02/2024 |

## Assumptions and Criteria

Our key assumptions and criteria for this analysis include:

* The analysis will use the [NHS England definition](https://github.com/nhsengland/MHSDS/blob/master/UEMH%20dashboard/ECDS%20Crisis) for mental health related attendance in ED. This is based on already identified SNOMED codes.

* All Department Types will be included.

* The cohort of patients, children and young people, are aged 17 or younger on the date of arrival to ED.

* The period of interest is 1st April 2019 to 31st December 2023 (inclusive).

* The organisations of interest are:
  
  * Alder Hey Children's NHS Foundation Trust
  * Countess Of Chester Hospital NHS Foundation Trust
  * East Cheshire NHS Trust
  * Liverpool University Hospitals NHS Foundation Trust
  * Mersey and West Lancashire Teaching Hospitals NHS Trust
  * Mid Cheshire Hospitals NHS Foundation Trust
  * Warrington And Halton Teaching Hospitals NHS Foundation Trust
  * Wirral University Teaching Hospital NHS Foundation Trust

## Data source
The data used will be the SUS Emergency Care data set.

## Analysis Outputs
There are a few facets to the analysis that will be undertaken. These are:

**System level**:

* Attendances per month since Apr-2019
  * Attendances per month in hours
  * Attendances per month out of hours
* Attendances per hour per day across the time period
  * Attendances per hour per day per financial year
* Waiting Time summary statistics and distribution since Apr-2019
  * Waiting Times each month since Apr-2019
  * Waiting Times per hour per day per financial year
* Outcomes from ED: proportion of attendances admitted since Apr-2019
  * Proportion per month

**Site level**:

* Attendances per month since Apr-2019
  * Attendances per month in hours
  * Attendances per month out of hours
  * Attendances per month per ED type
* Attendances per hour per day across the time period
  * Attendances per hour per day per financial year
  * Attendances per hour per day per financial year per ED type
* Waiting Time summary statistics and distribution since Apr-2019
  * Waiting Times each month since Apr-2019
  * Waiting Times per hour per day per financial year
* Outcomes from ED: proportion of attendances admitted since Apr-2019
  * Proportion per month

**Data Quality**:
Additional Data Quality analysis will be undertaken to identify any sites or time periods that should be excluded from the analysis. There will also be an analysis of potential _missing_ attendances that can't be identified where the _Chief Complaint_, _Injury Intent_ and _Diagnoses_ are missing.

The final output of the analysis will be an `.html` file that will be knitted via an `output.rmd` script. This will contain relevant visualisations, tables and commentary on the findings.
