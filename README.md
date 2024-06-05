# Calculating a national Living Planet Index for South Africa

This repository contains the code and data to replicated the results from the manuscript:

* Buschke, F.T. & von Staden, L. (In preparation). The South African Living Planet Index shows the value of a supposedly ‘uninformative’ indicator.

Its content was accurate as of 05 June 2024. For any enquiries, please contact `falko.buschk@gmail.com`.

## Required libraries

The code presented here relies on the dedicated `rlpi (v0.1.0)` package for calculating the *Living Planet Index*. This code is not on the official CRAN repository, so it must be accessed and installed directly from the [rlpi GitHub repository](https://github.com/Zoological-Society-of-London/rlpi), which also requires the `devtools (v2.4.5.)` package. The code needed to install these packages is included in the R-scripts. 

**Note:** This code runs without error using R version `4.1.3` but users with more recent version have reported errors with the `create_infile` function in the `rlpi` package. Please refer to [rlpi GitHub repository](https://github.com/Zoological-Society-of-London/rlpi) should you have any difficulties installing the `rlpi` package. 

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

The code is self-contained to replicate the results. However, the working directory must include the same directory structure as included in this repository:

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
The `rlpi` code reads information on the weightings from the text files, and saves intermediate results is the pre-assigned folders. The code should work as long as the sub-directory structure is maintained.


## Input data
### General data
Analyses were based on the 2022 public version of the [Living Planet Database](https://www.livingplanetindex.org/data_portal), which includes 32,680 population time-series from 4,923 species. We filtered this dataset to only include time-series from South Africa, resulting in a national dataset with 560 time-series from 244 species.

### Supplementary data
We supplemented information from the global dataset, by including high-quality census data from 13 provincial protected areas from the Free State Province. This included data of 184 populations from 27 species. **Population data for sensitive species are excluded from the version of the dataset shared in this repository, because this information remains confidential.**  

### Geographical distribution of population time-series data

<img src="https://github.com/falko-buschke/SA_LPI/blob/main/Figures/Fig1_Map.png" alt="Study Area" width="700"/>

*The localities of time-series information from the Living Planet Database in South Africa, disaggregated by taxonomic group (coloured circles), and the locations of 12 protected areas (white circles) with supplemental mammal census data, which were used to examine how adding high-quality population data affected the Living Planet Index.  Inset: the Prince Edward Islands (Marion Island, south, and Prince Edward Island, north) two uninhabited islands in the sub-Antarctic Indian Ocean that are part of South Africa.*

## Taxonomic data biases
The script in `SampleBias.R` is to replicate a stacked bar charts showing the number of population time-series and species in the datasets, disaggregated by ecological realm and taxonomic class. (**Figure 2** in the manuscript). 

This is a standalone script without any dependencies.

<img src="https://github.com/falko-buschke/SA_LPI/blob/main/Figures/Samples.png" alt="Data Bias" width="700"/>

*The number of sampled populations (a) and species (b) from South Africa in the Living Planet Database, disaggregated by ecological realm and taxonomic group.* 

## Distribution of year-on-year population changes

The script `PopulationTrends.R` replicates the histogram and boxplot that compare the cumulative year-on-year population changes (Cumulative $\lambda$ ), shown in **Figure 3** in the manuscript.

This script relies on data saved in the file `Lambdas.csv`.

<img src="https://github.com/falko-buschke/SA_LPI/blob/main/Figures/Lambdas.png" alt="Year-on-year population changes" width="700"/>

*The distribution of cumulative year-on-year changes in populations (Cumulative $\lambda$) disaggregated by ecological realm (a) and taxonomic group (b). **a**. A single distribution of cumulative $\lambda$, where the frequency of species is summed across ecological realms. **b**. Each point represents the cumulative $\lambda$ for a single species, with boxplot showing the median, interquartile range, and minimum and maximum values (excluding outliers identified as more than 1.5 times the interquartile range).*


## Calculating the national Living Planet Index

The scripts to replicate all the analyses for the national Living Planet Index for South Africa is contained in a single annotated file: `SA_LPI_ms.R`. 

These scripts call on population time-series data saved in files (formatted according to the standard of the [Living Planet Database](https://www.livingplanetindex.org/data_portal)):
* `LPD2022_public_SA.csv`
* `LPD2022_public_SA_enhanced_redacted.csv`

The outputs of these scripts are the following figures.

### Comparing ecological Realms
<img src="https://github.com/falko-buschke/SA_LPI/blob/main/Figures/LPI_Realms.png" alt="Ecological realms" width="900"/>

*The South Africa Living Planet Index (LPI) for each ecological realm separately. Terminal values represent the cumulative change relative to a baseline of 1 in 1970.*

### Comparing weightings
<img src="https://github.com/falko-buschke/SA_LPI/blob/main/Figures/LPI_weightings.png" alt="Weightings" width="500"/>

*The South Africa Living Planet Index (LPI) for each ecological realm separately. Terminal values represent the cumulative change relative to a baseline of 1 in 1970.*

### Comparing the addition of improved data
<img src="https://github.com/falko-buschke/SA_LPI/blob/main/Figures/LPI_enhancedData.png" alt="Improved data" width="500"/>

*The South Africa Living Planet Index comparing time-series from the global Living Planet Database (green) and an enhanced dataset that supplements global information with high-quality time-series from an aerial census of mammals in provincial protected areas. Terminal values represent the cumulative change relative to a baseline of 1 in 1970.*
