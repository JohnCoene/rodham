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

#' Get emails communication
#'
#' Get the sender's and receiver's name.
#'
#' @title get_com: get emails sender's and receiver's name
#' @param emails list of email contents, as returned by \code{\link{load_emails}}
#' @examples
#' \dontrun{
#' emails <- load_emails("emails")
#' com <- get_com(emails)
#' }
#'
#' @rdname get_com
#' @export get_com
get_com <- function(emails){
  UseMethod("get_com")
}

#' @return data.frame of names and document id.
#'
#' @rdname get_com
#' @method get_com rodham
#' @export
get_com.rodham = function(emails) {
  x <- sapply(emails, function(x){
    x$from
  })
  y <- sapply(emails, function(x){
    x$to
  })
  data.frame(emails = names(x), from = x, to = y, row.names = 1:length(x))
}

#' Get emails original communication
#'
#' Get the senders and receivers' name of original email.
#'
#' @title get_or: get emails senders and receivers' name
#' @param emails list of email contents, as returned by \code{\link{load_emails}}
#' @examples
#' \dontrun{
#' emails <- load_emails("emails")
#' original <- get_or(emails)
#' }
#'
#' @rdname get_or
#' @export get_or
get_or <- function(emails){
  UseMethod("get_or")
}

#' @return data.frame of names and document id.
#'
#' @rdname get_or
#' @method get_or rodham
#' @export
get_or.rodham = function(emails) {
  x <- sapply(emails, function(x){
    x$originalFrom
  })
  y <- sapply(emails, function(x){
    x$originalTo
  })
  data.frame(emails = names(x), from = x, to = y, row.names = 1:length(x))
}

#' Get emails original communication
#'
#' Get the senders and receivers' name of original email.
#'
#' @title get_contents: get original emails senders and receivers' name
#' @param emails list of email contents, as returned by \code{\link{load_emails}}
#' @examples
#' \dontrun{
#' emails <- load_emails("emails")
#' contents <- get_content(emails)
#' }
#'
#' @rdname get_content
#' @export get_content
get_content <- function(emails){
  UseMethod("get_content")
}

#' @return named list (document id) of email contents.
#'
#' @rdname get_content
#' @method get_content rodham
#' @export
get_content.rodham = function(emails) {
  x <- sapply(emails, function(x){
    x$content
  })
  names(x) <- names(emails)
  return(x)
}

#' Get emails subjects
#'
#' Get emails' subjects
#'
#' @title get_subject: get emails subjects
#' @param emails list of email contents, as returned by \code{\link{load_emails}}
#' @examples
#' \dontrun{
#' emails <- load_emails("emails")
#' subjects <- get_subject(emails)
#' }
#'
#' @rdname get_subject
#' @export get_subject
get_subject <- function(emails){
  UseMethod("get_subject")
}

#' @return data.frame of emails' subjects and document id.
#'
#' @rdname get_subject
#' @method get_subject rodham
#' @export
get_subject.rodham = function(emails) {
  x <- sapply(emails, function(x){
    x$subject
  })
  data.frame(emails = names(x), subject = x, row.names = 1:length(x))
}

#' Get emails interest
#'
#' Get emails' subjects
#'
#' @title get_interest: get emails subjects
#' @param emails list of email contents, as returned by \code{\link{load_emails}}
#' @examples
#' \dontrun{
#' emails <- load_emails("emails")
#' subjects <- get_interest(emails)
#' }
#'
#' @rdname get_interest
#' @export get_interest
get_interest <- function(emails){
  UseMethod("get_interest")
}

#' @return data.frame of emails' interest and document id.
#'
#' @rdname get_interest
#' @method get_interest rodham
#' @export
get_interest.rodham = function(emails) {
  x <- sapply(emails, function(x){
    x$interesting
  })
  y <- sapply(emails, function(x){
    x$not_interesting
  })
  data.frame(emails = names(x), interesting = x, not_interesting = y, row.names = 1:length(x))
}
