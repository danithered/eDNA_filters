# Data and analysis for research article *Beyond the snail: Optimising eDNA capture and amplification for surveillance of swimmer’s itch*

This repository contains the data and statistical analyses supporting the research article Beyond the snail: Optimising eDNA capture and amplification for surveillanc

## Contributors

### Data collection and laboratory analyses

  - Jan Procházka
  - Zikmund Bartoníček
  - Roman Leontovyč
  - Tomáš Macháček
  
### Data analysis

  - Amira Vörös
  - Dániel Vörös

## Repository contents

  - `stat.Rmd`: Contains all statistical analyses reported in the article, together with additional model diagnostics.
  - `data.tsv`: Contains the dataset in a .tsv format (separator: tabulator, with header, no row numbers, strings quoted with double quotes).
  
## Data description

Each row represents an individual parasite detection measurement. The dataset contains the following variables:

    - `location`: Abbreviation of the lake (see in the associated paper), where the water and snails were sampled. 
    - `date`: Sampling date in YY-MM-DD format.
    - `season`: Sampling season ("spring", "summer", "autumn")
    - `filter`: Filter type ("A" - Sterivex PVDF 0.45 μm; "B" - Sylphium Dual Filter Capsule 0.45 μm; "C"" - Sylphium Dual Filter Capsule 5 μm)
    - `replication`: Filter replicate identifier (replicates obtained from the same barrel using the same filter type).
    - `volume`: Volume of water filtered.
    - `turbidity`: Water turbidity measured at the sampling locations.
    - `method`: Method of parasite detection: either the molecular detection method ("qPCR", "LAMP", "RAA") or "snail" cercaria shedding.
    - `presence`: Binary indicator of parasite detection (present/absent).
    - `barrelId`: Identifier of the original water sample collected from the lake, based on the combination of `location` and `season`.
    
## Running the analyses

  - Install dependencies (see the Reproducibility section)
  - Clone the repository `git clone git@github.com:danithered/eDNA_filters.git`
  - Navigate to repository directory `cd /path/to/eDNA_filters`
  - Compile report `quarto render stat.Rmd`
  - Open the generated report in a web browser (stat.html) or in a pdf viewer (stat.pdf)

## Reproducibility

The analyses were performed using the following software environment.

```
R version 4.6.2 (2026-10-29)
Platform: x86_64-pc-linux-gnu
Running under: Ubuntu 26.04.1 LTS

other attached packages:
 [1] ggExtra_0.11.0      kableExtra_1.4.1    effects_4.2-5       multcompView_0.1-12 MuMIn_1.48.19       ggplot2_4.0.3       car_3.1-5          
 [8] carData_3.0-6       emmeans_2.0.3       DHARMa_0.4.7        tidyr_1.3.2         dplyr_1.2.1         multcomp_1.4-30     TH.data_1.1-5      
[15] MASS_7.3-66         survival_3.8-12     mvtnorm_1.3-7       glmmTMB_1.1.14
```

and compiled with `Quarto version 1.11.9`.

For reproducibility, the analyses should ideally be run using the same software versions. Differences in R or package versions may lead to minor differences in numerical results or graphical output.
