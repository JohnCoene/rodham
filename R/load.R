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
  constructEmails(dir, files)
}
