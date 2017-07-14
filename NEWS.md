# rodham 0.1.0

## Additions

* `hrc_names` [list of names from WSJ](https://github.com/wsjdata/clinton-email-cruncher/blob/master/HRCEMAIL_names.csv)
* `clean_content` function to clean comments and other *less useful* lines added.
* `load_emails` function to load all downloaded emails added; returns object of class `rodham`.
* `download_emails` function added to download specific release.
* `extract_emails` function to parse downloaded emails (`download_emails`).
* `get_*` get methods to retrieve metadata and content from emails (`rodham` class).

## Bug fixes

* `get_xpdf` now returns the correct path.
* `get_xpdf` tested on Windows and Ubuntu.

# rodham 0.0.2

## Bug fixes

* Fixed `get_xpdf` function: now correctly returns path to extractor

## Minor changes

* Changed `get_xpdf` default `dest` argument to `getwd()`
* Checks for extractor location as it cannot be used in D: drive on windows (must be in C:) 

# rodham 0.0.2

* Added `get_xpdf` to download and unzip [xpdf](http://www.foolabs.com/xpdf).
* Added `get_email` to download actual email contents
* Removed useless `nodes_emails` FUN
* Added "how-to" vignette

# rodham 0.0.1

* Added a `NEWS.md` file to track changes to the package.



