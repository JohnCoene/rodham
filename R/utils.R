raw2clean <- function(x){
  temp <- splitstackshape::cSplit(x, "to", "; ", "long")
  clean <- splitstackshape::cSplit(temp, "from", "; ", "long")
  return(clean)
}

checkRelease <- function(x){
  x <- tolower(x) # norm
  if (x %in% db$name && length(x) == 1) {
    release <- db[db$name == x, "uri"]
    return(release)
  } else if(!x %in% db$name && length(x) == 1) {
    msg <- paste0(db$name, collapse = ", ")
    stop(paste0("Wrong release, can be one of: ", msg), call. = FALSE)
  } else if (length(x) > 1){
    stop("Can only pass one release", call. = FALSE)
  }
}

OStoURI <- function(x){
  if(x == "Windows"){
    uri <- "ftp://ftp.foolabs.com/pub/xpdf/xpdfbin-win-3.04.zip"
    ext <- ".zip"
  } else if (x == "Linux"){
    uri <- "ftp://ftp.foolabs.com/pub/xpdf/xpdfbin-linux-3.04.tar.gz"
    ext <- ".tar.gz"
  } else if(x == "Darwin") {
    uri <- "ftp://ftp.foolabs.com/pub/xpdf/xpdfbin-mac-3.04.tar.gz"
    ext <- ".tar.gz"
  } else {
    stop(paste0("Unrecognised operating system, download manually from \n",
                "http://www.foolabs.com/xpdf/download.html"), call. = FALSE)
  }
  lst <- list(uri = uri, ext = ext)
  return(lst)
}

decompress_fun <- function(temp_zip){
  if(length(temp_zip[grep("tar.gz", temp_zip)])){
    return(untar)
  } else if(length(temp_zip[grep("zip", temp_zip)])){
    return(unzip)
  }
}

OS2folder <- function(x){
  if(x == "Windows"){
    folder <- "win"
  } else if (x == "Linux"){
    folder <- "linux"
  } else if(x == "Darwin") {
    folder <- "mac"
  }
  folder <- paste0("/xpdfbin-", folder, "-3.04/bin64/")
  return(folder)
}

checkOS <- function(os, dest){
  dest <- substr(dest, 1, 3)
  if(os == "Windows" && !dest %in% "C:/"){
    x <- ""
    while(!tolower(x) %in% c("y", "n")){
      x <- readline(prompt = paste("You are on Windows and installing in",
                                   dest, "drive. It is adviced to install it in",
                                   "C:/ (even on 64 bit) \nProceed anyway? [y/n]\n"))
    }
    if(tolower(x) != "y") stop("Change dest directory", call. = FALSE)
  }

  if(os == "mac"){
    x <- ""
    while(!tolower(x) %in% c("y", "n")){
      x <- readline(prompt = paste0("You are running ", os, ".\n",
                                   "get_xpdf has not been tested on your OS, would you like to continue anyway?"))
    }
    if(tolower(x) != "y") stop("Change dest directory", call. = FALSE)
  }
}


lin_warn <- function(){
  os <- Sys.info()['sysname'] # get os
  if(os == "Linux"){
    x <- ""
    while(!tolower(x) %in% c("y", "n")){
      x <- readline(prompt = paste0("You are running ", os, ".\n",
                                    "get_emails makes use of the tmp folder which by defaults requires root access, ",
                                    "if so extarction will likely fail.",
                                    "\nWould you like to continue anyway?"))
    }
    if(tolower(x) != "y") stop("Download manually", call. = FALSE)
  }
}

constructEmails <- function(dir, files){
  # get contents
  contents <- lapply(1:length(files), function(x){
    x <- scan(paste0(dir, "/", files[[x]]), what="", sep="\n", blank.lines.skip = TRUE)
    list(content = x)
  })
  # document id
  ids <- toupper(gsub(".txt", "", files))
  docid <- ids
  # get metadata
  metadata <- emails[emails$docID %in% docid, ] # metadata
  metadata <- apply(metadata, 1, as.list)
  x <- mapply(c, metadata, contents, SIMPLIFY = FALSE) # merge lists
  names(x) <- ids
  structure(x, class = "rodham")
}
