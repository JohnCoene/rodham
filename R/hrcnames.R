#' Hillary Rodham Clinton emails
#'
#' List that pairs sender and recipient names provided by the State Department website
#' with that person's commonly-used name.
#'
#' For example, \code{HRC} becomes \code{Hillary Clinton}.
#'
#' @format A data frame with 912 rows and 2 variables:
#' \describe{
#'   \item{originalName}{Original name}
#'   \item{commonName}{Commonly-used name in emails}
#' }
#' @source \url{https://github.com/wsjdata/clinton-email-cruncher/blob/master/HRCEMAIL_names.csv}
"hrc_names"
