library(rodham)

context("All tests")

Sys.setlocale("LC_TIME", "C")

test_that("test all", {
  # search
  emails <- search_emails()
  expect_equal(nrow(emails), 29444)
  expect_equal(ncol(emails), 9)
  expect_equal(names(emails), c("docID", "docDate", "to", "from",
                                "originalTo", "originalFrom", "subject",
                                "interesting", "not_interesting"))
  # edges
  expect_error(edges_emails())
  expect_equal(nrow(edges_emails(emails)), 795)
  expect_equal(ncol(edges_emails(emails)), 3)
  expect_equal(ncol(edges_emails(emails, "subject")), 4)
  expect_equal(names(edges_emails(emails, "subject", "docDate")),
               c("from", "to", "subject", "docDate", "freq"))
  # errors get
  expect_error(get_emails())

  #  1 email
  contents <- structure(list(C05765907 = c("Sullivan, Jacob J <SullivanJJ@state.gov> Friday, December 4, 2009 3:31 AM",
                                        "Iran", "The EU meets in the coming days, and we are hoping for a strong public - and private - position on Iran. Bill has identified 5 countries that need touching to help drive a good outcome:",
                                        "I know Huma has discussed with you, but a 2-minute discussion with each that underscores the key points reflected on your card would do the trick, if you can swing it.",
                                        "Tx. Also, the intervention, with your modifications, turned out well. The process, in this case, did not generate a good • enough product -- I tried to make it clearer and stronger this morning and your amendments helped a lot."
  )), .Names = "C05765907")

  dates <- extract_date(contents) # get dates
  expect_equal(dates, list(
    C05765907 = c(as.Date("2009-12-04"))
  ))

  address <- extract_address(contents)
  expect_equal(address, list(
    C05765907 = c("SullivanJJ@state.gov")
  ))
})
