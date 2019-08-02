# Autor: Alfredo Sánchez Alberca (asalber@ceu.es)
# PSA-purification

# Load packages
.packages <- c("tidyverse", "pander")
.installed <- .packages %in% installed.packages()
if (length(.packages[!.installed])>0) install.packages(.packages[!.installed])
lapply(.packages, require, character.only=T)

# Pander options
panderOptions('table.alignment.default', function(df) ifelse(sapply(as.data.frame(df), is.numeric), 'right', 'left'))
panderOptions('table.alignment.rownames', "left")
panderOptions('keep.line.breaks', TRUE)

# Data loading
data <- read.csv(file="data/psa-data.csv", header=T, sep=",")
# Reorder peak levels
data$Peak = factor(data$Peak, levels(data$Peak)[c(1, 3:10, 2)])

# Data preprocessing
data <- mutate(data, Variation = Before - After)
# Remove NA
data <- data[complete.cases(data), ]

# Select variables


