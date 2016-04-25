## Test environments
* local OS X install, R 3.2.4
* ubuntu 12.04 (on travis-ci), R 3.2.4
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 2 notes

* This is a new release.
* `no visible binding for global variable`... No actual global variables, unquoted variables used *mainly* in `plyr` package FUN. 
* `found 59 marked UTF-8 strings` "fixed" with R (>= 2.10) dependency

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

