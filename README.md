# Data and analysis for research article *Beyond the snail: Optimising eDNA capture and amplification for surveillance of swimmer’s itch*

## General

Data collection and laboratory analyses were conducted by

  - Jan Procházka
  - Zikmund Bartoníček
  - Roman Leontovyč
  - Tomáš Macháček

## Files

  - `stat.Rmd`: includes all the statistical analyses reported in the article and additional diagnostics
  - `data.tsv`: all the data in a .tsv format (separator: tabulator, with header, no row numbers, strings quoted with double quotes). The columns:
    - `location`: the abbreviation of the lake (see in the associated paper), where the water and snails were sampled 
    - `date`: the date of the sampling in a YY-MM-DD format
    - `season`: the season of the sampling
    - `filter`: filter type code (A: Sterivex PVDF 0.45 μm, B: Sylphium Dual Filter Capsule 0.45 μm, C: Sylphium Dual Filter Capsule 5 μm filters)
    - `replication`: 
    - `volume`
    - `turbidity`
    - `amplificance_method`
    - `presence`
    - `samplingId`

## Reproducibility

The code was run in the following environment: 

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

