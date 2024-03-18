########################################################################
# Plot of the performance metrics as a function of prevalence at given #
#  sensitivity and specificity                                         #
########################################################################

# Import
require(ggplot2)

updatePlots <- function(sensitivity, specificity,
                        showAccuracy,
                        showMcc,
                        showPpv,
                        showNpv,
                        showKappa)
{
  data <- data.frame(x = double(),
                     y = double(),
                     metric = factor())
  
  x <- seq(from = 0, to = 1, by = 0.01)
  
  
  accuracyColour <- rgb(1, 0, 0, ifelse(showAccuracy, 1, 0))
  data <- rbind(data, data.frame(x = x,
                                 y = accuracy(sensitivity, specificity, x),
                                 metric = "Accuracy"))
  
  mccColour <- rgb(0, 1, 0, ifelse(showMcc, 1, 0))
  data <- rbind(data, data.frame(x = x,
                                 y = mcc(sensitivity, specificity, x),
                                 metric = "MCC"))
  
  
  ppvColour <- rgb(0, 0, 1, ifelse(showPpv, 1, 0))
  data <- rbind(data, data.frame(x = x,
                                 y = positivePredictivity(sensitivity, specificity, x),
                                 metric = "Positive predictivity"))
  
  
  npvColour <- rgb(1, 0, 1, ifelse(showNpv, 1, 0))
  data <- rbind(data, data.frame(x = x,
                                 y = negativePredictivity(sensitivity, specificity, x),
                                 metric = "Negative predictivity"))
  
  kappaColour <- rgb(1, 0.5, 0, ifelse(showKappa, 1, 0))
  data <- rbind(data, data.frame(x = x,
                                 y = kappa(sensitivity, specificity, x),
                                 metric = "Kappa"))
  
  data$metric <- factor(data$metric, levels = c("Accuracy",
                                                "MCC",
                                                "Positive predictivity",
                                                "Negative predictivity",
                                                "Kappa"))
  
  ggplot(data, aes(x, y, colour = metric)) +
    geom_line(size = 1) +
    labs(x = "Test Set Prevalence", y = "Metric value") +
    lims(x = c(0, 1), y = c(-1,1)) +
    theme_bw() +
    theme(
      axis.text.x = element_text(size = 16),
      axis.title.x = element_text(size = 18),
      axis.text.y = element_text(size = 16),
      axis.title.y = element_text(size = 18),
      legend.title=element_blank()) +
    scale_color_manual(values=c(accuracyColour, mccColour, ppvColour, npvColour, kappaColour))
  
}

#################################################################################
# Performance metrics as a function of sensitivity, specificity and prevalence. #
#################################################################################

# Accuracy function
accuracy <- function(sensitivity, specificity, prevalence)
{
  result <- sensitivity * prevalence + (1 - prevalence) * specificity
  
  return(result)
}

# Positive predictivity
positivePredictivity <- function(sensitivity, specificity, prevalence)
{
  numerator <- prevalence * sensitivity
  denominator <- prevalence * sensitivity + (1 - prevalence) * (1 - specificity)
  
  if (specificity == 1 & sensitivity == 0)
    denominator <- 1
  
  result <- numerator/denominator
  
  return(result)
}

# Negative predictivity
negativePredictivity <- function(sensitivity, specificity, prevalence)
{
  numerator <- (1 -prevalence) * specificity
  denominator <- (1 - prevalence) * specificity + prevalence * (1 - sensitivity)
  
  if (specificity == 0 & sensitivity == 1)
    denominator <- 1  
  
  result <- numerator/denominator
  
  return(result)
}

# Matthews' correlation coefficient
mcc <- function(sensitivity, specificity, prevalence)
{
  numerator <- sensitivity + specificity - 1
  denominatorFirstTerm <- sensitivity + (1 - specificity)*(1 - prevalence)/prevalence
  denominatorSecondTerm <- specificity + (1 -sensitivity)*prevalence/(1 - prevalence) 
  denominator <- sqrt(denominatorFirstTerm * denominatorSecondTerm)
  
  if (sensitivity == 0 & specificity == 1)
    denominator <- 1
  if (sensitivity == 1 & specificity == 0)
    denominator <- 1
  
  return(numerator /denominator)
}

# Cohen's kappa coefficient
kappa <- function(sensitivity, specificity, prevalence)
{
  numerator <- 2 * (sensitivity + specificity - 1)
  denominatorFirstTerm <- sensitivity + (1 - specificity)*(1 - prevalence)/prevalence
  denominatorSecondTerm <- specificity + (1 -sensitivity)*prevalence/(1 - prevalence)
  denominator <- denominatorFirstTerm + denominatorSecondTerm
  result <- numerator/denominator
  
  return(result)
}