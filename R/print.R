#' @export
print.rodham <- function(x, ...) {
  writeLines(
    sprintf("%s emails", length(x))
  )
}
