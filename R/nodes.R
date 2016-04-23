#' Build nodes
#'
#' @description Build list of nodes and add meta-data.
#'
#' @param emails Data frame of emails as returned by \code{\link{search_emails}}
#'
#' @examples
#' \dontrun{
#' emails <- search_emails()
#'
#' nodes <- nodes_emails(emails)
#' }
#'
#' @author John Coene \email{john.coene@@gmail.com}
#'
#' @export
nodes_emails <- function(emails){
  if (missing(emails)) {
    stop("Missing emails, see searchEmails")
  }
  edges <- edges_emails(emails)
  nodes <- data.frame(label = c(as.character(edges$from),
                                as.character(edges$to)))
  nodes$weight <- 1
  nodes <- plyr::ddply(nodes, "label", plyr::summarise, weight = sum(weight))
  nodes <- plyr::arrange(nodes, plyr::desc(weight))
  return(nodes)
}
