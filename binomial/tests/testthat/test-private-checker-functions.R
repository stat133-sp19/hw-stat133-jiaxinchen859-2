library(testthat)

context("Check private checker functions")

test_that("check_prob with ok probability", {
  expect_true(check_prob(0))
  expect_true(check_prob(1))
  expect_true(check_prob(0.5))
  expect_length(check_prob(0), 1)
  expect_is(check_prob(0), 'logical')
  expect_error(check_prob(-0.5), 'invalid prob value')
  expect_error(check_prob(1.5), 'invalid prob value')

})


context("Check the number of trials")

test_that("check_trials with ok number of trials", {
  expect_true(check_trials(10))
  expect_length(check_trials(10), 1)
  expect_is(check_trials(10), 'logical')
  expect_error(check_trials(-10), 'invalid trials value')
  expect_error(check_trials(5.5), 'invalid trials value')

})


context("Check the number of successes")

test_that("check_success with ok number of successes", {
  expect_true(check_success(5, 10))
  expect_is(check_success(5, 10), 'logical')
  expect_error(check_success(10, 5), 'invalid success value')
  expect_error(check_success(5.5, 10), 'invalid success value')
  expect_error(check_success(-5, 10), 'invalid success value')


})
