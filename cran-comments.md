## Test environments
* local OS X install, R 3.3.0
* ubuntu 12.04 (on travis-ci), R 3.3.2
* win-builder (devel and release)

# Third submission (2017-01-19)

## R CMD check results
There were no ERRORs or WARNINGs. 

0 errors | 0 warnings | 0 note

# Second submission (2016-03-07)

0 errors | 0 warnings | 1 note

* Feedback: imports from `Utils` missing, fixed with: importFrom utils URLencode download.file setTxtProgressBar txtProgressBar unzip
* `no visible binding for global variable` NOTEs fixed
* NOTE remaining: `found 59 marked UTF-8 strings` ~ R (>= 2.10) dependency in description

# First submission (2016-05-03)

## R CMD check results

0 errors | 0 warnings | 2 notes

* This is a new release.
* `no visible binding for global variable`... No actual global variables, unquoted variables used *mainly* in `plyr` package FUN. 
* `found 59 marked UTF-8 strings` "fixed" by adding R (>= 2.10) dependency in description

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

