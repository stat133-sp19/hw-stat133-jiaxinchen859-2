library(testthat)

context("Check private auxiliary functions")

test_that("check aux_mean with true mean value", {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_is(aux_mean(10, 0.3), 'numeric')
  expect_length(aux_mean(10, 0.3), 1)
})


test_that("check aux_variance with true variance value", {
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_is(aux_variance(10, 0.3), 'numeric')
  expect_length(aux_variance(10, 0.3), 1)
})


test_that("check aux_mode with true mode value", {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_is(aux_mode(10, 0.3), 'numeric')
  expect_length(aux_mode(10, 0.3), 1)
})

test_that("check aux_skewness with true skewness value", {
  expect_equal(signif(aux_skewness(10, 0.3), 3), signif(0.2760262, 3))
  expect_is(aux_skewness(10, 0.3), 'numeric')
  expect_length(aux_skewness(10, 0.3), 1)
})

test_that("check aux_kurtosis with true kurtosis value", {
  expect_equal(signif(aux_kurtosis(10, 0.3), 3), signif(-0.1238095, 3))
  expect_is(aux_kurtosis(10, 0.3), 'numeric')
  expect_length(aux_kurtosis(10, 0.3), 1)
})
