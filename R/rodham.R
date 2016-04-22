#' rodham: search Hillary's emails
#'
#' @section Functions:
#' \itemize{
#' \item \code{\link{search_emails}}
#' \item \code{\link{edges_emails}}
#' \item \code{\link{nodes_emails}}
#' }
#'
#' @examples
#' \dontrun{
#' # fetch emails
#' emails <- search_emails()
#'
#' # build graph
#' edges <- edges_emails(emails)
#' nodes <- nodes_emails(emails)
#' g <- igraph::graph.data.frame(edges, vertices = nodes)
#'
#' plot(g)
#'
#' # plot communities
#' cm <- igraph::walktrap.community(g)
#' plot(g, vertex.color = membership(cm))
#' }
#'
#' @importFrom methods is
#'
#' @docType package
#' @name rodham
NULL
