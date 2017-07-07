#' Get pdf to text extractor (xpdf)
#'
#' @description Downloads and extracts pdf to text extractor, see details.
#'
#' @param dest Destination folder defaults to \code{getwd()}
#'
#' @details If the function fails you can download the
#' extractor manually from \url{http://www.foolabs.com/xpdf/}
#' then set it manually as shown in examples \code{\link{get_emails}}
#'
#' Tested on:
#' \itemize{
#'   \item{Windows}
#'   \item{Linux}
#' }
#'
#' @return Returns full path to \code{pdftotext} executable
#'
#' @seealso \code{\link{get_emails}}
#'
#' @author John Coene \email{jcoenep@@gmail.com}
#'
#' @export
get_xpdf <- function(dest = getwd()){
  os <- Sys.info()['sysname'] # get os
  checkOS(os, dest)
  lst <- OStoURI(os) # check os
  temp_zip <- tempfile(fileext = lst$ext) # create temp
  download.file(lst$uri, destfile = temp_zip) # download
  dec <- decompress_fun(temp_zip) # get decompress function
  dec(temp_zip, exdir = dest) # unzip
  unlink("temp_zip", recursive=TRUE) # delete temp zip once unzipped
  folder <- OS2folder(os)
  p <- list.files(paste0(dest, folder))
  p <- p[grep("pdftotext", p)]
  message("xpdf successfully uzipped, use: \n",
          dest, folder, p, "\n",
          "as extractor in get_emails")
  return(paste0(dest, folder, p))
}

