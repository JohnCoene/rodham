raw2clean <- function(x){
  temp <- splitstackshape::cSplit(x, "to", "; ", "long")
  clean <- splitstackshape::cSplit(temp, "from", "; ", "long")
  return(clean)
}

