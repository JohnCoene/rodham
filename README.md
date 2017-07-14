[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/rodham.svg?branch=master)](https://travis-ci.org/JohnCoene/rodham)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/JohnCoene/rodham?branch=master&svg=true)](https://ci.appveyor.com/project/JohnCoene/rodham)
[![Coverage Status](https://coveralls.io/repos/github/JohnCoene/rodham/badge.svg?branch=master)](https://coveralls.io/github/JohnCoene/rodham?branch=master)
[![codecov](https://codecov.io/gh/JohnCoene/rodham/branch/master/graph/badge.svg)](https://codecov.io/gh/JohnCoene/rodham)
[![CRAN](https://img.shields.io/cran/v/rodham.svg)](https://img.shields.io/cran/v/rodham.svg)
[![CRAN_Status_Badge](http://cranlogs.r-pkg.org/badges/grand-total/rodham)](http://cranlogs.r-pkg.org/badges/grand-total/rodham)

# rodham

![benghazi](http://john-coene.com/img/thumbnails/echarts.png)

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

See "how-to" vignette for more examples! 

```R
ext <- get_xpdf() # get pdf extractor

# get emails related to Benghazi released in December
emails_bengh <- get_emails(release = "Benghazi", extractor = ext)

# load contents
hrc_emails <- load_emails(emails_bengh)

print(hrc_emails)
#> 4366 emails

# get emails content
cont <- get_content(hrc_email)

# clean emails
cont <- clean_content(cont)

####
# Chart in header
####

# devtools::install_github("JohnCoene/echarts")
library(echarts)
library(dplyr)

communication <- get_com(hrc_emails) # number of other get_* methods exist

communication %>%
  filter(from != "") %>%
  count(from) %>%
  echart(from) %>%
  ecloud(n) %>%
  etitle(text = "Email senders", subtext = "Benghazi release") %>%
  etheme("helianthus")
```

## Resources

* [Search the emails online with the WSJ](http://graphics.wsj.com/hillary-clinton-email-documents/) - `hrc_names` in package
* [Handy list of names from WSJ](https://github.com/wsjdata/clinton-email-cruncher/blob/master/HRCEMAIL_names.csv)
