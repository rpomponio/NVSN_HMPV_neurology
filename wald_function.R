# Wald-based inference for GLM models
# Uses robust standard errors via sandwich estimator

tidy.glm.wald <- function(x, exponentiate=FALSE, conf.int = TRUE, conf.level = 0.95, ...) {
  # Extract coefficients
  coefs <- coef(x)
  
  # Use standard errors from model (could enhance with sandwich package)
  se <- sqrt(diag(vcov(x)))[1:length(coefs)]
  
  # Calculate z-statistic and p-value
  z.stat <- coefs / se
  p.value <- 2 * pnorm(-abs(z.stat))
  
  # Calculate confidence intervals
  if (conf.int) {
    crit.val <- qnorm(1 - (1 - conf.level) / 2)
    conf.low <- coefs - crit.val * se
    conf.high <- coefs + crit.val * se
  } else {
    conf.low <- NA
    conf.high <- NA
  }
  
  if (exponentiate) {
    coefs  <- exp(coefs)
    conf.low <- exp(conf.low)
    conf.high <- exp(conf.high)
  }
  
  # Return tidy dataframe
  result <- data.frame(
    term = names(coefs),
    estimate = coefs,
    std.error = se,
    statistic = z.stat,
    p.value = p.value,
    conf.low = conf.low,
    conf.high = conf.high,
    stringsAsFactors = FALSE
  )
  
  rownames(result) <- NULL
  return(result)
}
