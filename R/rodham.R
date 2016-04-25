#' rodham: Hillary Rodham Clinton emails
#'
#' @section Dataset:
#' \itemize{
#' \item{emails}{dataset of 29444 emails}
#' }
#'
#' @section Functions:
#' \itemize{
#' \item \code{\link{search_emails}}
#' \item \code{\link{edges_emails}}
#' \item \code{\link{get_emails}}
#' \item \code{\link{get_extractor}}
#' }
#'
#' @examples
#' \dontrun{
#' # get emails from internal data set
#' data("emails")
#'
#' # fetch emails from WSJ (avoid doing this)
#' # emails <- search_emails()
#'
#' # build graph
#' edges <- edges_emails(emails)
#' g <- igraph::graph.data.frame(edges)
#'
#' plot(g)
#'
#' # plot communities
#' cm <- igraph::walktrap.community(g)
#' plot(g, vertex.color = membership(cm))
#'
#' # get extractor to get emails
#' ext <- get_extractor()
#' # get emails released in august
#' emails_cuba <- get_emails(release = "August", save.dir = "C:/",
#'                      extractor = ext)
#' }
#'
#' @importFrom methods is
#'
#' @docType package
#' @name rodham
NULL
