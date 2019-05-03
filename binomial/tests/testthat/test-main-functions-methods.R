library(testthat)

context("Check main functions and methods functions")

test_that("check bin_choose function works as as expected", {
  expect_equal(bin_choose(n = 5, k = 2), 10)
  expect_equal(bin_choose(5, 1:3), c(5, 10, 10))
  expect_is(bin_choose(5, 2), 'numeric')
  expect_error(bin_choose(5, 10), "k cannot be greater than n")
  expect_error(bin_choose(-5, 2), 'invalid n value')
  expect_error(bin_choose(5, -2), 'invalid k value')

})


test_that("check bin_probability function works as expected", {
  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5), 0.3125)
  expect_is(bin_probability(success = 2, trials = 5, prob = 0.5), 'numeric')
  expect_error(bin_probability(success = -2, trials = 5, prob = 0.5), 'invalid success value')
  expect_error(bin_probability(success = 2, trials = -5, prob = 0.5), 'invalid trials value')
  expect_error(bin_probability(success = -2, trials = 5, prob = 2), 'invalid prob value')
})


test_that("check bin_cumulative function works as expected", {
  expect_is(bin_cumulative(trials = 5, prob = 0.5), c("bincum", "data.frame"))
  expect_equal(bin_cumulative(trials = 5, prob = 0.5)$success, 0:5)
  expect_equal(bin_cumulative(trials = 5, prob = 0.5)$probability, c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125))
  expect_equal(bin_cumulative(trials = 5, prob = 0.5)$cumulative, c(0.03125, 0.18750, 0.50000, 0.81250, 0.96875, 1.00000))
})


test_that("check bin_variable function works as expected", {
  expect_is(bin_variable(trials = 10, prob = 0.3), "binvar")

})


test_that("check bin_mean function works as expected", {
  expect_equal(bin_mean(10, 0.3), 3)
  expect_is(bin_mean(10, 0.3), 'numeric')
  expect_length(bin_mean(10, 0.3), 1)
})



test_that("check bin_variance function works as expected", {
  expect_equal(bin_variance(10, 0.3), 2.1)
  expect_is(bin_variance(10, 0.3), 'numeric')
  expect_length(bin_variance(10, 0.3), 1)
})


test_that("check bin_mode function works as expected", {
  expect_equal(bin_mode(10, 0.3), 3)
  expect_is(bin_mode(10, 0.3), 'numeric')
  expect_length(bin_mode(10, 0.3), 1)
})

test_that("check bin_skewness function works as expected", {
  expect_equal(signif(bin_skewness(10, 0.3), 3), signif(0.2760262, 3))
  expect_is(bin_skewness(10, 0.3), 'numeric')
  expect_length(bin_skewness(10, 0.3), 1)
})

test_that("check bin_kurtosis function works as expected", {
  expect_equal(signif(bin_kurtosis(10, 0.3), 3), signif(-0.1238095, 3))
  expect_is(bin_kurtosis(10, 0.3), 'numeric')
  expect_length(bin_kurtosis(10, 0.3), 1)
})



