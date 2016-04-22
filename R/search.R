#' Search Rodham's emails
#'
#' @description Search Hillary Rodham Clinton's \emph{personal} emails.
#'
#' @param subject Filter by subject, defaults to \code{NULL}(no filter).
#' @param to Filter by Receiver, defaults to \code{NULL}(no filter).
#' @param from Filter by Sender, defaults to \code{NULL}(no filter).
#' @param start Filter by date range, defaults to \code{NULL}(no filter).
#' @param end Filter by date range, defaults to \code{NULL}(no filter).
#'
#' @details There are a total of 29444 emails ranging from \code{2009-08-14} to
#' \code{2014-08-13}.
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
                         end = NULL){
  dat <- tryCatch(et("emails", envir = em), error = function(e) e)
  if (is(dat, "error")) {
    uri <- paste0("http://graphics.wsj.com/hillary-clinton-email-documents/api/",
                  "search.php?subject=", subject,
                  "&text=&to=", to,
                  "&from=", from,
                  "&start=", start,
                  "&end=", end,
                  "&sort=docDate&order=desc&docid=&limit=30000&offset=0")
    json <- jsonlite::fromJSON(uri)
    if (json$total > 0) {
      dat <- json$rows
      cat(json$total, "emails returned")
      assign("emails", dat, envir = em)
    } else if (json$total == 0){
      cat("No emails returned")
      dat <- data.frame()
    }
  } else {
    cat("Loading previous query.")
  }
  return(dat)
}
