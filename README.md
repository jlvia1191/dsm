# dsm

<!-- README.md is generated from README.Rmd. Please edit that file -->

**NEWS**: Active development of dsm has moved to the [experimental branch](https://github.com/jlvia1191/dsm)

dsm
========

An implementation of the Estimation of the log likelihood of the saturated model. 

*The development of this software was supported in part by NSF Postdoctoral Fellowship DMS-0903120*

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
 dsm(y~x1+x2, data)
```


