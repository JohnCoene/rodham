#' Clean emails
#'
#' Clean emails by removing \emph{useless} lines.
#'
#' @param content list of content as returned by \code{\link{get_content}}.
#'
#' @details Example of line removed
#' \code{UNCLASSIFIED U.S. Department of State Case No. F-2014-20439 Doc No. C05765911 Date: 08/31/2015}
#' look at the source code for more details \code{clean_content}.
#'
#' @examples
#' \dontrun{
#' hrc_emails <- load_emails(emails_bengh) # load emails
#' cont <- get_content(hrc_emails)
#' cont <- clean_content(hrc_emails)
#' }
#'
#' @author John Coene \email{jcoenep@gmail.com}
#'
#' @export
clean_content <- function(content){
  if(missing(content)) stop("must pass emails")
  lapply(content, function(x){
    x <- x[!grepl("UNCLASSIFIED U.S. Department of State Case \\w+?[[:punct:]]?[[:space:]]", x)]
    x <- x[!grepl("F-[0-9]+-[0-9]+?\\sDoc\\sNo.?\\s[A-Z][0-9]{8}?\\sDate[[:punct:]]\\s[0-9]{2}[[:punct:]][0-9]{2}[[:punct:]][0-9]{4}", x)]
    x <- x[!grepl("From[[:punct:]][[:space:]]Sent[[:punct:]][[:space:]]To[[:punct:]][[:space:]]Subject[[:punct:]]", x)]
    x <- x[!grepl("RELEASE IN", x)]
    return(x)
  })
}
