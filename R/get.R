#' Get emails date
#'
#' Get the date on which the emails is received.
#'
#' @title get_date: get emails date
#' @param emails list of email contents, as returned by \code{\link{load_emails}}
#' @examples
#' \dontrun{
#' emails <- load_emails("emails")
#' dates <- get_date(emails)
#' }
#'
#' @rdname get_date
#' @export get_date
get_date <- function(emails){
  UseMethod("get_date")
}

#' @return data.frame of dates and document id.
#'
#' @rdname get_date
#' @method get_date rodham
#' @export
get_date.rodham = function(emails) {
  x <- sapply(emails, function(x){
    x$docDate
  })
  data.frame(emails = as.character(names(x)), dates = as.Date(x), row.names = 1:length(x))
}

#' Get emails sender
#'
#' Get the sender's name.
#'
#' @title get_from: get emails sender's name
#' @param emails list of email contents, as returned by \code{\link{load_emails}}
#' @examples
#' \dontrun{
#' emails <- load_emails("emails")
#' dates <- get_date(emails)
#' }
#'
#' @rdname get_from
#' @export get_from
get_from <- function(emails){
  UseMethod("get_from")
}

#' @return data.frame of names and document id.
#'
#' @rdname get_from
#' @method get_from rodham
#' @export
get_from.rodham = function(emails) {
  x <- sapply(emails, function(x){
    x$from
  })
  data.frame(emails = names(x), from = x, row.names = 1:length(x))
}
