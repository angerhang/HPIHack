president <- read.csv("presidents.csv")
newtime <- president$time
newtime <- lapply(newtime, function(x) paste(substr(x, 1, 4), "-",substr(x, 5, 6), "-", substr(x, 7, 8), sep = ""))
president$time <- as.character(newtime)
write.csv(president, "newPresidents.csv")


# Clean up humans 
id1 <- humans$Q1868
id2 <- nonhumans$Q801
ids <- c(id1, id2)
ids <- lapply(ids, function(x) substr(x ,2 , nchar(x)))

quality1 <- humans$X0.16091954022988506
quality2 <- nonhumans$X0.3830979055041403
quality <- c(quality1, quality2)
 
toAdd <- vector(mode = "numeric", length = length(quality))
for (i in 1:length(quality)) {
  
}