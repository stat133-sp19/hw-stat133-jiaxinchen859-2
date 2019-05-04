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

test_that("check bin_distribution function works as expected", {
  expect_equal(bin_distribution(trials = 5, prob = 0.5)$success, 0:5)
  expect_equal(bin_distribution(trials = 5, prob = 0.5)$probability, c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125))
  expect_is(bin_distribution(trials = 5, prob = 0.5), c("bindis", "data.frame"))
  expect_error(bin_distribution(trials = 5, prob = -0.5), 'invalid prob value')
  expect_error(bin_distribution(trials = 5.5, prob = 0.5), 'invalid trials value')
})


test_that("check bin_cumulative function works as expected", {
  expect_equal(bin_cumulative(trials = 5, prob = 0.5)$success, 0:5)
  expect_equal(bin_cumulative(trials = 5, prob = 0.5)$probability, c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125))
  expect_equal(bin_cumulative(trials = 5, prob = 0.5)$cumulative, c(0.03125, 0.18750, 0.50000, 0.81250, 0.96875, 1.00000))
  expect_is(bin_cumulative(trials = 5, prob = 0.5), c("bincum", "data.frame"))
  expect_error(bin_cumulative(trials = 5, prob = -0.5), 'invalid prob value')
  expect_error(bin_cumulative(trials = 5.5, prob = 0.5), 'invalid trials value')
})



