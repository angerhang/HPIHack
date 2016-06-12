president <- read.csv("presidents.csv")
newtime <- president$time
newtime <- lapply(newtime, function(x) paste(substr(x, 1, 4), "-",substr(x, 5, 6), "-", substr(x, 7, 8), sep = ""))
president$time <- as.character(newtime)
write.csv(president, "newPresidents.csv")