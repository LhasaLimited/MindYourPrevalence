#########################
# Mind your prevalence! #
#########################

# Before running this script in RStudio, make sure the "UtilityFunctions.R" file
# is in the same directory.  

# Upon execution of this script an interactive plot shows in the Plots window of
# RStudio. The plot displays the relationship between five performance metrics
# and prevalence at given values of sensitivity and specificity. The performance
# metrics are Accuracy, Matthews' correlation coefficient, positive predictivity,
# negative predictivity and Cohen's Kappa coefficient. In the top left corner of
# the Plots window there is a cog. Clicking on it displays a window with controls
# that allows the user to interact with the plot. Check boxes allow the user to
# choose which performance metric to display. Sliders allow the user to vary the
# values of sensitivity and specificity.

## Initialisation, imports and sourcing
rm(list = ls())
source("UtilityFunctions.R")
require(manipulate)

## Interactive plot of performance metrics
manipulate(updatePlots(Sensitivity, Specificity, showAccuracy, showMcc, showPpv, showNpv, showKappa),
           Sensitivity = slider(0, 1, 0.71, step = 0.01),
           Specificity = slider(0, 1, 0.89, step = 0.01),
           showAccuracy = checkbox(TRUE, "Accuracy"),
           showMcc = checkbox(TRUE, "Matthews' correlation coefficient"),
           showPpv = checkbox(TRUE, "Positive predictivity"),
           showNpv = checkbox(TRUE, "Negative predictivity"),
           showKappa = checkbox(TRUE, "Cohen's Kappa coefficient"))
