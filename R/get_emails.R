#' Get emails and its contents
#'
#' @description Get the content of Hillary Rodham Clinton's emails by release.
#'
#' @param release Name of the batch of release of emails; see details.
#' @param save.dir Directory where to save the extracted text defaults to
#' \code{getwd()}
#' @param extractor Full path to pdf extractor (text to pdf), see details.
#'
#' @details Below are the valid values for \code{release}. They follow the
#' naming convention of the
#' \href{http://graphics.wsj.com/hillary-clinton-email-documents/}{WSJ} where
#' each released is named after the period when it was released.
#' \itemize{
#' \item Benghazi
#' \item June
#' \item July
#' \item August
#' \item September
#' \item October
#' \item November
#' \item January 7
#' \item January 29
#' \item February 19
#' \item february 29
#' \item December
#' \item Non-disclosure
#' }
#'
#' The \code{extractor} argument is the full path to your \code{pdftotext}
#' extractor; visit \href{http://www.foolabs.com/xpdf/download.html}{xpdf} to
#' download or try \code{\link{get_extractor}} which attempts to download and
#' extract the appropriate text to pdf exatractor according to your OS.
#'
#' @return Fetches email zip file from the WSJ and extract text files in
#' \code{save.dir}
#' @examples
#' \dontrun{
#' ext <- get_extractor()
#' # get emails released in august
#' emails_cuba <- get_emails(release = "August", save.dir = "C:/",
#'                      extractor = ext)
#' # use manually downloaded extractor
#' ext <- "C:/xpdfbin-win-3.04/bin64/pdftotext.exe"
#' # get emails related to Benghazi released in December
#' emails_bengh <- get_emails(release = "Benghazi", extractor = ext)
#' }
#'
#' @seealso \code{\link{get_extractor}}
#'
#' @author John Coene \email{jcoenep@gmail.com}
#'
#' @export
get_emails <- function(release, save.dir = getwd(), extractor){
  if (missing(extractor)) {
    stop("Missing extractor, see get_extractor")
  }
  if (!dir.exists(save.dir)) {
    stop("save.dir does not exist")
  }
  if(!file.exists("C:/xpdfbin-win-3.04/bin64/pdftotext.exe")){
    stop("wrong path to extractor")
  }
  # test extractor
  v <- suppressWarnings(system(paste(ext, "-v")))
  if (v != 99 && v != 0 && v != 1 && v != 2 && v != 3) {
    stop("incorrect path to extractor, see get_extractor")
  }
  uri <- checkRelease(release) # check release input and return URL
  temp_zip <- tempfile(fileext = ".zip") # create temp
  download.file(uri, destfile = temp_zip) # download
  temp_dir <- tempdir() # create dir
  unzip(zipfile = temp_zip, exdir = temp_dir) # unzip
  unlink("temp_zip", recursive = TRUE) # delete temp zip once unzipped
  files <- list.files(temp_dir)  # list files
  files <- files[grep("pdf", files)] # only take pdf
  dest <- gsub(".pdf", ".txt", files) # name destinations for extraction
  save_dir <- file.path(save.dir, paste(release)) # build path to save
  dir.create(save_dir) # create director by release name
  cat("Extracting content from", length(files), "pdf files...\n")
  pb <- txtProgressBar(style = 3)
  for (i in 1:length(files)) {
    pdf <- paste0(temp_dir,"\\", files[i])
    txt <- paste0(save_dir,"/", dest[i])
    system(paste(extractor, "-nopgbrk" , pdf, txt, sep = " "),
           wait = TRUE)
    setTxtProgressBar(pb, i/length(files))
  }
  unlink("temp_dir", recursive = TRUE) # delete temp
  close(pb)
}
