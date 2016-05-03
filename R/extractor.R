#' Get pdf to text parser (xpdf)
#'
#' @description Downloads and extracts pdf to text extractor, see details.
#'
#' @param dest Destination folder defaults to \code{C:/}
#'
#' @details If function fails (sorry) you can download the extractor manully
#' from \url{http://www.foolabs.com/xpdf/}
#'
#' @return Returns full path to pdftotext.exe
#'
#' @seealso \code{\link{get_emails}}
#'
#' @author John Coene \email{jcoenep@@gmail.com}
#'
#' @export
get_extractor <- function(dest = "C:/"){
  os <- Sys.info()['sysname'] # get os
  lst <- OStoURI(os) # check os
  temp_zip <- tempfile(fileext = lst$ext) # create temp
  download.file(lst$uri, destfile = temp_zip) # download
  unzip(zipfile = temp_zip, exdir = dest) # unzip
  unlink("temp_zip", recursive=TRUE) # delete temp zip once unzipped
  p <- list.files(paste0(dest, "xpdfbin-win-3.04/bin64/"))
  p <- p[grep("pdftotext", p)]
  message("Successfully uzipped, use: \n",
          p, "\n",
          "as extractor in get_emails FUN")
  return(p)
}

