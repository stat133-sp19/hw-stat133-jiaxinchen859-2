# =====================================================
# Private Auxiliary Functions
# =====================================================


# Description: to calculate the expected value or mean of a binomial distribution
# Inputs
#   success: number of successes
#   trials: number of trials
# Output
#   the expected value or mean of a binomial distribution
aux_mean <- function(trials, prob) {
  mean = trials * prob
  return(mean)
}


# Description: to calculate the variance of a binomial distribution
# Inputs
#   success: number of successes
#   trials: number of trials
# Output
#   the variance value of a binomial distribution
aux_variance <- function(trials, prob) {
  variance = trials * prob * (1 - prob)
  return(variance)
}


# Description: to calculate the most likely number of success in n independent trials
#              with probability p of success on each trial is m
# Inputs:
#   success: number of successes
#   trials: number of trials
# Output
#   the mode value of a binomial distribution
aux_mode <- function(trials, prob) {
  m = trials * prob + prob
  if (m %% 1 == 0) {
    mode = c(m, m-1)
    return(mode)
  } else {
    mode = floor(m)
    return(mode)
  }
}


# Description: Skewness is a measure of the asymmetry of the probability distribution of
#              a random variable about its mean.
# Inputs:
#   success: number of successes in n trials
#   trials: number of trials
# Output
#   the shewness value of a binomial distribution
aux_skewness <- function(trials, prob) {
  skewness = (1 - 2 * prob) / sqrt(trials * prob * (1 - prob))
  return(skewness)
}


# Description: Kurtosis is a measure of the “tailedness” of the probability distribution of a random variable.
# Inputs
#   success: number of successes in n trials
#   trials: number of trials
# Output
#   the kurtosis value of a binomial distribution
aux_kurtosis <- function(trials, prob) {
  kurtosis = (1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob))
  return(kurtosis)
}

