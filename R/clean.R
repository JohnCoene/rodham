#' Remove Comments
#'
#' Remove comments
#'
#' @param emails list of emails as returned by \code{\link{load_emails}}.
#'
#' @details Example of comment removed
#' \code{UNCLASSIFIED U.S. Department of State Case No. F-2014-20439 Doc No. C05765911 Date: 08/31/2015}
#'
#' @examples
#' \dontrun{
#' emails <- load_emails(emails_bengh) # load emails
#' emails <- rm_comments(emails)
#' }
#'
#' @author John Coene \email{jcoenep@gmail.com}
#'
#' @export
rm_comments <- function(emails){
  if(missing(emails)) stop("must pass emails")
  lapply(emails, function(x){
    x <- gsub("UNCLASSIFIED U.S. Department of State Case \\w+?[[:punct:]]?[[:space:]]", "", x)
    x <- gsub("F-[0-9]+-[0-9]+?\\sDoc\\sNo.?\\s[A-Z][0-9]{8}?\\sDate[[:punct:]]\\s[0-9]{2}[[:punct:]][0-9]{2}[[:punct:]][0-9]{4}", "", x)
    return(x)
  })
}
