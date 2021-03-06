# dsm.R


#' @title Estimation of the log likelihood of the saturated model
#' @description This package calculates the estimation of the log likelihood of the saturated model, when the values of the outcome variable are either 0 or 1.
#' @param formula An expression of the form y ~ model, where y is the outcome variable (binary or dichotomous: its values are 0 or 1).
#' @param data an optional data frame, list or environment (or object coercible by as.data.frame to a data frame) containing the variables in the model. If not found in data, the variables are taken from environment(formula), typically the environment from which dsm is called.
#' @return Value of the estimation.
#' @details The saturated model is characterized by the assumptions 1 and 2 presented in section 5 by Llinas [1].  The variable of interest Y can asume 2 levels 0 or 1. We define P_j:= P(Y=1| j) the probability that Y takes the value of 1 in the population j=1, .J. Taking into account the annotations n_j (size of the population j) and Z_j (number of success in the population j), introduced in that paper, in the saturated model, the ML-estimations of  P_j are Z_j/n_j. Furthermore, the logarithm of the function of maximum likelihood would be L(P) =Sum (from j=1 to J) of [Z_j ln P_j + (n_j - Z_j) ln(1 - P_j)], where P=(P_1, ..P_J).  It is also fulfilled that L(P) < 0 for  0 <P_j < 1.
#' @references LLINAS H., Precisiones en la teoria de modelos logisticos. Revista Colombiana de Estadistica, vol. 29, No. 2, pp. 293-265, 2006.
#' @author Humberto Llinas [aut, cre], Universidad del Norte, Barranquilla-Colombia \ Jorge Villalba [cre], Unicolombo, Cartagena-Colombia \ Omar Fabregas [cre], Universidad del Norte, Barranquilla-Colombia.
#' @examples  x1 <- c(68, 72, 68, 76, 69, 71, 68, 61, 69, 68)
#'  x2 <- c(0.00, 55.90, 0.00, 20.00, 55.90, 0.00, 27.20, 24.00, 0.00, 27.20)
#'  y <- c (0, 1, 0, 0, 1, 0, 0, 1, 0, 1)
#'  data <- data.frame (y, x1, x2)
#'  dsm(y~x1+x2, data)
#' @export
#' @import stats
#' @import reshape2






dsm <- function(formula,data){

  mf <- model.frame(formula = formula, data=data)
  z <- dcast(data = mf, formula = formula, sum, value.var = "y")
  n <- dcast(data=mf, formula = formula, fun.aggregate = length, value.var = "y")
  zj <- as.matrix(z[2, ])
  nj <- as.matrix(n[1, ] + n[2, ])
  pj <- zj/nj

  sat <- sum(ifelse( (pj) == 0 | (pj) == 1, 0, zj * log (pj) + (nj-zj) *log (1-pj) ))

  return(sat)

}





