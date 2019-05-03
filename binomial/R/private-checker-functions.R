# =====================================================
# Private Checker Functions
# =====================================================


# Description: to test if an input prob is a valid probability value (i.e. 0 ≤ p ≤ 1).
# Input
#   prob: probability of success
# Output
#   a valid probability value
check_prob <- function(prob) {
  if (is.numeric(prob) & length(prob) == 1 & prob >= 0 & prob <= 1) {
    return(TRUE)
  } else {
    stop('invalid prob value')
  }
}


# Description: to test if an input trials is a valid value for number of trials (i.e. n is a non-negative integer).
# Input
#   trials: number of trials
# Output
#   a valid value for number of trials
check_trials <- function(trials) {
  if (is.numeric(trials) & length(trials) == 1 & trials %% 1 == 0 & trials >= 0) {
    return(TRUE)
  } else {
    stop('invalid trials value')
  }
}


# Description: to test if an input success is a valid value for number of successes (i.e. 0 ≤ k ≤ n).
# Inputs
#   success: number of successes in n trials
#   trials: number of trials
# Output
#   a valid value for number of successes
check_success <- function(success, trials) {
  if (any(success %% 1 == 0) & any(success >= 0) & any(success <= trials)) {
    return(TRUE)
  } else {
    stop('invalid success value')
  }

}


