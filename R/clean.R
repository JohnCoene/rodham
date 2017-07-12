#' Clean emails
#'
#' Clean emails by removing \emph{useless} lines.
#'
#' @param emails list of emails as returned by \code{\link{load_emails}}.
#'
#' @details Example of line removed
#' \code{UNCLASSIFIED U.S. Department of State Case No. F-2014-20439 Doc No. C05765911 Date: 08/31/2015}
#' look at the source code for more details \code{clean_emails}.
#'
#' @examples
#' \dontrun{
#' emails <- load_emails(emails_bengh) # load emails
#' emails <- clean_emails(emails)
#' }
#'
#' @author John Coene \email{jcoenep@gmail.com}
#'
#' @export
clean_emails <- function(emails){
  if(missing(emails)) stop("must pass emails")
  lapply(emails, function(x){
    x <- x[!grepl("UNCLASSIFIED U.S. Department of State Case \\w+?[[:punct:]]?[[:space:]]", x)]
    x <- x[!grepl("F-[0-9]+-[0-9]+?\\sDoc\\sNo.?\\s[A-Z][0-9]{8}?\\sDate[[:punct:]]\\s[0-9]{2}[[:punct:]][0-9]{2}[[:punct:]][0-9]{4}", x)]
    x <- x[!grepl("From[[:punct:]][[:space:]]Sent[[:punct:]][[:space:]]To[[:punct:]][[:space:]]Subject[[:punct:]]", x)]
    x <- x[!grepl("RELEASE IN", x)]
    return(x)
  })
}
