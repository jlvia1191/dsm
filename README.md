
<!-- README.md is generated from README.Rmd. Please edit that file -->

**NEWS**: Active development of dsm has moved to the [experimental branch](https://github.com/jlvia1191/dsm)

dsm
========

An implementation of the Estimation of the log likelihood of the saturated model. 

This package calculates the estimation of the log likelihood of the saturated model, 
  when the values of the outcome variable are either 0 or 1.

details
========

The saturated model is characterized by the assumptions 1 and 2 presented in section 5 by Llinas [1].  The variable of interest Y can asume 2 levels 0 or 1. We define P_j:= P(Y = 1| j) the probability that Y takes the value of 1 in the population j=1, …, J. Taking into account the annotations n_j (size of the population j) and Z_j (number of success in the population j), introduced in that paper, in the saturated model, the ML-estimations of  P_j are Z_j / n_j. Furthermore, the logarithm of the function of maximum likelihood would be L(P) = Sum(from j=1 to J) of [ Z_j ln P_j + (n_j – Z_j) ln(1 – P_j) ], where P = (P_1, …., P_J).  It is also fulfilled that L(P) < 0 for  0 < P_j < 1. 

Installation
------------

``` r
library(devtools)
install_github("jlvia1191/dsm")
```

Example Usage
-------------

``` r
 x1 <- c(68, 72, 68, 76, 69, 71, 68, 61, 69, 68)
 x2 <- c(0.00, 55.90, 0.00, 20.00, 55.90, 0.00, 27.20, 24.00, 0.00, 27.20)
 y <- c (0, 1, 0, 0, 1, 0, 0, 1, 0, 1)
 data <- data.frame (y, x1, x2)
 library(dsm)
 dsm(y~x1+x2, data)
```


