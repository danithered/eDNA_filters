# Data and analysis for research article *Beyond the snail: Optimising eDNA capture and amplification for surveillance of swimmer’s itch*

This repository contains the data and statistical analyses supporting the research article *Beyond the snail: Optimising eDNA capture and amplification for surveillance of swimmer’s itch*

[![DOI](https://zenodo.org/badge/1443135170.svg)](https://doi.org/10.5281/zenodo.24197082)

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

  - `stat.Rmd`: Contains all GLMMs reported in the article, together with additional model diagnostics.
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
R version 4.6.1 (2026-06-24 ucrt)
Platform: x86_64-w64-mingw32/x64
Running under: Windows 11 x64 (build 26200)

Matrix products: default
  LAPACK version 3.12.1

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] kableExtra_1.4.1    effects_4.2-5       multcompView_0.1-12 MuMIn_1.48.19       ggplot2_4.0.3       car_3.1-5           carData_3.0-6      
 [8] emmeans_2.0.4       DHARMa_0.5.0        tidyr_1.3.2         dplyr_1.2.1         multcomp_1.4-32     TH.data_1.1-5       MASS_7.3-65        
[15] survival_3.8-6      mvtnorm_1.4-2       glmmTMB_1.1.14     

loaded via a namespace (and not attached):
 [1] tidyselect_1.2.1    Exact_3.3           viridisLite_0.4.3   rootSolve_1.8.2.4   farver_2.1.2        S7_0.2.2            fastmap_1.2.0      
 [8] digest_0.6.39       estimability_2.0.0  lifecycle_1.0.5     lmom_3.3            magrittr_2.0.5      compiler_4.6.1      rlang_1.3.0        
[15] tools_4.6.1         yaml_2.3.12         data.table_1.18.4   knitr_1.51          xml2_1.6.0          plyr_1.8.9          RColorBrewer_1.1-3 
[22] abind_1.4-8         expm_1.0-0          withr_3.0.3         purrr_1.2.2         numDeriv_2016.8-1.1 nnet_7.3-20         grid_4.6.1         
[29] stats4_4.6.1        colorspace_2.1-3    xtable_1.8-8        e1071_1.7-17        scales_1.4.0        insight_1.5.2       survey_4.5         
[36] cli_3.6.6           rmarkdown_2.31      reformulas_0.4.4    generics_0.1.4      otel_0.2.0          rstudioapi_0.19.0   httr_1.4.8         
[43] tzdb_0.5.0          readxl_1.6.0        gld_2.6.8           DBI_1.3.0           minqa_1.2.8         proxy_0.4-29        stringr_1.6.0      
[50] splines_4.6.1       cellranger_1.1.0    mitools_2.7         vctrs_0.7.3         boot_1.3-32         Matrix_1.7-5        sandwich_3.1-3     
[57] hms_1.1.4           Formula_1.2-6       systemfonts_1.3.2   glue_1.8.1          nloptr_2.2.1        codetools_0.2-20    stringi_1.8.7      
[64] gtable_0.3.6        lme4_2.0-6          tibble_3.3.1        pillar_1.11.1       htmltools_0.5.9     R6_2.6.1            TMB_1.9.23         
[71] textshaping_1.0.5   Rdpack_2.6.6        evaluate_1.0.5      lattice_0.22-9      haven_2.5.5         readr_2.2.0         rbibutils_2.4.1    
[78] class_7.3-23        DescTools_0.99.60   Rcpp_1.1.2          svglite_2.2.2       coda_0.19-4.1       nlme_3.1-169        mgcv_1.9-4         
[85] xfun_0.60           fs_2.1.0            zoo_1.9-0           forcats_1.0.1       pkgconfig_2.0.3 
```

and compiled with `Quarto version 1.11.9`.

For reproducibility, the analyses should ideally be run using the same software versions. Differences in R or package versions may lead to minor differences in numerical results or graphical output.
