# =====================================================
# Main Functions and Methods
# =====================================================


#' @title Choose Function
#' @description calculate the number of combinations in which k successes can occur in n trials
#' @param n number of trials
#' @param k number of successes
#' @return return the number of combinations in which k successes can occur in n trials
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)
#'
#'


bin_choose <- function(n, k) {
  if (!is.numeric(n) | length(n) != 1 | n %% 1 != 0 | n < 0) {
    stop('invalid n value')
  }
  if (any(k %% 1 != 0) | any(k < 0)) {
    stop('invalid k value')
  }
  if (any(k > n)) {
    stop("k cannot be greater than n")
  }
  comb = factorial(n) / (factorial(k) * factorial(n - k))
  return(comb)
}



#' @title Binomial Probability Function
#' @description calculate the probability of k successes in n trials of a binomial distribution
#' @param trials number of trials
#' @param success number of successes
#' @param prob probability of success
#' @return return the probability of k successes in n trials of a binomial distribution
#' @export
#' @examples
#' # probability of getting 2 successes in 5 trials (assuming prob of success = 0.5)
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#'
#' # probabilities of getting 2 or less successes in 5 trials (assuming prob of success = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#'
#' # 55 heads in 100 tosses of a loaded coin with 45% chance of heads
#' bin_probability(success = 55, trials = 100, prob = 0.45)


bin_probability <- function(success, trials, prob) {
  check_prob(prob)
  check_trials(trials)
  check_success(success, trials)
  probability = bin_choose(n = trials, k = success) * prob^success * (1 - prob)^(trials - success)
  return(probability)
}




#' @title Binomial Probability Distribution
#' @description create a data frame with the binomial probability distribution
#' @param trials the number of trials
#' @param prob the probability of success
#' @return a data frame with the probability distribution: sucesses in the first column, probability in the second column
#' @export
#' @examples
#' # Binomial Probability Distribution
#' bin_distribution(trials = 5, prob = 0.5)
#'

bin_distribution <- function(trials, prob) {
  probability = bin_probability(success = 0:trials, trials = trials, prob = prob)
  df = data.frame(success = 0:trials,
                  probability = probability)
  class(df) = c("bindis", "data.frame")
  return(df)
}

#' @export
#'

plot.bindis <- function(x) {
  barplot(x$probability, names.arg = x$success,
          xlab = "successes", ylab = "probability",
          main = 'Probability Histogram')
  invisible(x)
}



#' @title Binomial Cumulative Distribution
#' @description create a data frame with the binomial cumulative probability
#' @param trials the number of trials
#' @param prob the probability of success
#' @return a data frame with both the probability distribution and the cumulative probabilities:
#'         sucesses in the first column, probability in the second column, and cumulative in the third column.
#' @export
#' @examples
#' bin_cumulative(trials = 5, prob = 0.5)



bin_cumulative <- function(trials, prob) {
  probability = bin_probability(success = 0:trials, trials = trials, prob = prob)
  cumulative = cumsum(probability)
  df = data.frame(success = 0:trials,
                   probability = probability,
                   cumulative = cumulative)
  class(df) = c("bincum", "data.frame")
  return(df)

}


#' @export

plot.bincum <- function(x) {
  plot(x$success,
       x$cumulative,
       type = "o",
       xlab = "success",
       ylab = "probability")
  invisible(x)
}



#' @title Binomial Random Variable
#' @description create a binomial random variable object
#' @param trials the number of trials
#' @param prob the probability of success
#' @return a list with two elements: trials and prob
#' @export
#' @examples
#' bin1 <- bin_variable(trials = 10, p = 0.3)
#' binsum1 <- summary(bin1)
#' binsum1
#'

bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  lst <- list(trials = trials,
              prob = prob)
  class(lst) <- "binvar"
  return(lst)
}


#' @export
print.binvar <- function(x) {
  cat("\"Binomial variable\"")
  cat("\n")
  cat("\n")
  cat("Parameters\n")
  cat("- number of traials:", x$trials)
  cat("\n")
  cat("- prob of success:", x$prob)

}

#' @export
summary.binvar <- function(x) {
  lst <- list(
    trials = x$trials,
    prob = x$prob,
    mean = aux_mean(x$trials, x$prob),
    variance = aux_variance(x$trials, x$prob),
    mode = aux_mode(x$trials, x$prob),
    skewness = aux_skewness(x$trials, x$prob),
    kurtosis = aux_kurtosis(x$trials, x$prob))
  class(lst) = "summary.binvar"
  return(lst)
}

#' @export
print.summary.binvar <- function(x){
  cat("\"Summary Binomial\"")
  cat("\n")
  cat("\n")
  cat("Parameters\n")
  cat("- number of traials:", x$trials)
  cat("\n")
  cat("- prob of success:", x$prob)
  cat("\n")
  cat("\n")
  cat("Measures\n")
  cat("-mean    :", x$mean)
  cat("\n")
  cat("-variance:", x$variance)
  cat("\n")
  cat("-mode    :", x$mode)
  cat("\n")
  cat("-skewness:", x$skewness)
  cat("\n")
  cat("-kurtosis:", x$kurtosis)
}


#' @title Mean of a Binomial Distribution
#' @description calculate the expected value of a binomial distribution
#' @param trials the number of trials
#' @param prob the probability of success
#' @return return expected value of a binomial distribution
#' @export
#' @examples
#' bin_mean(10, 0.3)
#'
#'

bin_mean <- function(trials, prob) {
  check_trials(trials = trials)
  check_prob(prob = prob)
  aux_mean(trials = trials, prob = prob)
}




#' @title Variance of a Binomial Distribution
#' @description calculate the variance of a binomial distribution
#' @param trials the number of trials
#' @param prob the probability of success
#' @return variance value of a binomial distribution
#' @export
#' @examples
#' bin_variance(10, 0.3)

bin_variance <- function(trials, prob) {
  check_trials(trials = trials)
  check_prob(prob = prob)
  aux_variance(trials = trials, prob = prob)
}



#' @title Mode of a Binomial Distribution
#' @description calculate the mode of a binomial distribution
#' @param trials the number of trials
#' @param prob the probability of success
#' @return mode value of a binomial distribution
#' @export
#' @examples
#' bin_mode(10, 0.3)


bin_mode <- function(trials, prob) {
  check_trials(trials = trials)
  check_prob(prob = prob)
  aux_mode(trials = trials, prob = prob)
}

#' @title Skewness of Binomial Distribution
#' @description the measure the asymmetry of the probability distribution of a random variable about its mean.
#' @param trials the number of trials
#' @param prob the probability of success
#' @return skewness value of a binomial distribution
#' @export
#' @examples
#' bin_skewness(10, 0.3)


bin_skewness <- function(trials, prob) {
  check_trials(trials = trials)
  check_prob(prob = prob)
  aux_skewness(trials = trials, prob = prob)
}

#' @title Kurtosis of Binomial Distribution
#' @description measure the “tailedness” of the probability distribution of a random variable.
#' @param trials the number of trials
#' @param prob the probability of success
#' @return kurtosis value of a binomial dsitribution
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)


bin_kurtosis <- function(trials, prob) {
  check_trials(trials = trials)
  check_prob(prob = prob)
  aux_kurtosis(trials = trials, prob = prob)
}
