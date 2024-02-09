<img src="images/TU_logo_large.png" alt="TU logo" width="200" align="right"/>

# CMAST Paediatric Mental Health Analysis
This repository contains the codebase for undertaking analysis to examine the activity, waiting times and associated bed pressures for mental health related attendances of paediatric patients at [CMAST](https://www.cheshireandmerseyside.nhs.uk/your-health/provider-collaboratives/cmast/) providers.

<br/>

## Using the Repository
The repository can be cloned to repeat all of the analysis contained in the `.rmd` outputs. The section below detailing the structure of the repository explains the organisation of the code and how to run this. This analysis has been undertaken in the R programming language so of particular note the user will require the packages listed within the `packages.R` script within the `requirements` folder to be installed.

<br/>

## Repository Structure

The current structure of the repository is detailed below:

``` plaintext

├───data
├───documentation
├───images
└───src
    ├───config
    ├───load
      └───sql_extracts
    ├───outputs
    ├───processing
    ├───requirements
    └───visualisation
    
```
<br/>

### `data`
This folder will contain any relevant data files extracted via the `sql_extracts` scripts.

### `documentation`
This folder contains the project documentation such as the specification.

### `images`
This folder contains all images used in the outputs or repository such as the TU logo.

### `src`
All code is stored within the `src` folder. This is then divided into:

1. `config`: Themes for configuring the outputs of the analysis are saved here.
2. `load`: Scripts for loading ECDS data for analysis.
3. `outputs`: Scripts for rendering the outputs of the analysis are saved within here.
4. `processing`: Scripts for processing the ECDS data to create additional flags and create intermediary data frames are saved here.
5. `requirements`: Requirements for running the analysis and creating outputs such as the `packages.R` script are saved here.
6. `visualisation`: Scripts for producing visualisations used in the outputs of the analysis are saved here.

<br/>

## Contributors

This repository has been created and developed by:
- [Andy Wilson](https://github.com/ASW-Analyst)
- [Simon Wickham](https://github.com/SiWickham)
