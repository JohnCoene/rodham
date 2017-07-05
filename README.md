[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/rodham.svg?branch=master)](https://travis-ci.org/JohnCoene/rodham)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/JohnCoene/rodham?branch=master&svg=true)](https://ci.appveyor.com/project/JohnCoene/rodham)
[![Coverage Status](https://coveralls.io/repos/github/JohnCoene/rodham/badge.svg?branch=master)](https://coveralls.io/github/JohnCoene/rodham?branch=master)
[![codecov](https://codecov.io/gh/JohnCoene/rodham/branch/master/graph/badge.svg)](https://codecov.io/gh/JohnCoene/rodham)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/rodham)](https://cran.r-project.org/package=rodham)
[![CRAN_status](http://www.r-pkg.org/badges/version-ago/rodham)](http://www.r-pkg.org/badges/version-ago/rodham)
[![CRAN_DL_Badge](http://cranlogs.r-pkg.org/badges/grand-total/rodham)](http://cranlogs.r-pkg.org/badges/grand-total/rodham)

# rodham

Fetch and process Hillary Rodham Clinton's *personal* emails. See [site](http://john-coene.com/packages/rodham/) for more details.

## Installation

You can install rodham from CRAN or Github with:

```R
# from CRAN
install.packages("rodham")

# dev version
devtools::install_github("JohnCoene/rodham")
```

## Example

```R
# load emails
data(emails)

# build graph
edges <- edges_emails(emails)
g <- igraph::graph.data.frame(edges)

# plot 
plot(g)

# get pdf extractor
ext <- get_xpdf()

# get emails related to Benghazi released in December
emails_bengh <- get_emails(release = "Benghazi", extractor = ext)
files <- list.files(emails_bengh) # list files
content <- lapply(1:length(files), function(x){
    readLines(paste0(emails_bengh, "/", files[[x]]))
})
```
