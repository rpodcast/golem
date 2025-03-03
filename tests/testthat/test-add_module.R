context("function add_module")


test_that("add_module", {
  with_dir(pkg, {
    remove_file("R/mod_test.R")
    add_module("test", open = FALSE)
    expect_true(file.exists("R/mod_test.R"))
    script <- list.files("R", pattern = "mod_test")
    expect_equal(tools::file_ext(script), "R")
    ## Test message of function
    if (file.exists("R/mod_output.R")) {
      file.remove("R/mod_output.R")
    }
    output <- testthat::capture_output(add_module("output", open = FALSE))
    expect_true(
      stringr::str_detect(output, "File created at R/mod_output.R")
    )
    remove_file("R/mod_test.R")
  })
})
