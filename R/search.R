#' Search Rodham's emails
#'
#' @description Search Hillary Rodham Clinton's \emph{personal} emails.
#'
#' @param subject Filter by subject, defaults to \code{NULL}(no filter).
#' @param to Filter by Receiver, defaults to \code{NULL}(no filter).
#' @param from Filter by Sender, defaults to \code{NULL}(no filter).
#' @param start Filter by date range, defaults to \code{NULL}(no filter).
#' @param end Filter by date range, defaults to \code{NULL}(no filter).
#' @param internal if \code{TRUE} (default) searches the internal data set
#' (see \code{data(emails)}), if \code{FALSE} fetches the data through
#' the Wall Street journal API. \code{data(emails)} is equivalent to internal
#' \code{TRUE}
#'
#' @details There are a total of 29444 emails ranging from \code{2009-08-14} to
#' \code{2014-08-13}, please consider leaving internal to \code{TRUE} to not
#' hammer the Wall Street Journal's API.
#'
#' @examples
#' \dontrun{
#' emails <- search_emails()
#' }
#'
#' @author John Coene \email{jcoenep@@gmail.com}
#'
#' @export
search_emails <- function(subject = NULL, to = NULL, from = NULL, start = NULL,
                         end = NULL, internal = TRUE){

  if (internal == FALSE) {
    uri <- paste0("http://graphics.wsj.com/hillary-clinton-email-documents/api/",
                  "search.php?subject=", subject,
                  "&text=&to=", to,
                  "&from=", from,
                  "&start=", start,
                  "&end=", end,
                  "&sort=docDate&order=desc&docid=&limit=30000&offset=0")
    json <- jsonlite::fromJSON(uri)
    if (json$total > 0) {
      emails <- json$rows
      cat(json$total, "emails returned")
    } else if (json$total == 0){
      cat("No emails returned")
      emails <- data.frame()
    }
  } else {

    if (!is.null(subject)) {
      emails <- emails[grep(subject, emails$subject),]
    }
    if (!is.null(to)) {
      emails <- subset(emails, docDate == to)
    }
    if (!is.null(from)) {
      emails <- subset(emails, docDate == from)
    }
    if (!is.null(start)) {
      emails <- subset(emails, docDate <= start)
    }
    if (!is.null(end)) {
      emails <- subset(emails, docDate >= end)
    }
  }

  return(emails)
}
