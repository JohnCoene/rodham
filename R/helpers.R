#' load emails from text files
#'
#' Load all emails.
#'
#' @param dir directory where \code{txt} emails can be found.
#'
#' @return named \code{list} of emails; names are file names without extension.
#'
#' @examples
#' \dontrun{
#' # get xpdf extractor
#' ext <- get_xpdf()
#'
#' # create
#' dir.create("emails")
#'
#' # get emails released in august
#' emails_aug <- get_emails(release = "August", save.dir = "./emails",
#'                      extractor = ext)
#'
#' # use manually downloaded extractor
#' # ext <- "C:/xpdfbin-win-3.04/bin64/pdftotext.exe"
#'
#' # get emails related to Benghazi released in December
#' emails_bengh <- get_emails(release = "Benghazi", extractor = ext,
#'                            save.dir = "./emails")
#'
#' contents <- load_emails(emails_bengh)
#' }
#'
#' @author John Coene \email{jcoenep@gmail.com}
#'
#' @export
load_emails <- function(dir){
  files <- list.files(dir) # list files
  content <- lapply(1:length(files), function(x){
    scan(paste0(dir, "/", files[[x]]), what="", sep="\n", blank.lines.skip = TRUE)
  })
  names(content) <- gsub(".txt", "", files) # name
  return(content)
}

#' Extract date
#'
#' Exctract dates from emails
#'
#' @param emails list of email contents, as returned by \code{\link{load_emails}}
#'
#' @return named \code{list} of dates where names are emails/files name.
#'
#' @examples
#' \dontrun{
#' # get xpdf extractor
#' ext <- get_xpdf()
#'
#' # create
#' dir.create("emails")
#'
#' # get emails released in august
#' emails_aug <- get_emails(release = "August", save.dir = "./emails",
#'                      extractor = ext)
#'
#' # use manually downloaded extractor
#' # ext <- "C:/xpdfbin-win-3.04/bin64/pdftotext.exe"
#'
#' # get emails related to Benghazi released in December
#' emails_bengh <- get_emails(release = "Benghazi", extractor = ext,
#'                            save.dir = "./emails")
#'
#' contents <- load_emails(emails_bengh)
#'
#' dates <- extract_date(contents)
#' }
#'
#' @seealso \code{\link{load_emails}}
#'
#' @author John Coene \email{jcoenep@gmail.com}
#'
#' @export
extract_date <- function(emails){
  d <- stringr::str_extract_all(string = emails, pattern = '\\w+\\s\\d+(st)?(nd)?(rd)?(th)?,\\s+\\d+')
  d <- lapply(d, function(x){
    as.Date(x, "%B %d, %Y")
  })
  names(d) <- names(emails)

  return(d)
}

#' Extract email addresses
#'
#' Exctract email addresses from emails
#'
#' @param emails list of email contents, as returned by \code{\link{load_emails}}
#'
#' @return named \code{list} of dates where names are emails/files name.
#'
#' @examples
#' \dontrun{
#' # get xpdf extractor
#' ext <- get_xpdf()
#'
#' # create
#' dir.create("emails")
#'
#' # get emails released in august
#' emails_aug <- get_emails(release = "August", save.dir = "./emails",
#'                      extractor = ext)
#'
#' # use manually downloaded extractor
#' # ext <- "C:/xpdfbin-win-3.04/bin64/pdftotext.exe"
#'
#' # get emails related to Benghazi released in December
#' emails_bengh <- get_emails(release = "Benghazi", extractor = ext,
#'                            save.dir = "./emails")
#'
#' contents <- load_emails(emails_bengh)
#'
#' addresses <- extract_address(contents)
#' }
#'
#' @seealso \code{\link{load_emails}}
#'
#' @author John Coene \email{jcoenep@gmail.com}
#'
#' @export
extract_address <- function(emails){
  pat <- '([_a-zA-z0-9-]+(\\.[_a-zA-z0-9-]+)*@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*(\\.[a-z]{2,4}))'
  d <- stringr::str_extract_all(string = emails, pattern = pat)
  names(d) <- names(emails)
  return(d)
}
