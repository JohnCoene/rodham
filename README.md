[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/rodham.svg?branch=master)](https://travis-ci.org/JohnCoene/rodham)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/JohnCoene/rodham?branch=master&svg=true)](https://ci.appveyor.com/project/JohnCoene/rodham)
[![Coverage Status](https://coveralls.io/repos/github/JohnCoene/rodham/badge.svg?branch=master)](https://coveralls.io/github/JohnCoene/rodham?branch=master)
[![codecov](https://codecov.io/gh/JohnCoene/rodham/branch/master/graph/badge.svg)](https://codecov.io/gh/JohnCoene/rodham)
[![CRAN](https://img.shields.io/cran/v/devtools.svg)]()
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/rodham)](https://cran.r-project.org/package=rodham)

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

#### Data

```R
# load emails
data(emails)

# build graph
edges <- edges_emails(emails)
g <- igraph::graph.data.frame(edges)

# plot 
plot(g)
```

#### Download contents

```R
# get pdf extractor
ext <- get_xpdf()

# get emails related to Benghazi released in December
emails_bengh <- get_emails(release = "Benghazi", extractor = ext)

# load contents
contents <- load_emails(emails_bengh)
```
