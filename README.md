# Calculating a national Living Planet Index for South Africa

This repository contains the code and data to replicated the results from the manuscript:

* Buschke, F.T. & von Staden, L. (In preparation). The South African Living Planet Index shows the value of a supposedly ‘uninformative’ indicator.

Its content was accurate as of 05 June 2024. For any enquiries, please contact `falko.buschk@gmail.com`.

## Required libraries

The code presented here  relies on the dedicated `rlpi (v0.1.0)` package for calculating the *Living Planet Index*. This code is not on the official CRAN repository, so it must be accessed and installed directly from the [rlpi GitHub repository](https://github.com/Zoological-Society-of-London/rlpi), which also requires the `devtools (v2.4.5.)` package. The code needed to install these packages is included in the R-scripts. 

**Note:** This code runs without error using R version `4.1.3` but users with more recent version have reported errors with the `create_infile` function in the `rlpi` package. Please refer to [rlpi GitHub repository](https://github.com/Zoological-Society-of-London/rlpi) should you have any difficulties installin the `rlpi` package. 

```
# Start by installing and loading 'devtools' package, which is needed to install the 'rlpi' package from GitHub
install.packages("devtools")
library(devtools)

# Install from main ZSL repository online
install_github("Zoological-Society-of-London/rlpi", dependencies=TRUE)

# Load the 'rlpi' package
library(rlpi)
```


## Guidance for use

The code is self-contained to replicate the results. However, the working directory must include the same directory stucture as included in this repository:

```
Working directory
└───SA
│   │   FW_SA.txt
│   │   MR_SA.txt
│   │   TR_SA.txt
│   │   Global_infile.txt
│   
└───Weighted_SA
│   └───Infiles
│       │   FW_infile.txt
│       │   MR_infile.txt
|       |   TR_infile.txt
│       │   Continental_infile.txt
|       |   Global_infile.txt
```



## Input data
### General data
Analyses were based on the 2022 public version of the [Living Planet Database](https://www.livingplanetindex.org/data_portal), which includes 32,680 population time-series from 4,923 species. We filtered this dataset to only include time-series from South Africa, resulting in a national dataset with 560 time-series from 244 species.

### Supplementary data
We supplemented information from the global dataset, by including high-quality census data from 13 provincial protected areas from the Free State Province. This included data of 184 populations from 27 species. **Population data for black and white rhinoceroses are excluded from the version of the dataset shared in this repository, because this information should remain confidential.**  

### Geographical distribution of population time-series data

<img src="https://github.com/falko-buschke/SA_LPI/blob/main/Figures/Fig1_Map.png" alt="Study Area" width="700"/>

## Taxonomic data biases

<img src="https://github.com/falko-buschke/SA_LPI/blob/main/Figures/Samples.png" alt="Data Bias" width="700"/>


## Distribution of year-on-year population changes

<img src="https://github.com/falko-buschke/SA_LPI/blob/main/Figures/Lambdas.png" alt="Year-on-year population changes" width="700"/>


## Calculating the national Living Planet Index

### Comparing ecological Realms
<img src="https://github.com/falko-buschke/SA_LPI/blob/main/Figures/LPI_Realms.png" alt="Ecological realms" width="900"/>

### Comparing weightings
<img src="https://github.com/falko-buschke/SA_LPI/blob/main/Figures/LPI_weightings.png" alt="Weightings" width="500"/>

### Comparing the addition of improved data
<img src="https://github.com/falko-buschke/SA_LPI/blob/main/Figures/LPI_enhancedData.png" alt="Improved data" width="500"/>
