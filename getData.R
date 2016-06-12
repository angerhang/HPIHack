library(dplyr)
library(jsonlite)

# import it into dataframe 
test <- fromJSON("linked.json", flatten = TRUE)
# Extract important features 
features <- c("id", "labels.en.value", "linked")
reducedData <- subset(test, select = features)

# Remove prefixes Q and P alike
ids <- reducedData$id
ids <- lapply(ids, function (x) substr(x, 2, nchar(x)))
reducedData$id = ids

# Remove boundary
mylist <- reducedData$linked
newList <- lapply(mylist, function (x) unlist(x))
newList <- newList[2:length(newList)]
newList <- c(newList, list(NULL))

reducedData$linked = newList

# Make the edges
max = max(as.numeric(reducedData$id))
reducedData$id = as.character(reducedData$id)

getLabel <- function (newId){
  current = reducedData[ which(reducedData$id == newId), ]
  str = as.character(current$labels.en.value)
  return(str)
  }

src <- c()
target <- c()
src <- vector(mode = "character", length  = 425)
target <- vector(mode = "character", length  = 425)
index = 1
for (i in 1:nrow(reducedData)) {
  current <- reducedData[i ,]
  if(is.vector(current$linked)){
    edges <- unlist(current$linked)
  } else {
    edges = c(current$linked)
  }
  
  if (length(edges) > 0) {
    for (j in 1:length(edges)) {
        if (edges[j] <= max &&
            length(getLabel(current$id)) > 0 &&
            length((getLabel(edges[j]))) > 0) {
          src[index] <- getLabel(current$id)
          target[index] <- getLabel(edges[j])
          index = index + 1
        }
    }
  }
}

networkData <- data.frame(src, target)   
simpleNetwork(networkData)