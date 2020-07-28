# Autor: Alfredo Sánchez Alberca (asalber@ceu.es)
# PSA-purification

# Data loading
data <- read.csv(file="data/data-psa.csv", header=T, sep=",", stringsAsFactors = T)
data.recovery <- read.csv(file="data/data-recovery.csv", header=T, sep=",", stringsAsFactors = T)
# Reorder peak levels
data$Peak = factor(data$Peak, levels(data$Peak)[c(1, 3:10, 2)])

# Remove NA
data <- data[complete.cases(data), ]

# Filters
data.purified <- data[data$Type == "Purified", ]
data.non.purified <- data[data$Type == "Non-purified", ]


