# binomial

<!-- badges: start -->
<!-- badges: end -->

The goal of binomial is to implement functions for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the expected value, variance, etc.

## Installation

You can install the released version of binomial from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("binomial")
```

## Usage

This is a basic example which shows you how to solve a common problem:

``` r
library(binomial)

# the number of combinations in which k successes can occur in n trials
bin_choose(n = 5, k = 2)
#> 10


# binomial probability
bin_probability(success = 2, trials = 5, prob = 0.5)
#> 0.3125


# binomial probability distribution
bin_distribution(trials = 5, prob = 0.5)
       success probability
#>  1       0     0.03125
#>  2       1     0.15625
#>  3       2     0.31250
#>  4       3     0.31250
#>  5       4     0.15625
#>  6       5     0.03125


# binomial cumulative distribution
bin_cumulative(trials = 5, prob = 0.5)
#> success probability cumulative
#>    0      0.03125     0.03125
#>    1      0.15625     0.18750
#>    2      0.31250     0.50000
#>    3      0.31250     0.81250
#>    4      0.15625     0.96875
#>    5      0.03125     1.00000


# print summary of a binomial random variable object.
bin1 <- bin_variable(trials = 10, p = 0.3) 
bin1
#> "Binomial variable"
#>
#>
#> Paramaters
#> - number of trials: 10
#> - prob of success : 0.3


# summary measures of a binomial distribution
bin_mean(10, 0.3)
#>  3

bin_variance(10, 0.3)
#>  2.1

bin_mode(10, 0.3)
#>  3

bin_skewness(10, 0.3)
#>  0.2760262

bin_kurtosis(10, 0.3)
#>   -0.1238095
```

