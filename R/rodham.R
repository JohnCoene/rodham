#' rodham: Hillary Rodham Clinton emails
#'
#' @section Dataset:
#' \itemize{
#'  \item{emails}{dataset of 29444 emails}
#'  \item{hrc_names}{list that pairs sender and recipient names provided by the State Department website}
#' }
#'
#' @section Functions:
#' \itemize{
#'   \item \code{\link{search_emails}}
#'   \item \code{\link{edges_emails}}
#'   \item \code{\link{get_emails}}
#'   \item \code{\link{get_xpdf}}
#'   \item \code{\link{extract_emails}}
#'   \item \code{\link{download_emails}}
#'   \item \code{\link{load_emails}}
#'   \item \code{\link{get_subject}}
#'   \item \code{\link{get_or}}
#'   \item \code{\link{get_com}}
#'   \item \code{\link{get_interest}}
#'   \item \code{\link{get_content}}
#'   \item \code{\link{get_date}}
#' }
#'
#' @examples
#' \dontrun{
#' # get emails from internal data set
#' data("emails")
#'
#' # build graph
#' edges <- edges_emails(emails)
#' g <- igraph::graph.data.frame(edges)
#' plot(g)
#'
#' # plot communities
#' cm <- igraph::walktrap.community(g)
#' plot(cm, g)
#'
#' # get emails content
#' # get extractor to extract content from emails
#' ext <- get_xpdf()
#'
#' dir.create("./emails") # create folder to store extracted content
#'
#' # get emails released in august
#' aug_emails <- get_emails(release = "August", save.dir = "./emails",
#'                          extractor = ext)
#'
#' # alternatively
#' # download emails as zip then extract
#' download_emails("August") # download
#'
#' dir.create("emails_pdf") # create directory where to extract pdf emails to
#'
#' unzip("August.zip", exdir = "./emails_pdf")
#'
#' dir <- "emails_text"
#'
#' dir.create(dir)
#'
#' # extract emails to created directory
#' extract_emails("emails_pdf", save.dir = "./emails_text", ext = ext)
#'
#' # laod all emails
#' hrc_emails <- load_emails(dir)
#'
#' class(hrc_emails)
#'
#' # methods
#' dates <- get_date(hrc_emails)
#' communication <- get_com(hrc_emails)
#' cont <- get_content(hrc_emails) # get actual email content
#' cont <- clean_content(cont) # clean content see help
#' }
#'
#' @keywords internal
#'
#' @importFrom methods is
#' @importFrom utils URLencode download.file setTxtProgressBar txtProgressBar
#' @importFrom utils unzip untar
#'
#' @docType package
#' @name rodham
NULL
