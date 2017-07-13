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

```R
ext <- get_xpdf() # get pdf extractor

# get emails related to Benghazi released in December
emails_bengh <- get_emails(release = "Benghazi", extractor = ext)

# load contents
contents <- load_emails(emails_bengh)

# clean emails
contents <- clean_emails(contents)
addresses <- extract_address(contents) # extract all email addresses
dates <- extract_date(emails) # extract all dates

####
# Chart in header
####

dates_c <- do.call("c", dates)
dates_count <- plyr::count(dates_c)

# devtools::install_github("JohnCoene/echarts")
library(echarts)

dates_count %>% 
  echart(x) %>% 
  earea(
    smooth = TRUE,
    freq
  ) %>% 
  emark_point(
    "all",
    data = list(
      list(type = "max", name = "maximum"),
      list(type = "min", name = "minimum")
    )
  ) %>% 
  etitle(
    text = "Number of Emails",
    subtext = "Benghazi release"
  ) %>%
  etooltip(
    trigger = "axis"
  ) %>% 
  etoolbox_full() %>% 
etheme("helianthus") 
```
