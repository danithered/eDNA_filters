library(readxl)
library(dplyr)
library(tidyr)
library(xlsx)

fn <- "~/data/work/projects/eDNA_filters/GLMM.xlsx"

#### read in data ####
data <- read_excel(fn, sheet=1, col_names = F)

#### Colors in sheet 1 ####
wb     <- loadWorkbook(fn)
sheet1 <- getSheets(wb)[[1]]

# get all rows
rows  <- getRows(sheet1)
cells <- getCells(rows)
styles <- sapply(cells, getCellStyle)
cellColor <- function(style) {
  tryCatch({
    fg <- style$getFillForegroundXSSFColor()
    
    if (is.null(fg)) {
      return(NA_character_)
    }
    
    # Extract RGB bytes
    rgb <- fg$getRgb()
    
    if (is.null(rgb)) {
      # Try the ARGB hexadecimal representation instead
      argb <- fg$getARGBHex()
      
      if (is.null(argb)) {
        return(NA_character_)
      }
      
      return(as.character(argb))
    }
    
    # Convert Java signed bytes to unsigned integers
    rgb <- as.integer(rgb)
    rgb[rgb < 0] <- rgb[rgb < 0] + 256L
    
    paste(sprintf("%02X", rgb), collapse = "")
  }, error = function(e) NA_character_)
}

cols <- sapply(styles, cellColor)
cols <- strsplit(names(cols), ".", fixed=T) |>
  do.call(rbind, args=_) |>
  as.data.frame() |>
  cbind(cols) |>
  setNames(c("row", "col", "color")) #|>
#filter(color != 64)
cols$col <- as.numeric(cols$col)
cols$row <- as.numeric(cols$row)


#### Add colors ####
cn <- unlist(data[2,])

data$prez_snail_1 <- 
cols |> 
  filter(col == 1, row <= nrow(data)) |>
  select(color) |> unlist()

#### Colnames ####

data[1,]
cn[6:8] <- paste0("prez_qPCR_", 1:3)
cn[9:11] <- paste0("prez_LAMP_", 1:3)
cn[12:14] <- paste0("prez_RAA_", 1:3)
colnames(data)[1:17] <- cn

data <- data[-2:-1,]

#### Transforamtions ####
data <- data[,-15]

data |>
 mutate(prez_snail_1 = replace_values(
   prez_snail_1, 
   from=c("D9EAD3", "F4CCCC"), 
   to  =c("1","0")
   ))  |>
  mutate(
    date = date |>
      as.integer() |> as.character() |>
      lapply(function(x){ paste(substr(x, 1, 2), substr(x, 3, 4), substr(x, 5, 6), sep="/") }) |> unlist() |>
      as.Date(),
    rep. = as.numeric(rep.),
    season = as.character(as.integer(season)),
    turbidity = as.numeric(turbidity)
  ) |>
  mutate(across(starts_with("prez_"), as.numeric )) |>
  mutate(across(starts_with("prez_"), as.logical )) |>
  pivot_longer(starts_with("prez_"), 
               names_sep = "_", names_to = c("del", "amplificance_method", "ampl_rep"),
               values_to = "presence") |>
  rename(location = loc., replication = rep.) |>
  select(!del & !ampl_rep) |>
  mutate(samplingId = paste0(location, date)) |>
  mutate(season = replace_values(season,
                                 from = as.character(1:3), 
                                 to = c("spring", "summer", "autumn"))) -> data2

#### Second table ####
env <- read_excel(fn, sheet=2, col_names = T)

env |>
  mutate(
    date = date |>
      as.integer() |> as.character() |>
      lapply(function(x){ paste(substr(x, 1, 2), substr(x, 3, 4), substr(x, 5, 6), sep="/") }) |> unlist() |>
      as.Date()
  ) |>
  rename(
    filter = `fil. type`, 
    secchi_depth = `clarity (secchi plate)`,
    "presence" = `parasite presence`,
    "replication" = "rep.",
    "location" = "Locality") |>
  mutate(secchi_depth = replace_values(secchi_depth,
                                         from=c("2*" ),
                                         to=("2"))) |>
  mutate(secchi_depth=as.numeric(secchi_depth)) |>
  mutate(volume = as.numeric(volume), presence = as.logical(presence)) |>
  filter(replication == 1, filter=="A") |> select(!replication & !volume & !filter) |>
  mutate(samplingId = paste0(location, date)) -> env2

all(data2$samplingId %in% env2$samplingId)
all(env2$samplingId %in% data2$samplingId)

write.table(env2, file="/home/danielred/data/work/projects/eDNA_filters/environment.tsv", sep="\t", col.names = T, row.names = F, na="NA")
env3 <- read.table("/home/danielred/data/work/projects/eDNA_filters/environment.tsv", header=T)
all(env2==env3, na.rm = T)
all(is.na(env2)==is.na(env3))

write.table(data2, file="/home/danielred/data/work/projects/eDNA_filters/data.tsv", sep="\t", col.names = T, row.names = F, na="NA")
data3 <- read.table("/home/danielred/data/work/projects/eDNA_filters/data.tsv", header=T)
all(data2==data3, na.rm = T)
all(is.na(data2)==is.na(data3))


